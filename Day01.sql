--database (veri tabani) olusturma
--create database kyubrra;
--dol-data definition 
--create - tabla olusturma 

CREATE TABLE ogrenciler1 
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,--ondalikli sayilar icin kullanilir(double gibi)
kayit_tarih date

);

--VAROLAN TABLODAN YENI BIR TABLO OLUSUTRMA
CREATE TABLE ogrenci_notlari
AS -- Benzer tablodaki basliklarla ve data tipleriyle yeni bir tablo olusturmak icin normal tablo olustururken ki parantezler yerine as kullanip Select komutu ile almak istedigimiz verileri aliriz.
SELECT isim,soyisim,not_ort FROM ogrenciler;

--DML -- DATA MANIPULATION LANGUAGE
--INSERT (DataBase'e veri ekleme)

INSERT INTO ogrenciler1 Values('1234567','Said','Ilhan',85.5,now());
INSERT INTO ogrenciler1 Values('1234567','Said','Ilhan',85.5,'2022-12-11');

--BIR TABLOYA PARCALLI VERI EKLEMEK ISTERSEK 
INSERT INTO ogrenciler1(isim,soyisim) VALUES ('Erol','Evren');

--DQL -Data Query Language
--SELECT

select * FROM ogrenciler1;