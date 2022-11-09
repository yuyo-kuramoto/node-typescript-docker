FROM node:18.2

WORKDIR /usr/src/app

COPY package.json ./
RUN npm install

COPY prisma/schema.prisma ./prisma/
RUN npx prisma generate

COPY . .

RUN npm run build

EXPOSE 8080
CMD ["npm","start"]