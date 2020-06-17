FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#2ND STEP
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
#nginx default cmd starts it up automatically
