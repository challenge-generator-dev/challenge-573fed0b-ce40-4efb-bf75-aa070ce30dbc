# Stage 1: Build stage - compilacion del servicio de notificaciones
FROM node:18-alpine AS builder

# Configuracion de entorno para construccion
WORKDIR /build

# Copiar archivos de dependencias primero para aprovechar cache
COPY package*.json ./

# Instalar dependencias de produccion
RUN npm ci --only=production

# Copiar codigo fuente
COPY src/ ./src/
COPY tsconfig.json ./

# Compilar TypeScript a JavaScript
RUN npm run build

# Stage 2: Production stage - imagen optimizada
FROM node:18-alpine AS production

# Configuracion de usuario no root para seguridad
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

# Variables de entorno para produccion
ENV NODE_ENV=production \
    PORT=3000 \
    SERVICE_NAME=notifications-service

# Etiquetas para mapeo de recursos
LABEL maintainer="fintech-platform" \
      service="notifications" \
      environment="production" \
      version="1.0.0"

WORKDIR /app

# Copiar solo archivos necesarios del stage anterior
COPY --from=builder --chown=nodejs:nodejs /build/dist ./dist
COPY --from=builder --chown=nodejs:nodejs /build/node_modules ./node_modules
COPY --from=builder --chown=nodejs:nodejs /build/package*.json ./

# Crear directorio para logs con permisos adecuados
RUN mkdir -p /app/logs && chown -R nodejs:nodejs /app

# Cambiar a usuario no root
USER nodejs

# Exponer puerto del servicio
EXPOSE 3000

# HEALTHCHECK para verificacion de disponibilidad
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:3000/health || exit 1

# Script de inicio con manejo de señales SIGTERM
COPY --chown=nodejs:nodejs <<'EOF' /entrypoint.sh
#!/bin/sh
# Manejo de señal de apagado graceful
trap 'echo "Recibida señal de terminación, cerrando gracefully..."; exit 0' SIGTERM SIGINT

echo "Iniciando servicio de notificaciones..."
exec node dist/index.js
EOF

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]