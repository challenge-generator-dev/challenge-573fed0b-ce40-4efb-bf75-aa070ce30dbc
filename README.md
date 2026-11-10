# Versionamiento de Infraestructura con Terraform

El objetivo es versionar la infraestructura del servicio de notificaciones utilizando Terraform. La infraestructura incluye la red y el cómputo necesarios para el servicio. El dominio es el de una plataforma de notificaciones en una empresa de fintech.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Infraestructura como codigo con Terraform |
| **Nivel** | advanced-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y entregará cada archivo con su ruta.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Un IDE o editor de código.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y entregará cada archivo con su ruta. Guárdalos en la carpeta donde quieras trabajar, respetando las rutas.
- Verifica que el proyecto arranca sin errores.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no entrega todos los archivos al terminar el análisis, escríbele: "entrégame todos los archivos con su ruta".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Configuración Inicial

**Objetivo:** Configurar el entorno para la gestión de la infraestructura con Terraform.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Identificar las necesidades de la infraestructura para el servicio de notificaciones.
- Configurar Terraform para manejar la red y el cómputo.

**Entregable:** Entorno configurado para la gestión de la infraestructura con Terraform.

<details>
<summary>Pistas de conocimiento</summary>

- Conceptos básicos de Terraform.
- Estructura de un archivo de configuración de Terraform.

</details>

### Fase 2: Definición de la Infraestructura

**Objetivo:** Definir los recursos de red y cómputo necesarios para el servicio de notificaciones.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Crear los archivos de configuración de Terraform para la red y el cómputo.
- Asegurar que los recursos definidos cumplan con los requisitos del servicio de notificaciones.

**Entregable:** Archivos de configuración de Terraform para la red y el cómputo del servicio de notificaciones.

<details>
<summary>Pistas de conocimiento</summary>

- Sintaxis de los recursos de Terraform.
- Mejores prácticas para la definición de recursos en Terraform.

</details>

### Fase 3: Aprovisionamiento y Versionamiento

**Objetivo:** Aprovisionar la infraestructura definida y versionarla.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Ejecutar los comandos de Terraform para aprovisionar la infraestructura.
- Versionar los cambios en un repositorio de control de versiones.

**Entregable:** Infraestructura aprovisionada y versionada en un repositorio de control de versiones.

<details>
<summary>Pistas de conocimiento</summary>

- Comandos básicos de Terraform para aprovisionar la infraestructura.
- Prácticas de versionamiento en repositorios de control de versiones.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Terraform y para qué se utiliza en el contexto de la infraestructura del servicio de notificaciones?
- **paraQueSirve**: ¿Cómo se utiliza Terraform para definir y aprovisionar la infraestructura del servicio de notificaciones?
- **comoSeUsa**: ¿Qué decisiones se toman al versionar la infraestructura del servicio de notificaciones con Terraform?
- **erroresComunes**: ¿Cuáles son los errores comunes al definir la infraestructura con Terraform y cómo se pueden evitar?
- **queDecisionesImplica**: ¿Qué decisiones implica el versionamiento de la infraestructura con Terraform y cómo se pueden justificar?

## Criterios de Evaluacion

- Configuración inicial del entorno para la gestión de la infraestructura con Terraform.
- Definición de los recursos de red y cómputo necesarios para el servicio de notificaciones.
- Aprovisionamiento de la infraestructura definida y versionamiento de los cambios en un repositorio de control de versiones.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT) si no tenes un agente en el IDE. Declara lo mismo que AGENTS.md; los archivos que te devuelva el chat los guardas en esta carpeta respetando las rutas.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
docker build -t reto:local . && terraform init -backend=false && terraform validate
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
