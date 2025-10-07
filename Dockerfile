FROM n8nio/n8n:latest

# Copia la configuración personalizada si existe
COPY n8n-config.json /home/node/.n8n/n8n-config.json

# Expone el puerto 5678
EXPOSE 5678