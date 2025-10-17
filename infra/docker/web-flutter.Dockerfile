FROM debian:stable-slim AS build
RUN apt-get update && apt-get install -y curl unzip xz-utils git ca-certificates && rm -rf /var/lib/apt/lists/*
WORKDIR /opt
RUN git clone https://github.com/flutter/flutter.git -b stable
ENV PATH="/opt/flutter/bin:/opt/flutter/bin/cache/dart-sdk/bin:${PATH}"
RUN flutter --version
WORKDIR /workspace
COPY apps/web_flutter /workspace
RUN flutter pub get && flutter build web

FROM nginx:alpine
COPY --from=build /workspace/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

