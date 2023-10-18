# Usa una imagen base de Node.js
FROM node:14

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el archivo package.json y package-lock.json al directorio de trabajo
COPY package*.json ./

# Instala las dependencias del proyecto
RUN npm install

# Copia el contenido de la carpeta "node_modules" al directorio de trabajo
COPY node_modules ./node_modules

# Copia el contenido de la carpeta "build" al directorio de trabajo
COPY build ./build

# Expone el puerto 3000 que será utilizado por la aplicación
EXPOSE 3000

# Comando para ejecutar la aplicación cuando se inicie el contenedor
CMD ["node", "build/entrypoint/api/server.js"]
