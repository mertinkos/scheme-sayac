FROM racket/racket:8.14

WORKDIR /app
COPY sayac.rkt .

RUN raco pkg install --auto web-server-lib

EXPOSE 10000

CMD ["racket", "sayac.rkt"]