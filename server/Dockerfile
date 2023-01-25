FROM node:14.14.0-alpine

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN chmod 777 /app/node_modules

RUN rm -rf ./node_modules/.cache/.eslintcache

CMD ["npm", "run", "start"]

