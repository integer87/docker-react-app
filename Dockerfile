FROM node:alpine as builer
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY ./ ./
CMD ["npm", "run", "build"]

FROM nginx
COPY --from=builer /usr/src/app/build /usr/share/nginx/html
