-- Active: 1666167728966@@127.0.0.1@3306@db_relasi


/*markdown
# Membuat Table Terlebih Dahulu
*/

CREATE TABLE country (
 id int PRIMARY Key AUTO_INCREMENT,
 name_country varchar(15)
 )Engine=Innodb;

CREATE TABLE city (
  id int(11) NOT NULL AUTO_INCREMENT,
  name_city VARCHAR(15),
  country_id int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY country_id  (`country_id`),
  CONSTRAINT country_id FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
)ENGINE=Innodb;

DESC country

DESC city

/*markdown
# Menambahkan Data 
*/

/*markdown
* Tambah Data Ke dalam country
*/

INSERT INTO `country` (`id`, `name_country`) 
VALUES 
(NULL, 'Indonesia'),
(NULL, 'Philipines'),
(NULL, 'Rusia'),
(NULL, 'USA');

SELECT * FROM country

/*markdown
* Menambahkan Data Ke dalam Table City
*/

INSERT INTO `city` (`id`, `name_city`, `country_id`) 
VALUES 
(NULL, 'Jakartah', '1'),
(NULL, 'Manila', '2'),
(NULL, 'Moscow', '3'),
(NULL, 'Washington, D.C', '4');

SELECT * FROM city

/*markdown
# MULAI QUERY UNTUK JOIN
*/

/*markdown
* INNER JOIN
*/

SELECT city.name_city, country.name_country
FROM city
INNER JOIN country ON city.country_id = country.id


SELECT  city.name_city, country.name_country
FROM city
RIGHT JOIN country ON city.country_id = country.id




SELECT *, country.name_country, city.name_city
FROM country 
INNER JOIN city ON country.id = city.country_id

SELECT country.name_country, city.name_city
FROM country 
LEFT JOIN city ON country.id = city.country_id



/*markdown
# JOIN TABLE 2
*/

CREATE TABLE kategori (
 id int PRIMARY Key AUTO_INCREMENT,
 nama_kategori varchar(15)
 )ENGINE=InnoDB;

INSERT INTO `kategori` (`id`, `nama_kategori`) VALUES (NULL, 'Fiksi'), (NULL, 'Asik');

SELECT * FROM kategori

CREATE TABLE film (
  id int(11) NOT NULL AUTO_INCREMENT,
  judul_film varchar(50) NOT NULL,
  id_kategori int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY id_kategori (`id_kategori`),
  CONSTRAINT id_kategori FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id`)
)ENGINE=Innodb;

SELECT * FROM film

SELECT film.judul_film, kategori.nama_kategori
FROM film
INNER JOIN kategori ON film.id_kategori = kategori.id
