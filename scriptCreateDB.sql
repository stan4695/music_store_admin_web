#source E:/ETTI.442C/BD/Proiect/script16.sql
/*          Folositi pentru cale simbolul "/", NU "\"         */ 


/*#############################################################*/
/*        PARTEA 1 - STERGEREA SI RECREAREA BAZEI DE DATE      */

DROP DATABASE magazinMuzicaDB;  /*Stergeti baza de date (pentru a evita situatiile in care imi veti trimite de mai multe ori scriptul modificat si va trebui sa-l rulez)*/
CREATE DATABASE magazinMuzicaDB;
USE magazinMuzicaDB;

/*#############################################################*/




/*#############################################################*/
/*                  PARTEA 2 - CREAREA TABELELOR              */

CREATE TABLE tblClienti (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nume VARCHAR(50) NOT NULL,
	email VARCHAR(50) UNIQUE,
	telefon CHAR(10) UNIQUE,
	adresa VARCHAR(50)
);
	
CREATE TABLE tblComenzi (
	id INT AUTO_INCREMENT PRIMARY KEY,
	id_client INT NOT NULL,
	data_comanda TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	status ENUM('Procesata', 'Anulata', "Livrata"),
	total_comanda DECIMAL(7,2),
	CONSTRAINT fk_clienti FOREIGN KEY (id_client)
	REFERENCES tblClienti(id) ON DELETE CASCADE ON UPDATE CASCADE
);
	
