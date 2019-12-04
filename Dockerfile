#install the base Image

FROM node:alpine as builder

#Copying the files
WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

#COPY build files from builder

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

