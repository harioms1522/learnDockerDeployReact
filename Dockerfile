# each phase can be seen to be having only one FROM 
FROM node:alpine as builder
WORKDIR /app
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

#second phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

