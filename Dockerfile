
# Stage 1
FROM node:alpine as angular-deploy 
EXPOSE 9000
WORKDIR /app
COPY package.json package-lock.json /app/
RUN npm ci
COPY . /app
RUN  npm run build

# Stage 2
FROM nginx:alpine
COPY --from=angular-deploy /app/dist/angular-automatic-deployment /usr/share/nginx/html
EXPOSE 80