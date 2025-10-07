FROM n8nio/n8n:latest

# Copia la configuración personalizada si existe
COPY n8n-config.json /home/node/.n8n/n8n-config.json

# Expone el puerto 5678
EXPOSE 5678

# Copia la carpeta de flujos de trabajo
COPY workflows /workflows
# Copia el script de entrada personalizado
COPY docker-entrypoint.sh /docker-entrypoint.sh
# Usa el script como entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]