FROM racket/racket:8.12-full

WORKDIR /app

COPY scheme_web.scm .

EXPOSE 8080

CMD ["racket", "scheme_web.scm"]