# Automatización de Tickets de Zammad con n8n

Este repositorio contiene el flujo de trabajo de n8n y la configuración de Docker necesaria para automatizar la creación y gestión de tickets en Zammad.

## Prerrequisitos

Antes de comenzar, asegúrate de tener instalado el siguiente software en tu máquina:

*   [Docker](https://docs.docker.com/get-docker/)
*   [Docker Compose](https://docs.docker.com/compose/install/)

## ⚙️ Configuración del Entorno Local

Sigue estos pasos para levantar el entorno de n8n en tu máquina local.

### 1. Clonar el Repositorio

Primero, clona este repositorio en tu máquina local.

```bash
git clone https://github.com/FolkodeGroup/zammad-integracion-whatsapp.git
cd zammad-integracion-whatsapp```

### 2. Configurar Credenciales Manualmente

Este proyecto requiere configurar las credenciales directamente en el archivo `docker-compose.yml`.

Abre el archivo `docker-compose.yml` y edita la sección `environment` con las credenciales correspondientes.

**Ejemplo de la sección a modificar:**

```yaml
# docker-compose.yml

services:
  n8n:
    image: n8nio/n8n
    # ... (otras configuraciones) ...
    environment:
      # Rellena estos valores con los datos correctos
      - N8N_BASIC_AUTH_USER=admin
      - N8N_BASIC_AUTH_PASSWORD=TU_CONTRASEÑA_PARA_N8N
      - ZAMMAD_URL=https://TU_INSTANCIA.zammad.com
      - ZAMMAD_USER=TU_USUARIO_DE_ZAMMAD
      - ZAMMAD_PASSWORD=TU_CONTRASEÑA_DE_ZAMMAD
      - ZAMMAD_TOKEN_ACCESS=TU_TOKEN_DE_ACCESO_DE_ZAMMAD
      - GENERIC_TIMEZONE=America/Argentina/Buenos_Aires

**⚠️ IMPORTANTE:** No subas (`commit`) nunca el archivo `docker-compose.yml` con tus credenciales. Este archivo debe permanecer configurado únicamente en tu entorno local.

### 3. Iniciar los Servicios

Una vez configuradas las credenciales, levanta el contenedor de n8n usando Docker Compose.

```bash
docker-compose up -d
```

Esto iniciará el contenedor de n8n en segundo plano. Puedes acceder a la interfaz web en: `http://localhost:5678`.

### 4. Importar el Flujo de Trabajo

El contenedor de n8n se inicia vacío. Debes importar manualmente el flujo de trabajo desde el archivo del repositorio.

1.  Accede a tu instancia de n8n en `http://localhost:5678`.
2.  En el menú de la izquierda, ve a la sección **Workflows**.
3.  Haz clic en el botón **Import** y selecciona **Import from File**.
4.  Busca y selecciona el archivo `.json` ubicado en la carpeta `workflows/` de este repositorio.
5.  Una vez importado, no olvides **activar el workflow** usando el interruptor en la parte superior izquierda de la pantalla de edición.

¡Listo! Tu entorno local ya está configurado y el flujo de trabajo está activo.

## 🚀 Uso Diario

Para iniciar o detener el entorno, utiliza los siguientes comandos desde la raíz del proyecto:

*   **Para iniciar el contenedor:**
    ```bash
    docker-compose up -d
    ```

*   **Para detener el contenedor:**
    ```bash
    docker-compose down
    ```