FROM python:3.12-alpine

WORKDIR /app

RUN addgroup -g 10001 app && \
    adduser -D -u 10001 -G app app

RUN printf '%s\n' \
  '<!doctype html>' \
  '<html lang="es">' \
  '<meta charset="utf-8">' \
  '<title>ARWEB002</title>' \
  '<h1>ARWEB002 actualizado automaticamente - VERSION 2</h1>' \ \
  '<p>Desplegado desde GitHub Container Registry</p>' \
  > /app/index.html

RUN chown -R 10001:10001 /app

USER 10001:10001

EXPOSE 8000

CMD ["python", "-m", "http.server", "9999", "--bind", "0.0.0.0"]
