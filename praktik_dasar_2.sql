-- Active: 1666167728966@@127.0.0.1@3306@db_balajar_sql


/*markdown
# CATATAN PERTEMUAN 1
*/

/*markdown
# MEMBUAT TABLE DALAM DATABASE
*/

CREATE TABLE barang
(
    id_barang           INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nama_barang         Varchar(100) not NULL,
    jenis_barang        Varchar(100) not NULL,
    harga_barang        Float not NULL,
    tipe_barang         ENUM('tahan_lama','cepat'),
    jumlah_barang       int
)ENGINE = InnoDB;

/*markdown
<!-- The SQL INSERT INTO Statement

The INSERT INTO statement is used to insert new records in a table.
==========================

INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);

==========================

 -->
*/

-- DROP TABLE barang

/*markdown
<!-- MELIHAT STRUKTUR TABLE -->
*/

DESCRIBE barang

/*markdown
<!-- Menambahkan Kolom -->
*/

/*markdown
<!-- MENAMBAHKAN KOLOM -->
*/

ALTER TABLE `barang` ADD `stock_barang` INT;

/*markdown
<!-- MENAMBAHKAN DI SELA SELA TABEL -->
*/

ALTER TABLE `barang` ADD `alamat_toko` VARCHAR(100) AFTER `id_barang`;

/*markdown
<!-- MENAMBAHKAN DATA PADA TABLE -->
*/

DESC barang

/*markdown
<!-- MEMPERBAIKI NAMA KOLOM -->
*/

/*markdown
<!-- MENGEDIT NAMA KOLOM -->
*/

ALTER TABLE `barang` 
CHANGE `tipe_barang` `ketahanan_barang` ENUM('tahan_lama','cepat');

ALTER TABLE `barang` CHANGE `alamat_toko` `alamat` VARCHAR(100);

/*markdown
# MENAMBAHKAN DATA PADA TABLE 
*/

/*markdown
<!-- INSERT DATA -->
*/

INSERT INTO barang (id_barang,alamat_toko,nama_barang,jenis_barang,harga_barang,tipe_barang,jumlah_barang,stock_barang) 
VALUES
        (NULL,'KARANGASEM','AQUA','DUS',45000,'tahan_lama',20,85),
        (NULL,'BANGLI','AQUA','DUS',45000,'tahan_lama',20,20);



/*markdown
<!-- MELIHAT SEMUA DATA -->
*/

SELECT * FROM barang

/*markdown
<!-- MENAMBAHKAN BARANG KEMBALI -->
*/

DESC barang

INSERT INTO barang (id_barang,alamat,nama_barang,jenis_barang,harga_barang,ketahanan_barang,jumlah_barang,stock_barang) 
VALUES
        (NULL,'GIANYAR','AQUA','DUS',45000,'tahan_lama',20,85),
        (NULL,'KLUNGKUNG','AQUA','DUS',45000,'tahan_lama',20,85),
        (NULL,'DENPASAR','AQUA','DUS',45000,'tahan_lama',20,85),
        (NULL,'NEGARE','AQUA','DUS',45000,'tahan_lama',20,85),
        (NULL,'BADUNG','AQUA','DUS',45000,'tahan_lama',20,20);

/*markdown
<!-- 
MENGHAPUS DATA BERDASARKAN ISI DATA 

DISINI KITA AKAN MENGHAPUS BERDASARKAN ALAMAT_BARANG
-->
*/

DELETE FROM barang WHERE `barang`.`alamat` = 'GIANYAR';

/*markdown
<!-- MEMCARI DATASET BERDASARKAN KATA DALAM KATA KUNCI -->
*/

/*markdown
<!-- MENAMPILKAN DATA -->
*/

SELECT * FROM barang

/*markdown
<!-- Menampilkan Beberapa Tabel  -->
*/

SELECT id_barang,alamat,stock_barang FROM barang

/*markdown
# CATATAN PERTEMUAN 2
*/

SELECT * FROM barang

DESC barang

INSERT INTO barang (id_barang,alamat,nama_barang,jenis_barang,harga_barang,ketahanan_barang,jumlah_barang,stock_barang) 
VALUES
    (NULL,'SJSNAGAHAR','MIE INSTAN','DUS',50000,'tahan_lama',75,100);


/*markdown
<!-- Mencari Data -->
*/

SELECT * FROM barang
WHERE alamat = 'BANGLI';

SELECT * FROM barang
WHERE stock_barang < 60;

/*markdown
<!-- MENGEDIT ISI TABLE -->
*/

UPDATE barang
SET alamat = 'SINGARAJA'
WHERE id_barang = 8;

SELECT * FROM barang

/*markdown
<!-- MENGEDIT BEBERAPA KOLOM SEKALIGUS -->
*/

UPDATE barang
SET nama_barang = 'SPRITS', harga_barang = 65000
WHERE id_barang = 5;


/*markdown
<!-- MEMBUAT ALIAS PADA DATA YANG DI TENTUKAN -->
*/

SELECT nama_barang as MEREK FROM barang LIMIT 2

DESC barang

SELECT * FROM barang LIMIT 1

SELECT id_barang        as kode_barang,
       alamat           as Kabupaten,
       nama_barang      as merek_barang,
       jenis_barang     as kemasan,
       harga_barang     as ptice,
       ketahanan_barang as kekuatan_barang
FROM barang