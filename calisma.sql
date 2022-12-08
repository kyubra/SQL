


--2) Her iki tablodaki ortak id ve isme sahip kayitlari listeleyen query yaziniz

--3) Personel tablosunda kac farkli sehirden personel var

CREATE TABLE personel ( 
id int, 
isim varchar(50), 
sehir varchar(50), 
maas int,
sirket varchar(20) 
);

DROP TABLE isciler CASCADE
INSERT INTO personel VALUES(123456789, 'Johnny Walk', 'New Hampshire', 2500, 'IBM');
INSERT INTO personel VALUES(234567891, 'Brian Pitt', 'Florida', 1500, 'LINUX'); 
INSERT INTO personel VALUES(245678901, 'Eddie Murphy', 'Texas', 3000, 'WELLS FARGO'); 
INSERT INTO personel VALUES(456789012, 'Teddy Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO personel VALUES(567890124, 'Eddie Murphy', 'Massachuset', 7000, 'MICROSOFT'); 
INSERT INTO personel VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'TD BANK'); 
INSERT INTO personel VALUES(123456719, 'Adem Stone', 'New Jersey', 2500, 'IBM');

CREATE TABLE isciler ( 
id int, 
isim varchar(50), 
sehir varchar(50), 
maas int,
sirket varchar(20)
);
INSERT INTO isciler VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO isciler VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO isciler VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM'); 
INSERT INTO isciler VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE'); 
INSERT INTO isciler VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO isciler VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE'); 
INSERT INTO isciler VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

select * from isciler
--1)Her iki tablodaki ortak id’leri ve personel tablosunda bu id’ye sahip isimleri listeleyen query yaziniz
select personel.isim, personel.id from personel inner join isciler 
on personel.id=isciler.id
SELECT isim,id
 FROM personel 
 WHERE id IN (SELECT id from isciler where isciler.id=personel.id)
--2) Her iki tablodaki ortak id ve isme sahip kayitlari listeleyen query yaziniz

select isim,id from personel 
intersect 
select isim,id from isciler 

--3) Personel tablosunda kac farkli sehirden personel var
select count (sehir) from personel 

--Personel tablosunda kac tane kayit oldugunu gosteren query yazin
select count (*) from personel

--Isciler tablosunda en yuksek maasi alan kisinin tum bilgilerini gosteren query yazin
select max (maas) as isci_max from isciler 
select * from isciler where 

--7) Personel tablosunda en dusuk maasi alan kisinin tum bilgilerini gosteren query yazin
select min (maas) as min_maas from isciler 

select * from isciler where maas in (select min (maas) from isciler)

--Isciler tablosunda ikinci en yuksek maasi maasi gosteren query yazin
select * from isciler
select max(maas)  from isciler where maas <>(select max (maas) from isciler)


--Isciler tablosunda en yuksek maasi alan iscinin disindaki tum iscilerin, tum bilgilerini gosteren query yazin

select max (maas) from isciler where maas (except
select max (maas) from isciler )

