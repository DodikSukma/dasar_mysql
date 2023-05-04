-- Active: 1666167728966@@127.0.0.1@3306@db_balajar_sql



CREATE TABLE nilai_mahasiswa
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nama VARCHAR(100),
    mtk INT,
    ips INT,
    bio int
)ENGINE = InnoDB;

INSERT INTO nilai_mahasiswa (id,nama,mtk,ips,bio)
VALUES (NULL,'dodik',95,95,95),
       (NULL,'made',95,80,95),
       (NULL,'ketut',95,75,95),
       (NULL,'komang',90,95,95),
       (NULL,'putu',95,80,95);

SELECT * FROM nilai_mahasiswa

SELECT nama, SUM((mtk+ips+bio)/3) as Total_nilai FROM nilai_mahasiswa
GROUP BY nama ORDER BY Total_nilai DESC;

ALTER TABLE  `nilai_mahasiswa` DROP `rataan`

ALTER TABLE `nilai_mahasiswa` ADD `rataan` INT AS((mtk+ips+bio)/3);




CREATE TABLE nilai_student
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    nama VARCHAR(100),
    mtk INT,
    ips INT,
    bio int,
    rataan int as(mtk+ips+bio)
)ENGINE = InnoDB;

INSERT INTO nilai_student (id,nama,mtk,ips,bio)
VALUES (NULL,'dodik',95,95,95),
       (NULL,'made',95,80,95),
       (NULL,'ketut',95,75,95),
       (NULL,'komang',90,95,95),
       (NULL,'putu',95,80,95);

SELECT * FROM nilai_student

/*markdown
# Tabel Belum jadi
*/

INSERT INTO `user` (`id_user`, `level_user`, `nama`) VALUES (NULL, '1', 'I Putu Dodik Sukma Indranata');

