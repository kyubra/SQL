--ALIASES
drop table if exists calisanlar
CREATE TABLE calisanlar3  (
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);
INSERT INTO calisanlar3 VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO calisanlar3 VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO calisanlar3 VALUES(345678901, 'Mine Bulut', 'Izmir');

--Eger iki sutunun verilerii birlestirmek stersek concet sembolu kullaniriz.

select calisan_id as id, calisan_isim || ' '|| calisan_dogdugu_sehir as calisan_bilgisi from calisanlar3

--2.YOl 
select calisan_id as id, concat (calisan_isim, calisan_dogdugu_sehir) as calisan_bilgisi from calisanlar3


--IS NUL CONDITITON 
-- Arama yapilan field’da NULL degeri almis kayitlari getirir

CREATE TABLE insanlar
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

select * from insanlar

select name from insanlar where name is   null 
--is null "null olan degeri getirir" || is not null "Null olmayan degerleri getirir."

select name from insanlar where name is not  null 

--Insanlar tablosunda null deger almis verileri no name olarak degistiriniz

update insanlar 
set name = 'No Name'
where name is null 


CREATE TABLE insanlar1
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar1 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar1 VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar1 VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar1 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar1 VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar1 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

--insanlar tablosundaki datalari adres'e gore siralayiniz

--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin

select * from insanlar1 where isim ='Mine' order by ssn;
--ORDER BY KOMUTU
/*

Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız
Büyükten küçüğe yada küçükten büyüğe sıralama yapabiliriz
Default olarak küçükten büyüğe sıralama yapar
Eğer BÜYÜKTEN KÜÇÜĞE sıralmak istersek ORDER BY komutundan sonra DESC komutunu kullanırız
*/


--NOT : Order By komutundan sonra field ismi yerine field numarasi da kullanilabilir
--Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin

Select * from insanlar1 where soyisim = 'Bulut' order by 4;

--Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin (DESC)
select * from insanlar1 order by ssn DESC

-- Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin

select * from insanlar1 order by isim ASC, soyisim DESC;

--Isim ve soyisim degerleri soyisim kelime uzunluklarina gore siralayiniz

/*

Eger sutun uzunluguna gore siralamk istersek lenght komutu kullaniriz.Ve yine uzunlugu buyukten kucuge siralamak 
istersek sonuna DESC komutunu ekleriz.
*/
select isim,soyisim from insanlar1 order by length (soyisim) DESC;


-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız



select isim|| ' ' || soyisim as isim_soyisim from insanlar1 order by length (isim || soyisim ) --1.yol
select isim || ' ' || soyisim as isim_soyisim from insanlar1 order by length (isim)+lenght (soyisim) --2.yol
select concat (isim, ' ', soyisim) as isim_soyisim from insanlar1 order by length (isim) + length (soyisim) --3.yoll
select concat (isim, ' ', soyisim) as isim_soyisim from insanlar1 order by length (concat(isim,soyisim))--4.yol





CREATE TABLE manav
(
isim varchar(50),
Urun_adi varchar(50),
Urun_miktar int
);

INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

select * from manav

--isme gore alinan toplam urunleri listeleyizni

select isim, sum(urun_miktar) as aldigi_toplam_urun from manav
GROUP BY isim


--isme gore alinan toplam urunleri bulun ve urunleri buyukten kucuge listeleyiniz
select isim, sum(urun_miktar) as aldigi_toplam_urun from manav
GROUP BY isim
ORDER BY isim DESC

--Urun ismine gore urunu alan toplam kisi sayisi 
select urun_adi,count (isim) from manav
group by urun_adi;


