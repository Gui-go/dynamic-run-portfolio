FROM node:18-alpine

WORKDIR /app

COPY package.json .
RUN npm install
RUN npm install react-router-dom
RUN npm install d3-selection d3-geo d3-fetch

COPY . .

EXPOSE 3000

CMD ["npm", "start"]