CREATE TABLE tblAlbume (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nume_album VARCHAR(50) NOT NULL,
	artist VARCHAR(50) NOT NULL,
	gen_muzical ENUM('Pop', 'Rock', 'Clasic', 'Reggae', 'Blues', 'Jazz', 'Hip-Hop', 'Trap', 'Rap', 'Folk', 'Electronic'),
	data_lansare DATE,
	pret DECIMAL(7,2) NOT NULL,
	casa_discuri VARCHAR(50),
	tip_produs ENUM('CD', 'vinil', 'caseta'),
	stoc INT,
	UNIQUE(nume_album, artist, tip_produs)
);
	
	
CREATE TABLE tblProduseComenzi (
	id INT AUTO_INCREMENT PRIMARY KEY,
	id_comanda INT NOT NULL, 
	id_produs INT NOT NULL,
	cantitate INT NOT NULL DEFAULT 1, 
	pretFinal DECIMAL(7,2) NOT NULL,
	CONSTRAINT fk_comanda FOREIGN KEY (id_comanda)
	REFERENCES tblComenzi(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_produs FOREIGN KEY (id_produs)
	REFERENCES tblAlbume(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE tblMelodii (
	id INT AUTO_INCREMENT PRIMARY KEY,
	id_album INT NOT NULL,
	numeMelodie VARCHAR(100),
	durata TIME,
	numarPiesa INT NOT NULL,
	CONSTRAINT fk_idAlbum FOREIGN KEY (id_album)
	REFERENCES tblAlbume(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
	email VARCHAR(50) UNIQUE NOT NULL,
	role ENUM('user', 'admin') NOT NULL DEFAULT 'user'
);

/*#############################################################*/




/*#############################################################*/
/*         PARTEA 3 - INSERAREA INREGISTRARILOR IN TABELE      */

INSERT INTO tblClienti (nume, email, telefon, adresa) VALUES ("Teculescu Oana", "oana.teculescu@gmail.com", "0744558410", "Strada Florilor, Ploiesti");
INSERT INTO tblClienti (nume, email, telefon, adresa) VALUES ("Stan Catalin", "stan.catalin@gmail.com", "0724589575", "Bulevardul Unirii, Targoviste");
INSERT INTO tblClienti (nume, email, telefon, adresa) VALUES ("Cioponea Florentina", "florentina.cioponea12@gmail.com", "0725961411", "Aleea Castanilor, Bucuresti");
INSERT INTO tblClienti (nume, email, telefon, adresa) VALUES ("Ciungu Mihnea", "ciungu.mihnea2002@gmail.com", "0743788721", "Strada Mihai Eminescu, Pitesti");
INSERT INTO tblClienti (nume, email, telefon, adresa) VALUES ("Vrabete Alexandru", "vrabete.nicolae@gmail.com", "0776952350", "Calea Victoriei, Slatina");
INSERT INTO tblClienti (nume, email, telefon, adresa) VALUES ("Manta Valentina", "mantavali99@yahoo.com", "0712697548", "Strada Primaverii, Craiova");
INSERT INTO tblClienti (nume, email, telefon, adresa) VALUES ("Tanase Mirela", "mirela_andreea@gmail.com", "0746963212", "Strada Liviu Rebreanu, Brasov");
INSERT INTO tblClienti (nume, email, telefon, adresa) VALUES ("Dumitru Nicoleta", "dumitru_nicoleta@yahoo.com", "0744582378", "Aleea Trandafirilor, Sibiu");
INSERT INTO tblClienti (nume, email, telefon, adresa) VALUES ("Popescu Andrei", "andrei.popescu@gmail.com", "0723123456", "Strada Mihai Viteazul, Bucuresti");
INSERT INTO tblClienti (nume, email, telefon, adresa) VALUES ("Ion Maria", "maria_ion@hotmail.com", "0765987456", "Aleea Parcului, Cluj-Napoca");
INSERT INTO tblComenzi (id_client, data_comanda, status, total_comanda) VALUES (1, '2024-11-01 10:30:00', 'Procesata', 150.75);
INSERT INTO tblComenzi (id_client, data_comanda, status, total_comanda) VALUES (2, '2024-11-02 14:45:00', 'Livrata', 181.50);
INSERT INTO tblComenzi (id_client, data_comanda, status, total_comanda) VALUES (3, '2024-11-03 08:20:00', 'Anulata', 211.74);
INSERT INTO tblComenzi (id_client, data_comanda, status, total_comanda) VALUES (1, '2024-11-04 12:15:00', 'Procesata', 210.75);
INSERT INTO tblComenzi (id_client, data_comanda, status, total_comanda) VALUES (4, '2024-11-05 09:50:00', 'Livrata', 446.99);
INSERT INTO tblComenzi (id_client, data_comanda, status, total_comanda) VALUES (2, '2024-11-06 16:40:00', 'Anulata', 471.35);
INSERT INTO tblComenzi (id_client, data_comanda, status, total_comanda) VALUES (4, '2024-11-10 17:45:00', 'Livrata', 165.75);
INSERT INTO tblComenzi (id_client, data_comanda, status, total_comanda) VALUES (2, '2024-11-11 10:00:00', 'Procesata', 120.50);
INSERT INTO tblComenzi (id_client, data_comanda, status, total_comanda) VALUES (5, '2024-11-12 14:20:00', 'Livrata', 210.75);
INSERT INTO tblComenzi (id_client, data_comanda, status, total_comanda) VALUES (1, '2024-11-13 18:30:00', 'Procesata', 195.99);
INSERT INTO tblAlbume (nume_album, artist, gen_muzical, data_lansare, pret, casa_discuri, tip_produs, stoc) VALUES ('Thriller', 'Michael Jackson', 'Pop', '1982-11-30', 50.25, 'Epic Records', 'CD', 50);
INSERT INTO tblAlbume (nume_album, artist, gen_muzical, data_lansare, pret, casa_discuri, tip_produs, stoc) VALUES ('Back in Black', 'AC/DC', 'Rock', '1980-07-25', 60.50, 'Atlantic Records', 'vinil', 30);
INSERT INTO tblAlbume (nume_album, artist, gen_muzical, data_lansare, pret, casa_discuri, tip_produs, stoc) VALUES ('The Dark Side of the Moon', 'Pink Floyd', 'Rock', '1973-03-01', 70.25, 'Harvest Records', 'vinil', 40);
INSERT INTO tblAlbume (nume_album, artist, gen_muzical, data_lansare, pret, casa_discuri, tip_produs, stoc) VALUES ('Rumours', 'Fleetwood Mac', 'Rock', '1977-02-04', 55.25, 'Warner Bros.', 'caseta', 25);
INSERT INTO tblAlbume (nume_album, artist, gen_muzical, data_lansare, pret, casa_discuri, tip_produs, stoc) VALUES ('Kind of Blue', 'Miles Davis', 'Jazz', '1959-08-17', 45.37, 'Columbia Records', 'CD', 40);
INSERT INTO tblAlbume (nume_album, artist, gen_muzical, data_lansare, pret, casa_discuri, tip_produs, stoc) VALUES ('The Eminem Show', 'Eminem', 'Hip-Hop', '2002-05-26', 50.25, 'Aftermath', 'CD', 20);
INSERT INTO tblAlbume (nume_album, artist, gen_muzical, data_lansare, pret, casa_discuri, tip_produs, stoc) VALUES ('Nevermind', 'Nirvana', 'Rock', '1991-09-24', 65.33, 'DGC Records', 'vinil', 35);
INSERT INTO tblAlbume (nume_album, artist, gen_muzical, data_lansare, pret, casa_discuri, tip_produs, stoc) VALUES ('The Wall', 'Pink Floyd', 'Rock', NULL, 80.15, 'Harvest Records', 'caseta', 20);
INSERT INTO tblAlbume (nume_album, artist, gen_muzical, data_lansare, pret, casa_discuri, tip_produs, stoc) VALUES ('Abbey Road', 'The Beatles', 'Rock', '1969-09-26', 75.25, 'Apple Records', 'vinil', 25);
INSERT INTO tblAlbume (nume_album, artist, gen_muzical, data_lansare, pret, casa_discuri, tip_produs, stoc) VALUES ('21', 'Adele', 'Pop', '2011-01-24', 40.25, 'XL Recordings', 'CD', 50);
INSERT INTO tblProduseComenzi (id_comanda, id_produs, cantitate, pretFinal) VALUES (1, 1, 3, 150.75);
INSERT INTO tblProduseComenzi (id_comanda, id_produs, cantitate, pretFinal) VALUES (2, 2, 3, 181.50);
INSERT INTO tblProduseComenzi (id_comanda, id_produs, cantitate, pretFinal) VALUES (3, 5, 2, 90.74);
INSERT INTO tblProduseComenzi (id_comanda, id_produs, cantitate, pretFinal) VALUES (3, 2, 2, 121.00);
INSERT INTO tblProduseComenzi (id_comanda, id_produs, cantitate, pretFinal) VALUES (4, 3, 3, 210.75);
INSERT INTO tblProduseComenzi (id_comanda, id_produs, cantitate, pretFinal) VALUES (5, 6, 2, 100.50);
INSERT INTO tblProduseComenzi (id_comanda, id_produs, cantitate, pretFinal) VALUES (5, 7, 3, 195.99);
INSERT INTO tblProduseComenzi (id_comanda, id_produs, cantitate, pretFinal) VALUES (5, 9, 2, 150.50);
INSERT INTO tblProduseComenzi (id_comanda, id_produs, cantitate, pretFinal) VALUES (6, 1, 3, 150.75);
INSERT INTO tblProduseComenzi (id_comanda, id_produs, cantitate, pretFinal) VALUES (6, 8, 4, 320.60);
INSERT INTO tblProduseComenzi (id_comanda, id_produs, cantitate, pretFinal) VALUES (7, 4, 3, 165.75);
INSERT INTO tblProduseComenzi (id_comanda, id_produs, cantitate, pretFinal) VALUES (8, 5, 2, 120.50);
INSERT INTO tblProduseComenzi (id_comanda, id_produs, cantitate, pretFinal) VALUES (9, 3, 3, 210.75);
INSERT INTO tblProduseComenzi (id_comanda, id_produs, cantitate, pretFinal) VALUES (10, 7, 3, 195.99);
INSERT INTO tblMelodii (id_album, numeMelodie, durata, numarPiesa) VALUES (1, 'Wanna Be Startin\' Somethin\'', '00:06:02', 1);
INSERT INTO tblMelodii (id_album, numeMelodie, durata, numarPiesa) VALUES (1, 'The Girl Is Mine', '00:03:42', 3);
INSERT INTO tblMelodii (id_album, numeMelodie, durata, numarPiesa) VALUES (2, 'Hells Bells', '00:05:12', 1);
INSERT INTO tblMelodii (id_album, numeMelodie, durata, numarPiesa) VALUES (2, 'Shoot to Thrill', '00:05:18', 2);
INSERT INTO tblMelodii (id_album, numeMelodie, durata, numarPiesa) VALUES (2, 'What Do You Do for Money Honey', '00:03:36', 3);
INSERT INTO tblMelodii (id_album, numeMelodie, durata, numarPiesa) VALUES (3, 'Speak to Me', '00:01:07', 1);
INSERT INTO tblMelodii (id_album, numeMelodie, durata, numarPiesa) VALUES (3, 'Breathe', '00:02:50', 2);
INSERT INTO tblMelodii (id_album, numeMelodie, durata, numarPiesa) VALUES (3, 'On the Run', '00:03:45', 3);
INSERT INTO tblMelodii (id_album, numeMelodie, durata, numarPiesa) VALUES (3, 'Time', '00:07:06', 4);
INSERT INTO tblMelodii (id_album, numeMelodie, durata, numarPiesa) VALUES (1, 'Baby Be Mine', NULL, 2);

/*#############################################################*/



/*#############################################################*/
/*  PARTEA 4 - VIZUALIZAREA STUCTURII BD SI A INREGISTRARILOR  */
DESCRIBE tblClienti;
DESCRIBE tblComenzi;
DESCRIBE tblProduseComenzi;
DESCRIBE tblAlbume;
DESCRIBE tblMelodii;

SELECT * FROM tblClienti;
SELECT * FROM tblComenzi;
SELECT * FROM tblProduseComenzi;
SELECT * FROM tblAlbume;
SELECT * FROM tblMelodii;
/*#############################################################*/




/*
- NU MODIFICATI STRUCTURA ACESTUI DOCUMENT

- REDENUMITI FISIERUL  scriptXX.sql astfel incat XX sa coincida cu numarul echipei de BD. Ex: script07.sql

- SCRIPTUL AR TREBUI SA POATA FI RULAT FARA NICI O EROARE!

- ATENTIE LA CHEILE STRAINE! Nu uitati sa modificati motorul de stocare pentru tabele, la InnoDB, pentru a functiona constrangerile de cheie straina (vezi laborator 1, pagina 16 - Observatie)

*/