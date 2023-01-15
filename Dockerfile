FROM node:current-alpine3.16 AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build will be the one we need

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

# nginx image will take care of starting nginx
