FROM node:16.20.0-alpine AS stage1
WORKDIR /ToDoUI
COPY . .
RUN npm install
RUN npm run build

FROM nginx:alpine
COPY --from=stage1 /ToDoUI/build /usr/share/nginx/html
EXPOSE 80