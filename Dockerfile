FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#2ND STEP
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
#nginx default cmd starts it up automatically
