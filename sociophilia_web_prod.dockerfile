# Build Stage
FROM node:22-alpine AS build
WORKDIR /app
COPY . .
RUN npm install && npx expo export -p web

# Production Stage
FROM nginx:alpine
# Copy the "dist" folder from Expo build into Nginx's "read" folder
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80