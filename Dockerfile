FROM node:slim AS base

WORKDIR /usr/src/app

COPY package*.json ./
    
RUN npm install

COPY . .

EXPOSE 3000

CMD [ "npm","start" ]

FROM node:alpine3.18 as production

WORKDIR /usr/src/app

COPY package*.json ./

# RUN npm ci --only=production

COPY --from=base /usr/src/app ./

EXPOSE 3000

ENTRYPOINT ["node","./app.js"]