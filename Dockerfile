# Dockerfile
FROM node:24-alpine

WORKDIR /app

# Копируем зависимости и устанавливаем (включая dev для сборки)
COPY package*.json ./
RUN npm ci

# Копируем исходный код и сертификаты
COPY . .

# Сборка
RUN npm run build

# Удаляем dev-зависимости для минимизации образа
RUN npm prune --omit=dev

# Указываем Node.js, какие дополнительные CA использовать
ENV NODE_EXTRA_CA_CERTS=/app/certs/nuc-root.pem

# Порт приложения
EXPOSE 3000

# Запуск
CMD ["node", "dist/main.js"]
