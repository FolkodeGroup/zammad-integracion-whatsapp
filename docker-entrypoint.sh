#!/bin/sh

# Detiene la ejecución del script si algún comando falla.
set -e

# Espera unos segundos para dar tiempo a que n8n esté listo para aceptar comandos.
# Esto puede ser necesario en algunas máquinas más lentas.
sleep 5

# Ejecuta el comando de la CLI de n8n para importar los flujos de trabajo.
# --separate: Le dice a n8n que los flujos están en archivos JSON separados.
# --input /workflows: Le indica la carpeta DENTRO del contenedor donde debe buscar los archivos.
echo "Importando flujos de trabajo desde /workflows..."
n8n import:workflow --separate --input=/workflows

# ¡El paso más importante!
# Después de importar, 'exec n8n' le pasa el control al comando de inicio
# por defecto de n8n. Esto inicia la aplicación web principal.
# Sin 'exec', el contenedor se detendría después de ejecutar el script.
exec n8n
