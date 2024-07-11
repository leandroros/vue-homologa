# Use a imagem base do Ubuntu
FROM ubuntu:latest

# Instale as dependências necessárias
RUN apt-get update && apt-get install -y \
    nginx \
    && rm -rf /var/lib/apt/lists/*

# Copie o arquivo de configuração do Nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY . /var/www/html
# Exponha a porta que o Nginx vai usar
EXPOSE 8787

# Comando para iniciar o Nginx
CMD ["nginx", "-g", "daemon off;"]
