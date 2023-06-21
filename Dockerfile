# Dockerfile

# Utiliza Ubuntu 20.04 como base
FROM ubuntu:20.04

# Evita que se soliciten entradas del usuario durante la construcción de la imagen
ENV DEBIAN_FRONTEND=noninteractive

# Actualiza e instala los paquetes necesarios
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    nginx

RUN apt install -y libnginx-mod-rtmp 

# Define el directorio de trabajo
WORKDIR /home/app
# Copia el directorio actual en el contenedor
COPY . .

EXPOSE 80
EXPOSE 8080
EXPOSE 1935
RUN chmod +x start.sh
# Define el comando para ejecutar el contenedor
# CMD ["nginx", "-g", "daemon off;"]
CMD ["./start.sh"]