# Usa una imagen oficial de Node.js (versión 16 o superior)
FROM node:18-slim

# Instala wget, que es indispensable para que la app funcione
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos de dependencias e instala
COPY package*.json ./
RUN npm install

# Copia el resto del código
COPY . .

# Expone el puerto (Koyeb inyecta la variable PORT, pero es buena práctica documentarlo)
EXPOSE 3000

# Comando de inicio
CMD ["npm", "start"]
