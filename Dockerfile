from node:alpine as builder
workdir /app
copy package.json /app
run npm install
copy . .
run npm run build

from nginx:alpine
copy --from=builder /app/build /usr/share/nginx/html
ENTRYPOINT ["nginx", "-g", "daemon off;"]
