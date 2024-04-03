--1.SORGU

SELECT ad, soyad, maas FROM calisanlar WHERE calisan_birim_id=1 OR calisan_birim_id =2

--2.SORGU

SELECT ad, soyad, maas FROM calisanlar WHERE maas IN (SELECT MAX(maas) FROM calisanlar)

--3.SORGU

SELECT birim_ad AS BirimAdý , COUNT(birim_id) AS ToplamCalisan FROM birimler JOIN calisanlar ON birimler.birim_id = calisanlar.calisan_birim_id GROUP BY birim_ad 

--4.SORGU 

SELECT unvan_calisan , COUNT(unvan_calisan_id) AS ToplamCalisanUnvan FROM unvan GROUP BY unvan_calisan

--5.SORGU

SELECT ad, soyad, maas FROM calisanlar WHERE maas BETWEEN 50000 AND 100000

--6.SORGU 

SELECT ad, soyad, birim_ad, unvan_calisan, ikramiye_ucret FROM calisanlar c JOIN birimler b ON c.calisan_birim_id = b.birim_id
JOIN unvan u ON c.calisan_id = u.unvan_calisan_id 
JOIN ikramiye i ON c.calisan_id = i.ikramiye_calisan_id
 

 --7.SORGU

 SELECT ad, soyad, unvan_calisan FROM calisanlar JOIN unvan ON calisanlar.calisan_id = unvan.unvan_calisan_id WHERE unvan_calisan IN ('Yönetici', 'Müdür')

 --8.SORGU 

SELECT c.ad, c.soyad, c.maas, c.calisan_birim_id FROM calisanlar c  JOIN (SELECT calisan_birim_id, MAX(maas) EnYüksekMaas FROM calisanlar GROUP BY calisan_birim_id) 
AS EnYüksekMaasTablo
ON c.calisan_birim_id = EnYüksekMaasTablo.calisan_birim_id AND c.maas = EnYüksekMaasTablo.EnYüksekMaas ORDER BY calisan_birim_id