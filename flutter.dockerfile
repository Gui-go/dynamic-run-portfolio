FROM ghcr.io/cirruslabs/flutter:latest AS build

WORKDIR /app

COPY flutter_app/pubspec.yaml flutter_app/pubspec.lock ./
RUN flutter pub get

COPY flutter_app/. .

# Clean auto-generated junk from host (optional but safe)
RUN rm -rf .dart_tool .packages .flutter-plugins .flutter-plugins-dependencies

RUN flutter build web --release

# 🧊 Use nginx to serve the built web app
FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
