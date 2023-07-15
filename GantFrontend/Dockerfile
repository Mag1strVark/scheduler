FROM node:16-alpine3.16 as build-stage

# Stage 1
WORKDIR GantFrontend/
COPY . .
RUN yarn install

ARG REACT_APP_API_URL
ENV REACT_APP_API_URL $REACT_APP_API_URL

RUN yarn run build

# Stage 2
FROM nginx:1.23.0-alpine
COPY --from=build-stage /GantFrontend/build /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf

COPY nginx/default.conf /etc/nginx/conf.d

CMD ["nginx", "-g", "daemon off;"]
