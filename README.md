# PoC for Caddy custom HTTP Status Code problem

## What Caddy does

Build & start Caddy/PHP-FPM
```
docker build --target caddy --tag caddy-http-status-poc . \
    && docker run --rm -p8080:8080 caddy-http-status-poc
```

HTTP request:
```
curl -v http://localhost:8080
```

The relevant bit of the output:
```
< HTTP/1.1 400 Bad Request
< Status: 400 foo
```

## What PHP does

Build & start PHP's built-in webserver
```
docker build --target php --tag caddy-http-status-poc-php . \
    && docker run --rm -p8080:8080 caddy-http-status-poc-php
```

HTTP request:
```
curl -v http://localhost:8080
```

The relevant bit of the output:
```
< HTTP/1.1 400 foo
```
