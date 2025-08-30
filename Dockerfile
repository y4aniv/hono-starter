FROM node:20-alpine

WORKDIR /app

RUN npm i -g pnpm

COPY package*.json ./

RUN pnpm install

COPY . .

RUN pnpm prisma generate
RUN pnpm prisma db push
RUN pnpm run build

EXPOSE 80

CMD ["node", "dist/src/index.js"]