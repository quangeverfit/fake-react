FROM node:10 as builder

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /app/package.json
COPY semantic.json /app/semantic.json

RUN npm install

COPY . /app

CMD ["npm", "run", "build"]
