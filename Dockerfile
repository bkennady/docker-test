
# Build Phase
# Install dependencies and run build
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
# Copies all of the source code into the container
COPY . .
RUN npm run build

FROM nginx
# Copy something from that other phase (builder in this case)
COPY --from=builder /app/build /usr/share/nginx/html

# START: Default command of nginx container starts container


