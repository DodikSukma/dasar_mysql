/*markdown
# Membuat Database
*/

/*markdown
* Membuatt Table Mata Kuliah
*/

-- Active: 1666167728966@@127.0.0.1@3306@db_latihan_sql



CREATE Table MK (
    id int PRIMARY KEY AUTO_INCREMENT,
    mata_kuliah VARCHAR(15)
)ENGINE=InnoDB;

DESC MK

/*markdown
* Membuat Table mahasiswa
*/

CREATE Table mahasiswa(
    nim int(12) PRIMARY KEY,
    nama_mahasiswa VARCHAR(100)
)ENGINE=InnoDB;

DESC mahasiswa

/*markdown
* Memmbuat Table Nilai seklaigus menghubungkan ketiga tabel
*/

CREATE Table nilai_mahasiswa (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nim_mahasiswa INT(12) NOT NULL,
    kode_mata_kuliah INT(12) NOT NULL,
    nilai_sikap     INT(100) NOT NULL,
    nilai_tugas     INT(100) NOT NULL,
    nilai_uts     INT(100) NOT NULL,
    nilai_uas     INT(100) NOT NULL,

    KEY nim_mahasiswa(`nim_mahasiswa`),
    KEY kode_mata_kuliah(`kode_mata_kuliah`),

    CONSTRAINT nim_mahasiswa FOREIGN KEY (`nim_mahasiswa`) REFERENCES `mahasiswa` (`nim`),
    CONSTRAINT kode_mata_kuliah FOREIGN KEY (`kode_mata_kuliah`) REFERENCES `MK` (`id`)
) ENGINE=InnoDB;

/*markdown
# Mengisi Table 
*/

/*markdown
* Mengisi Table Mahasiswa
*/

INSERT INTO `mahasiswa` VALUES ('21001', 'I Putu Dodik Sukma Indranata');

/*markdown
* Melihat data table mahasiswa
*/

SELECT * FROM mahasiswa

/*markdown
* Mengisi Table Mata Kuliah
*/

INSERT INTO `mk` VALUES ('1', 'Kalkulus');

/*markdown
* Melihat Data Mata Kuliah
*/

SELECT * FROM mk

/*markdown
* Mengisi Table nilai_mahasiswa
*/

INSERT INTO `nilai_mahasiswa` (`id`, `nim_mahasiswa`, `kode_mata_kuliah`, `nilai_sikap`, `nilai_tugas`, `nilai_uts`, `nilai_uas`) VALUES (NULL, '21001', '3', '90', '90', '90', '90');

/*markdown
* melihat Tabel nilai_mahasiswa
*/

SELECT * FROM nilai_mahasiswa

/*markdown
# Menambahkkan Kolom nilai rata-rata
*/

ALTER TABLE `nilai_mahasiswa` ADD `rata_rata` INT as ((nilai_sikap + nilai_tugas + nilai_uts + nilai_uas)/4);

/*markdown
* Lihat Hasil
*/

SELECT * FROM nilai_mahasiswa

/*markdown
# Melakukan Joining 
*/

DESC MK

DESC mahasiswa

DESC nilai_mahasiswa

/*markdown
* Melakukan Joining
*/

SELECT  mahasiswa.nama_mahasiswa, 
        mahasiswa.nim,
        MK.mata_kuliah,  
        nilai_mahasiswa.nilai_sikap, 
        nilai_mahasiswa.nilai_tugas, 
        nilai_mahasiswa.nilai_uts,
        nilai_mahasiswa.nilai_uas,
        nilai_mahasiswa.rata_rata 

        
FROM nilai_mahasiswa 
INNER JOIN mahasiswa ON nilai_mahasiswa.nim_mahasiswa = mahasiswa.nim
INNER JOIN MK ON nilai_mahasiswa.kode_mata_kuliah = MK.id

ORDER BY rata_rata ASC;
