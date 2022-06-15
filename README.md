# SpotifyTestProject
Arayüz ve api testleri Karate - Cucumber kullanılarak gerçekleştirildi.

### Arayüz Test Senaryosu
* " https://open.spotify.com/ " adresine gidilir.
* "Oturum Aç" butonuna tıklanır.
* "Kullanıcı Adı" alanına geçerli bir kullanıcı adı girilir.
* "Şifre" alanına geçerli bir şifre girilir.
* "Oturum Aç" butonuna tıklanır.
* "Çalma Listesi Oluştur" butonuna tıklanır.
* Çalma listesi adı  "MentorLabs Challenge" olarak değiştirilir.
* Sayfada bulunan "şarkı arama" alanına "Daft Punk" girilir.
* İlk sıradaki şarkı listeye eklenir.

### Api Test Senaryosu
* Bir çalma listesi oluşturulur.
* "Bohemian Rhapsody" ismi ile şarkı search isteği gerçekleştirilir.
* İlgili arama sonucu içerisinden herhangi bir şarkı, oluşturulan çalma listesine eklenir.


