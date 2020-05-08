FROM node:10 as build-stage

# set working directory
WORKDIR /app

COPY ./nginx.conf /nginx.conf


# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /app/package.json
# COPY semantic.json /app/semantic.json

RUN npm install

COPY . /app

# CMD ["npm", "run", "build"]

RUN npm run build


# Stage 1, based on Nginx, to have only the compiled app, ready for production with Nginx
FROM nginx:1.15

COPY --from=build-stage /app/dist/ /usr/share/nginx/html

COPY --from=build-stage /nginx.conf /etc/nginx/conf.d/default.conf
# COPY ./nginx-backend-not-found.conf /etc/nginx/extra-conf.d/backend-not-found.conf