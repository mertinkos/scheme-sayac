#lang racket
(require web-server/servlet-env
         web-server/http)

(define (sayac-sayfasi request)
  (response/xexpr
    `(html
      (head
       (title "Scheme Sayacı")
       (style "
         body { background-color: #f0f0f0; font-family: sans-serif; text-align: center; padding-top: 100px; }
         h1 { color: #2c3e50; }
         #sayac { font-size: 3em; color: #e74c3c; font-weight: bold; margin: 20px 0; font-variant-numeric: tabular-nums; }
         h2 { color: #7f8c8d; }
       "))
      (body
       (h1 "CENG212 Finali Geri Sayımı")
       (div ((id "sayac")) "Süre Hesaplanıyor...")
       (h2 "Scheme'den kurtulmamıza kalan süre...")
       (script "
         const hedefTarih = new Date('June 22, 2026 09:45:00').getTime();
         const x = setInterval(function() {
           const simdi = new Date().getTime();
           const fark = hedefTarih - simdi;
           if (Math.sign(fark) !== 1) {
             clearInterval(x);
             document.getElementById('sayac').innerHTML = 'ÖZGÜRLÜK BAŞLADI! (CENG212 BİTTİ)';
           } else {
             const gun = Math.floor(fark / (1000 * 60 * 60 * 24));
             const saat = Math.floor((fark % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
             const dakika = Math.floor((fark % (1000 * 60 * 60)) / (1000 * 60));
             const saniye = Math.floor((fark % (1000 * 60)) / 1000);
             document.getElementById('sayac').innerHTML =
               gun + ' Gün, ' + saat + ' Saat, ' + dakika + ' Dakika, ' + saniye + ' Saniye';
           }
         }, 1000);
       ")))))


(define port
  (let ([p (getenv "PORT")])
    (if p (string->number p) 8080)))

(serve/servlet sayac-sayfasi
               #:servlet-regexp #rx""
               #:port port
               #:listen-ip "0.0.0.0"
               #:command-line? #t)