FROM mhart/alpine-node:9 AS build
WORKDIR /srv
ADD package.json .
RUN npm install
ADD . .

FROM mhart/alpine-node:9
COPY --from=build /srv .
EXPOSE 1337
CMD ["node", "index.js"]