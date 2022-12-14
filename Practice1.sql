create table ogrenciler
(
id int,
isim varchar(40),
adres varchar(100),
sinav_notu int
);
--- INSERT:Veritabanına yeni veri ekler.
insert into ogrenciler values(120, 'Ali Can', 'Ankara', 75);
insert into ogrenciler values(121, 'Veli Mert', 'Trabzon', 85);
insert into ogrenciler values(122, 'Ayşe Tan', 'Bursa', 65);
insert into ogrenciler values(123, 'Derya Soylu', 'Istanbul', 95);
insert into ogrenciler values(124, 'Yavuz Bal', 'Ankara', 85);
insert into ogrenciler values(125, 'Emre Gül', 'Hatay', 90);
insert into ogrenciler values(126, 'Harun Reşit', 'Isparta', 100);

select * from ogrenciler;

select id,isim  from ogrenciler;

select * from ogrenciler where sinav_notu>80; 

select * from ogrenciler where adres = 'Anakara';

--SORU: Sınav notu 85 ve adresi Ankara olan öğrenci ismini listele

select isim from ogrenciler where sinav_notu ='85' and adres ='Ankara';

--SORU: .Sınav notu 65 veya 85 olan ogrencilerin tüm bilgilerini listele
select * from ogrenciler where sinav_notu=65 or sinav_notu=85

select * from ogrenciler where sinav_notu in (65,85);

select * from ogrenciler where sinav_notu between 65 and 85;

--SORU: .id'si 122 ve 125 arasında olmayan ögrencilerin isim ve sınav notu listele

select isim, sinav_notu from ogrenciler where id not between 122 and 125;

--SORU: sinav_notu 75 olan satırı siliniz

delete from ogrenciler where sinav_notu=75;
delete from ogrenciler where adres = 'Trabzon'

--SORU: ismi Derya Soylu veya Yavuz Bal olan satırları siliniz
select * from ogrenciler 
delete from ogrenciler where isim='Derya Soylu' or isim = 'Yavuz Bal'
--SORU: sınav notu 100 den küçük olan satırları siliniz
delete from ogrenciler where sinav_notu<100;

--SORU: Tablodaki tüm satırları siliniz
delete from ogrenciler;

--SORU: memurlar isminde bir tablo oluşturunuz. id, isim, maas sutunları olsun.
--id sutununun data tipi int olsun. PRİMARY KRY kısıtlaması olsun.
--isim sutununun data tipi varchar(30) olsun. UNIQUE kısıtlaması olsun.
--maas sutununun data tipi int olsun. maas 5000 buyuk olsun. NOT NULL kısıtlaması olsun.


