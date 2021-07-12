FROM node:erbium-buster-slim as base
LABEL mainteiner = 'Ricardo David Ortiz'
WORKDIR /dependencies
COPY package*.json ./
COPY yarn.lock ./
#Installin dependencies with yarn. With npm wont work.
RUN yarn install 
COPY ./ ./
RUN npm run build

FROM node:erbium-alpine
COPY --from=base /dependencies /bank 
WORKDIR /bank
EXPOSE 4000
CMD npm run start