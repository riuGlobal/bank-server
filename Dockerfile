FROM node:erbium-buster-slim as base
LABEL mainteiner = 'Ricardo David Ortiz'
WORKDIR /dependencies
COPY package*.json ./
RUN npm install

FROM node:erbium-alpine
COPY --from=base /dependencies /bank 
WORKDIR /bank
COPY ./ ./
EXPOSE 4000
CMD npm run start