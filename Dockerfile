# Dockerfile
FROM node:24-alpine

WORKDIR /app

# Копируем сертификат внутрь образа
COPY certs/nuc-root.pem /usr/local/share/ca-certificates/nuc-root.pem

# Копируем зависимости и устанавливаем
COPY package*.json ./
RUN npm ci --only=production

# Копируем исходный код
COPY . .

# Сборка (если используется build в production)
RUN npm run build

# Указываем Node.js, какие дополнительные CA использовать
ENV NODE_EXTRA_CA_CERTS=/usr/local/share/ca-certificates/nuc-root.pem

# Порт приложения
EXPOSE 3000

# Запуск
CMD ["node", "dist/main.js"]
