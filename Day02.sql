CREATE TABLE ogrenciler2 
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,--ondalikli sayilar icin kullanilir(double gibi)
kayit_tarih date

);

--Varolan bir Tablodan yeni bir taplo olusturma
CREATE TABLE NOTLAR
AS
SELECT isim,not_ort FROM ogrenciler1

select * from ogrenciler2;

--INSERT - TABLO ICINE VERI EKLEME

INSERT INTO notlar VALUES ('Kyubra',87.5);
INSERT INTO notlar VALUES ('Byushra',89.5);
INSERT INTO notlar VALUES ('Osman',90.5);
INSERT INTO notlar VALUES ('Murad',97.5);


select * from talebeler;

Create table talebeler 
(
isim varchar (10),
notlar real 
);
INSERT INTO talebeler VALUES ('Kyubra',87.5);
INSERT INTO talebeler VALUES ('Byushra',89.5);
INSERT INTO talebeler VALUES ('Osman',90.5);
INSERT INTO talebeler VALUES ('Murad',97.5);

select isim from notlar;

--CONSTRAINT
--UNIQEU
CREATE TABLE ogrenciler3 
(
ogrenci_no char(7) unique,
isim varchar(20) not null,
soyisim varchar(25),
not_ort real,--ondalikli sayilar icin kullanilir(double gibi)
kayit_tarih date

);

select * from ogrenciler3;
INSERT INTO ogrenciler3 VALUES ('1234567','Kyubra','Arslan',83.5,now());
INSERT INTO ogrenciler3 VALUES ('1234568','ALi','Veli',83.5,now());
INSERT INTO ogrenciler3 (ogrenci_no,soyisim,not_ort) VALUES ('1234569','Evren',82.3);--not null kisitlamasi oldugu icin bu veri eklenemez.

--PRIMARY KEY atamasi 
CREATE TABLE ogrenciler4 
(
ogrenci_no char(7) PRIMARY KEY,
isim varchar(20),
soyisim varchar(25),
not_ort real,--ondalikli sayilar icin kullanilir(double gibi)
kayit_tarih date
);


--PRIMARY KEY atamasi 2.yol
--eger CONSTRAINT isimini kendimiz vermek istersek bunu kullanabiliriz.

CREATE TABLE ogrenciler5 
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,--ondalikli sayilar icin kullanilir(double gibi)
kayit_tarih date,
CONSTRAINT ogrenci PRIMARY KEY(ogrenci_no)
	
);

--

CREATE TABLE ogrenciler6 
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,--ondalikli sayilar icin kullanilir(double gibi)
kayit_tarih date,
PRIMARY KEY(ogrenci_no)
	
);
--ractice 4:
--“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, “iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
--“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
--“tedarikci_id” yi Foreign Key yapin.

CREATE TABLE tedarikciler3 
(
tedarikci_id char(8) primary key,
tedarikci_ismi varchar(20),
iletisim_ismi varchar(25)
	
);

CREATE TABLE urunler
(
tedarikci_id char (5),
urun_id char (5),
	
FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)
);

Select * from tedarikciler3

/*
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama” field’lari olsun. 
“id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”, “sokak”, “cadde” ve “sehir” fieldlari olsun. 
“adres_id” field‘i ile Foreign Key oluşturun.
*/

create table calisanlar 
(
id varchar (15) PRIMARY KEY,
isim varchar (30) UNIQUE,
maas int not null,
ise_baslama date
);

create table adresle
(
adres_id varchar(30),
sokak varchar(30),
cadde varchar(30),
sehir varchar (30),

FOREIGN KEY (adres_id) REFERENCES calisanlar(id)

);

--INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14');--UNIQUE CONS. OLDUGU ICIN KABUL ETMEDI
--INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');
--INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');--UNIQUE CONS. OLDUGU ICIN KABUL ETMEDI
--INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');--syntax hatasi 
--INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');--UNIQUE CONS. OLDUGU ICIN KABUL ETMEDI
--INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');--primary key
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');--primary key hataasi 

INSERT INTO adresle VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresle VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresle VALUES('10002','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresle VALUES('10012','Ağa Sok', '30.Cad.','Antep');--
-- FK'ye null değeri atanabilir.
INSERT INTO adresle VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresle VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

select * from calisanlar1;
select *from adresle;


create table calisanlar1 
(
id varchar (15) PRIMARY KEY,
isim varchar (30) UNIQUE,
maas int CHECK (maas>10000),
ise_baslama date
);

INSERT INTO calisanlar1 VALUES('10002', 'Mehmet Yılmaz' ,19000, '2018-04-14');

--DQL -- WHERE KULLANIMI 

SELECT * FROM calisanlar;
SELECT isim FROM calisanlar;

--CALISANLAR TABLOSUNDAN MAASI 5000 DEN BUYUK OLANL ISIMLERI LISELEYINIZ.

SELECT isim,maas FROM calisanlar WHERE maas>5000 

--calisanlar tablosundan ismi veli han olan tum verileri listeleyiniz.

SELECT * FROM calisanlar WHERE isim = 'Veli Han';

--Caslisanlar tablosundan maasi 5000 olan tum verileri getirin

SELECT * FROM calisanlar WHERE maas = 5000;

--DML -- DELETE KOMUTU 
DELETE FROM calisanlar;-- Eger parent table baska bir child table ile iliskilisi ise once child table silinmelidir. 

DELETE FROM adresle;

--ADRESLER TABLOSUNDAN SEHRI ANTEP OLAN VERILERI SILELIM.
delete from adresle where sehir = 'Antep';

select * from adresle;

-- ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.


CREATE TABLE ogrenciler7
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
INSERT INTO ogrenciler7 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler7 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler7 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler7 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler7 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Ali', 99);












