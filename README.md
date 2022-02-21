## SMSGateway
Simple SMS Gateway ini dikembangkan dengan `PHP 7` dan `GAMMU` sebagai aplikasi penghubung Perangkat SMS dan Komputer

## GAMMU
Aplikasi cross-platform untuk menghubungkan antara database SMS Gateway dengan sms devices. Aplikasi `GAMMU` berupa daemon yang berjalan secara background. Setiap saat, gammu memonitor sms devices dan database sms gateway. Apabila terdaoat SMS masuk kepada SMS devices, maka `GAMMU` menghubungkannya ke dalam inbox database SMS gateway. Sebaliknya saat Aplikasi `SMSGateway` mengirim sms ke dalam outbox database SMS gateway, maka `GAMMU` mengirimkan ke nomor tujuan melalui SMS devices, dan memindahkan SMS ke sentitem dalam database.

## SMS Devices
Alat pengirim SMS berupa modem ataupun handphone. Devices yang digunakan harus dapat terintegrasi dengan `GAMMU`.
Informasi tentang `GAMMU` dapat diakses melalui:
```bash
https://wammu.eu/gammu/
```

## Fitur
------SEGERA-------
Tahap migrasi dan diperbarui ke PHP7 menggunakan `MYSQL Converter Tool` dan penyuntingan manual.

