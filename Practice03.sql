CREATE TABLE meslekler
(
id int PRIMARY KEY,
isim VARCHAR(50),
soyisim VARCHAR(50),
meslek CHAR(9),
maas int
);

INSERT INTO meslekler VALUES(1, 'Ali', 'Can', 'Doktor', '20000' );
INSERT INTO meslekler VALUES(2, 'Veli', 'Cem', 'Mühendis', '18000');
INSERT INTO meslekler VALUES(3, 'Mine', 'Bulut', 'Avukat', '17000');
INSERT INTO meslekler VALUES(4, 'Mahmut', 'Bulut', 'Ögretmen', '15000');
INSERT INTO meslekler VALUES (5, 'Mine', 'Yasa', 'Teknisyen', '13000');
INSERT INTO meslekler VALUES (6, 'Veli', 'Yilmaz', 'Hemşire', '12000');
INSERT INTO meslekler VALUES(7, 'Ali', 'Can', 'Marangoz', '10000' );
INSERT INTO meslekler VALUES(8, 'Veli', 'Cem', 'Tekniker', '14000');
-- SORU1: meslekler tablosunu isim'e göre sıralayarak sorgulayınız.

select * from meslekler order by isim;

-- SORU2: meslekler tablosunda maas'i buyukten kucuge siralayiniz

select * from meslekler order by maas desc;

-- SORU3: meslekler tablosunda isim'i 'Ali' olanları,
select isim,maas from meslekler where isim = 'Ali'order by maas desc ;

-- SORU4: meslekler tablosunda soyisim 'i 'Bulut' olanları,
-- maas sıralı olarak sorgulayınız.

select * from meslekler where soyisim ='Bulut' order by maas;

-- SORU5: meslekler tablosunda id degeri 5 den büyük olan,
-- ilk 2 veriyi listeleyiniz

select * from meslekler where id > 5 limit 2;

-- SORU6: meslekler tablosunda maası en yüksek 3 kişinin bilgilerini listeleyiniz

select * from meslekler order by maas desc limit 3;

-- SORU7: meslekler tablosunda ilk 2 veriden sonra 5 veriyi getirin

select * from meslekler offset 2 limit 5 

-- SORU8: meslekler tablosunda en yüksek maaşı alan 4. 5. 6. kişilerin bilgilerini listele

select * from meslekler order by maas desc offset 3 limit 3

create table filmler
(film_id int,
film_name varchar(30),
category varchar(30)
);
insert into filmler values (1, 'Eyvah Eyvah', 'Komedi');
insert into filmler values (2, 'Kurtlar Vadisi', 'Aksiyon');
insert into filmler values (3, 'Eltilerin Savasi', 'Komedi');
insert into filmler values (4, 'Aile Arasinda', 'Komedi');
insert into filmler values (5, 'GORA', 'Bilim Kurgu');
insert into filmler values (6, 'Organize Isler', 'Komedi');
insert into filmler values (7, 'Babam ve Oglum', 'Dram');

create table aktorler
(id int,
actor_name varchar(30),
film_id int
);
insert into aktorler values (1, 'Ata Demirer', 1);
insert into aktorler values (2, 'Necati Sasmaz', 2);
insert into aktorler values (3, 'Gupse Ozay', 3);
insert into aktorler values (4, 'Engin Gunaydin', 4);
insert into aktorler values (5, 'Cem Yilmaz', 5)

-- SORU1: Tüm film_name'leri, category'lerini ve filimlerde oynayan actor_name'leri listeleyiniz.

select film_name, category, actor_name from filmler as A left join aktorler as B
on A.film_id=B.film_id;




