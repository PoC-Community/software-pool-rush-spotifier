FROM node:16-alpine
RUN mkdir -p /bloop
WORKDIR /bloop
COPY . .
EXPOSE 8080
RUN npm install
CMD [ "npm", "run", "start" ]
