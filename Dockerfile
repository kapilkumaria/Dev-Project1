FROM node:10
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
CMD node index.js
# Exposing port 3005
EXPOSE 3005
