FROM node:16-alpine AS builder

WORKDIR '/app'
COPY package.json .
RUN yarn
COPY . .
RUN yarn build

FROM nginx AS runner
COPY --from=builder /app/build /usr/share/nginx/html
