--Veritabaný oluþturma
CREATE DATABASE CompanyDB


--Tablolarý oluþturma

create table birimler (
birim_id int primary key not null,
birim_ad char(25) not null
)

create table calisanlar(
calisan_id int primary key not null,
ad char(25)  null,
soyad char(25)  null,
maas int  null,
katilmaTarihi datetime null,
calisan_birim_id int foreign key references birimler(birim_id) not null
)

create table unvan(
unvan_calisan_id int foreign key references calisanlar(calisan_id) not null,
unvan_calisan char(25)  null,
unvan_tarih datetime  null
)

create table ikramiye(
ikramiye_calisan_id int foreign key references calisanlar(calisan_id) not null,
ikramiye_ucret int  null,
ikramiye_tarih datetime  null
)

--Tablolara veri ekleme

insert into birimler (birim_id,birim_ad) values 
(1, 'Yazýlým'),
(2, 'Donaným'),
(3, 'Güvenlik')

insert into calisanlar(calisan_id,ad,soyad,maas,katilmaTarihi,calisan_birim_id) values
(1, 'Ýsmail', 'Ýþeri', 100000, '2014-02-20', 1 ),
(2, 'Hami', 'Satýlmýþ', 80000, '2014-06-11', 1 ),
(3, 'Durmuþ', 'Þahin', 300000, '2014-02-20', 2 ),
(4, 'Kaðan', 'Yazar', 500000, '2014-02-20', 3 ),
(5, 'Meryem', 'Soysaldý', 500000, '2014-06-11', 3 ),
(6, 'Duygu', 'Akþehir', 200000, '2014-06-11', 2 ),
(7, 'Kübra', 'Seyhan', 75000, '2014-01-20', 1 ),
(8, 'Gülcan', 'Yýldýz', 90000, '2014-04-11', 3 )

insert into ikramiye(ikramiye_calisan_id, ikramiye_ucret, ikramiye_tarih) values
(1, 5000, '2016-02-20'),
(2, 3000, '2016-06-11'),
(3, 4000, '2016-02-20'),
(1, 4500, '2016-02-20'),
(2, 3500, '2016-06-11')


insert into unvan(unvan_calisan_id, unvan_calisan, unvan_tarih) values 
(1, 'Yönetici','2016-02-20'),
(2, 'Personel','2016-06-11'),
(8, 'Personel','2016-06-11'),
(5, 'Müdür','2016-06-11'),
(4, 'Yönetici Yardýmcýsý','2016-06-11'),
(7, 'Personel','2016-06-11'),
(6, 'Takým Lideri','2016-06-11'),
(3, 'Takým Lideri','2016-06-11')

