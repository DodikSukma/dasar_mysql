-- Active: 1666167728966@@127.0.0.1@3306@db_backup


/*markdown
SQL = Standard Query Languange

Skil :

DS
DE
BA

3 Jenis Perintah Dasar

DDL (Data Definiton Languange)
	1. Create
		Membuat Table Baru
	2. Alter
		Menambahkan Table
	3. Rename
		Mengubah Table
	4. Drop
		Menghapus Table
	5. Show
		Menampilkan Table


DML (Data Manipulatioan Languange)
	1. Insert
		Menambahkan Isi table
	2. Select
		Menampilkan 
	3. Update
		Update Data
	4. Delete
		Menghapus Data pada table

DCL (Data Control Languange)
	1. Grant 
		Memberikan Hak Akses
	2. Revoke
		Mencabut Hak Akses




/*markdown
# DDL (Data Definiton Languange)
*/

/*markdown
* CREATE
    1. Digunakan Untuk Membuat Table
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
* ALTER
    1. Digunakan Untuk Mengubah Table

*/

ALTER TABLE `barang` ADD `stock_barang` INT;

/*markdown
* Melihat Struktur Table
*/

DESC `barang`

/*markdown
* RENAME/CHANGE
    1. Mengubah Nama Kolom
*/

ALTER TABLE `barang` CHANGE `ketahanan_barang` `dayatahan_barang` ENUM('tahan_lama','cepat') DEFAULT NULL;

/*markdown
* DROP
    1. Menghapus Kolom
*/

ALTER TABLE `barang` DROP `stock_barang`;

/*markdown
# DML (Data Manipulatioan Languange)
*/

/*markdown
* Insert
	1. Menambahkan Isi table
*/

/*markdown
* Insert Satu
*/

INSERT INTO barang (id_barang, nama_barang, jenis_barang, harga_barang, dayatahan_barang, jumlah_barang, stock_barang) 
VALUES 
(NULL, 'Aqua Tanggung', 'Box', '50000', 'tahan_lama', '18', '50');

/*markdown
* Insert Banyak Sekaligus
*/

INSERT INTO barang (id_barang, nama_barang, jenis_barang, harga_barang, dayatahan_barang, jumlah_barang, stock_barang) 
VALUES 
(NULL, 'Aqua Tanggung', 'Box', '50000', 'tahan_lama', '18', '50'),
(NULL, 'Aqua Tanggung', 'Box', '50000', 'tahan_lama', '18', '50'),
(NULL, 'Aqua Tanggung', 'Box', '50000', 'tahan_lama', '18', '50'),
(NULL, 'Aqua Tanggung', 'Box', '50000', 'tahan_lama', '18', '50');

/*markdown
* SELECT 
    1. Menampilkan
*/

SELECT * FROM barang

SELECT * FROM barang
WHERE nama_barang = 'Sarimi';

/*markdown
* UPDATE
    1. Mengedit isi Table
*/

UPDATE `barang` SET `nama_barang` = 'Sarimi', `harga_barang` = '4000', `stock_barang` = '10' WHERE `barang`.`id_barang` = 3;

UPDATE `barang` SET `nama_barang` = 'Aqua Gelas', `harga_barang` = '25000', `stock_barang` = '12' WHERE `barang`.`id_barang` = 1;

/*markdown
* DELETE
    1. Menghapus Data
*/

DELETE FROM `barang` WHERE `barang`.`id_barang` = 8