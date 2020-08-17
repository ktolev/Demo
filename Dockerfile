From node:alpine as builder
WORDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 

From nginx
COPY --From=builder /app/build /usr/share/nginx