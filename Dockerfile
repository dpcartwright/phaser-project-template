FROM node:lts-gallium

# make the 'app' folder the current working directory
WORKDIR /app

# copy both 'package.json' and 'package-lock.json' (if available)
COPY package*.json ./
RUN ls
COPY ./webpack/webpack.common.cjs ./
COPY ./webpack/webpack.prod.cjs ./

# install project dependencies
RUN npm install

COPY . .

RUN npm run build

RUN ls -al /app

EXPOSE 3002 9209 28000-28100/udp
CMD [ "node", "server/server.js" ]