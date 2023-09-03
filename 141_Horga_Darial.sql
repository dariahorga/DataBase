------------------------------produs---------------------------------------
CREATE TABLE produs (
  produs_id NUMBER(10) PRIMARY KEY,
  furnizor_id NUMBER(10),
  categorie_id NUMBER(10),
  nume VARCHAR(100) NOT NULL,
  pret NUMBER(10) NOT NULL,
  descriere VARCHAR(500)
);

INSERT INTO produs VALUES (123, 56678, 012, 'rochie midi decupata', 150, 'Rochie midi confec?ionat? cu ?es?tur? din amestec de viscoz?, cu guler rotund, f?r? mânec?, cu decupaje laterale ajustabile cu funde');
INSERT INTO produs VALUES (124, 56678, 012, 'rochie mini cu imprimeu', 120, 'Rochie cu guler rotund, decolteu în V, mânec? lung? cu elastic în partea inferioar? si aplica?ie cu inser?ii de dantel?.');
INSERT INTO produs VALUES (125, 34566, 011, 'camasa satinata', 100, 'C?ma?? cu guler ?i rever. Decolteu în V. Mânec? lung? cu man?et?. Închidere frontal? cu nasturi.');
INSERT INTO produs VALUES (126, 34566, 010, 'fusta mini denim', 90, 'Fust? cu talie înalt?. Cinci buzunare. Efect presp?lat. Închidere frontal? cu fermoar ?i nasture metalic.');
INSERT INTO produs VALUES (127, 56678, 010, 'fusta-pantalon cu cute', 110, 'Fust?-pantalon cu talie înalt?. Fermoar ascuns în cus?tur?. Dublur? la interior, tip shorts.');
INSERT INTO produs VALUES (128, 98755, 09, 'pantaloni drepti cu talie inalta', 130, 'Pantaloni cu talie înalt?. Buzunare în fa??. Buzunare false cu paspoal la spate. Picior drept. Închidere frontal? cu fermoar, nasture interior ?i cârlig metalic.');
INSERT INTO produs VALUES (129, 56678, 08, 'top din tricot dantelat', 80, 'Top cu guler rotund. F?r? mânec?. Vol?na? la margine în partea de jos. Decupaj la spate cu închidere cu nasture.');

select * 
from produs;
------------------------------categorie de produs---------------------------------------

CREATE TABLE categorie (
  categorie_id NUMBER(10) PRIMARY KEY,
  nume VARCHAR(100) NOT NULL
);

INSERT INTO categorie
VALUES(012,'rochie');

INSERT INTO categorie
VALUES(011,'camasa');

INSERT INTO categorie
VALUES(010,'fusta');

INSERT INTO categorie
VALUES(09,'pantaloni');

INSERT INTO categorie
VALUES(08,'top');

select *
from categorie;
------------------------------clienti---------------------------------------
CREATE TABLE clienti (
  client_id NUMBER(10) PRIMARY KEY,
  nume VARCHAR(100) NOT NULL,
  adresa_de_livrare VARCHAR(300) NOT NULL,
  numar_telefon NUMBER(10) NOT NULL,
  adresa_email VARCHAR(100) UNIQUE
);

INSERT INTO clienti
VALUES(21,'Ionescu Raluca','Alexandru Ioan Cuza 56 Bucuresti',0722222222,'ionescuraluca@yahoo.com');
INSERT INTO clienti
VALUES(22,'Popescu Alexandru','Independentei 22 bloc T63 scara B Bucuresti',07222345682,'alex_popescu@yahoo.com');
INSERT INTO clienti
VALUES(23,'Anghel Andreea','Alexandru Osobescu Ploiesti bloc 17A',0771234509,'anghelandreea234@gmail.com');
INSERT INTO clienti
VALUES(24,'Horga Daria','Oituz 456 Bucuresti',0771208478,'dariahorga@yahoo.com');
INSERT INTO clienti
VALUES(25,'Iancu Maria Alexandra','Aleea Militari 467 Ploiesti',0722345678,'iancu_andreea@yahoo.com');
INSERT INTO clienti
VALUES(26,'Popescu Ana','Deleni nr 6 Bucuresti',0722224321,'popescuana234@yahoo.com');

select * 
from clienti;

------------------------------preturi---------------------------------------


CREATE TABLE preturi (
  pret_id NUMBER(10) PRIMARY KEY,
  produs_id NUMBER(10),
  pret_de_baza DECIMAL(10, 2) NOT NULL,
  pret_de_vanzare DECIMAL(10, 2) NOT NULL
);

ALTER TABLE preturi
ADD FOREIGN KEY (produs_id) REFERENCES produs(produs_id);

INSERT INTO preturi (pret_id, produs_id, pret_de_baza, pret_de_vanzare) VALUES (1, 123, 110, 140);
INSERT INTO preturi (pret_id, produs_id, pret_de_baza, pret_de_vanzare) VALUES (2, 124, 100, 110);
INSERT INTO preturi (pret_id, produs_id, pret_de_baza, pret_de_vanzare) VALUES (3, 125, 80, 90);
INSERT INTO preturi (pret_id, produs_id, pret_de_baza, pret_de_vanzare) VALUES (4, 126, 60, 80);
INSERT INTO preturi (pret_id, produs_id, pret_de_baza, pret_de_vanzare) VALUES (5, 127, 100, 100);
INSERT INTO preturi (pret_id, produs_id, pret_de_baza, pret_de_vanzare) VALUES (6, 128, 110, 120);
INSERT INTO preturi (pret_id, produs_id, pret_de_baza, pret_de_vanzare) VALUES (7, 129, 60, 70);

select *
from preturi;

------------------------------furnizori---------------------------------------

CREATE TABLE furnizori (
  furnizor_id NUMBER(10) PRIMARY KEY,
  nume VARCHAR(100) NOT NULL,
  adresa VARCHAR(300),
  detalii_contact VARCHAR(500) NOT NULL
);

INSERT INTO furnizori VALUES (56678, 'ABC Company', 'Strada alexandru cel bun 67 Bucuresti', '079876521, Contact details for ABC Company');
INSERT INTO furnizori VALUES (34566, 'XYZ Supplier Ltd.', 'Strada Stefan cel mare 56 Suceava ', '073456789, Contact details for XYZ Supplier Ltd.');
INSERT INTO furnizori VALUES (98755, 'Suppliers Inc.', ' Bulevardul eroilor 56 , bloc T54 scara C, Targul Jiu', '0987634859, suppliers_Inc@yahoo.com');

select *
from furnizori;

ALTER TABLE produs
ADD CONSTRAINT fk_furnizor_id FOREIGN KEY (furnizor_id)
REFERENCES furnizori (furnizor_id);

------------------------------comanda---------------------------------------

CREATE TABLE comanda (
  comanda_id NUMBER(10) PRIMARY KEY,
  client_id NUMBER(10),
  statusul_comenzii VARCHAR(100),
  data_comanda VARCHAR(100),
  FOREIGN KEY (client_id) REFERENCES clienti(client_id)
);

INSERT INTO comanda VALUES (2001, 21, 'In procesare','03-03-2023');
INSERT INTO comanda VALUES (2002, 22, 'Prelucrare','08-05-2023');
INSERT INTO comanda VALUES (2003, 23, 'Finalizata', '03-04-2023');
INSERT INTO comanda VALUES (2004, 24, 'In procesare','15-05-2023');
INSERT INTO comanda VALUES (2005, 26, 'Prelucrare','03-03-2023');

select *
from comanda;

------------------------------detalii_comanda---------------------------------------

CREATE TABLE detalii_comanda (
    detalii_comand?_id NUMBER(10) PRIMARY KEY,
    comand?_id NUMBER(10),
    produs_id  NUMBER(10),
    cantitate NUMBER(10), 
    pre? NUMBER(10),
    FOREIGN KEY (comanda_id) REFERENCES comanda(comanda_id),
    FOREIGN KEY (produs_id) REFERENCES produs(produs_id)

);


INSERT INTO detalii_comanda VALUES (1, 21, 123,1,150);
INSERT INTO detalii_comanda VALUES (10, 21, 127,1,110);
INSERT INTO detalii_comanda VALUES (2, 22, 125,100);
INSERT INTO detalii_comanda VALUES (3, 23,129,3,240);
INSERT INTO detalii_comanda VALUES (4, 24, 128,1,130);
INSERT INTO detalii_comanda VALUES (5, 26, 128, 1, 130);
INSERT INTO detalii_comanda VALUES (6, 26, 123, 2, 300);
INSERT INTO detalii_comanda VALUES (7, 24, 123, 2, 300);
INSERT INTO detalii_comanda VALUES (8, 22, 129, 2, 160);
INSERT INTO detalii_comanda VALUES (9, 26, 123, 2, 300);

select *
from detalii_comanda;
------------------------------expediere---------------------------------------

CREATE TABLE expediere (
  expediere_id NUMBER(10) PRIMARY KEY,
  comanda_id NUMBER(10),
  statusul_expedierii VARCHAR(100),
  FOREIGN KEY (comanda_id) REFERENCES comanda(comanda_id)
);

INSERT INTO expediere VALUES (3001, 2001, 'In pregatire');
INSERT INTO expediere VALUES (3002, 2002, 'In tranzit');
INSERT INTO expediere VALUES (3003, 2003, 'Livrata');
INSERT INTO expediere VALUES (3004, 2004, 'In pregatire');
INSERT INTO expediere VALUES(3005, 2005, 'In tranzit');
  
select*
from expediere;

  -----------------------------plata---------------------------------------

CREATE TABLE plata (
  plata_id NUMBER(10) PRIMARY KEY,
  comanda_id NUMBER(10),
  FOREIGN KEY (comanda_id) REFERENCES comanda(comanda_id)
);

INSERT INTO plata VALUES (4001, 2001);
INSERT INTO plata VALUES (4002, 2002);
INSERT INTO plata VALUES (4003, 2003);
INSERT INTO plata VALUES (4004, 2004);
INSERT INTO plata VALUES (4005, 2005);

select*
from plata;

CREATE TABLE card (
  card_id NUMBER(10) PRIMARY KEY,
  plata_id NUMBER(10),
  FOREIGN KEY (plata_id) REFERENCES plata(plata_id)
);

INSERT INTO card VALUES (1,4001);
INSERT INTO card VALUES (2,4002);
INSERT INTO card VALUES (3,4003);

select*
from card;

CREATE TABLE cash (
  cash_id NUMBER(10) PRIMARY KEY,
  plata_id NUMBER(10),
  FOREIGN KEY (plata_id) REFERENCES plata(plata_id)
);

INSERT INTO cash VALUES (1,4004);
INSERT INTO cash VALUES (2,4005);

select*
from cash;

------------------------------magazin---------------------------------------

CREATE TABLE magazin (
  magazin_id NUMBER(10) PRIMARY KEY,
  nume VARCHAR(100) NOT NULL
);

INSERT INTO magazin (magazin_id, nume) VALUES
(1, 'Zara');

select* 
from magazin;

------------------------------reduceri---------------------------------------

CREATE TABLE reduceri (
  reducere_id NUMBER(10) PRIMARY KEY,
  produs_id NUMBER(10),
  perioada_valabilitate VARCHAR(100) NOT NULL,
  conditii VARCHAR(500),
  FOREIGN KEY (produs_id) REFERENCES produs(produs_id)
);

INSERT INTO reduceri (reducere_id, produs_id, perioada_valabilitate, conditii) VALUES (1, 123, '2023-05-01', 'Reducere de sezon 50%');
INSERT INTO reduceri (reducere_id, produs_id, perioada_valabilitate, conditii) VALUES (2, 124, '2023-05-01', 'Reducere de sezon 50%');
INSERT INTO reduceri (reducere_id, produs_id, perioada_valabilitate, conditii) VALUES (3, 123, '2023-06-07', '30% la cumparaturile de peste 100 lei');

select *
from reduceri;

------------------------------tendinte---------------------------------------
CREATE TABLE tendinte (
  tendinta_id NUMBER(10) PRIMARY KEY,
  produs_id NUMBER(10),
  descriere VARCHAR(500),
  cantitate NUMBER(10),
  FOREIGN KEY (produs_id) REFERENCES produs(produs_id)
);


INSERT INTO tendinte VALUES (5001, 123, 'Tendinta: Rochii midi decupate',2);
INSERT INTO tendinte VALUES (5002, 124, 'Tendinta: Rochii cu imprimeu',1);
INSERT INTO tendinte VALUES (5003, 125, 'Tendinta: Camasi satin',2);
INSERT INTO tendinte VALUES (5004, 126, 'Tendinta: Fuste mini denim',2);
INSERT INTO tendinte VALUES (5005, 127, 'Tendinta: Fuste-pantaloni cu cute',2);
INSERT INTO tendinte VALUES (5005, 128, 'Tendinta: Fuste-pantaloni cu cute',1);
INSERT INTO tendinte VALUES (5005, 129, 'Tendinta: Fuste-pantaloni cu cute',1);

select *
from tendinte;

 ------------------------------rapoarte---------------------------------------

CREATE TABLE rapoarte (
  raport_id NUMBER(10) PRIMARY KEY,
  descriere VARCHAR(500),
  comanda_id NUMBER(10),
  FOREIGN KEY (comanda_id) REFERENCES comanda (comanda_id)
);

INSERT INTO rapoarte (raport_id, descriere, comanda_id) VALUES (3, 'Increase in demand for dresses', 2005);
INSERT INTO rapoarte (raport_id, descriere, comanda_id) VALUES (4, 'Customer interest in Spring collection', 2003);

select* 
from rapoarte;

 ------------------------------EX12---------------------------------------
 
--1
--Obtineti numele, adresa si numarul de telefon al clientilor care au plasat cel putin o comanda în luna martie, al caror status de expediere este "In procesare" si care au platit cu cardul.
SELECT c.nume, c.adresa_de_livrare, c.numar_telefon
FROM clienti c
WHERE c.client_id IN (
    SELECT com.client_id
    FROM comanda com
    JOIN plata p ON com.comanda_id = p.comanda_id
    WHERE com.data_comanda LIKE '%-03-%'
    AND upper(com.statusul_comenzii) = 'IN PROCESARE'
    AND (p.plata_id IN (
        SELECT card.plata_id
        FROM card
    ) OR p.plata_id IN (
        SELECT cash.plata_id
        FROM cash
    ))
);

--2
--Calculeaz? num?rul total de comenzi pentru fiecare client ?i apoi afi?eaz? numele clien?ilor ?i num?rul total de comenzi, sortate în ordine descresc?toare dup? num?rul de comenzi.

WITH total_comenzi AS (
    SELECT c.client_id, COUNT(*) AS numar_comenzi
    FROM clienti c
    JOIN comanda com ON c.client_id = com.client_id
    GROUP BY c.client_id
)
SELECT c.nume, tc.numar_comenzi
FROM clienti c
JOIN total_comenzi tc ON c.client_id = tc.client_id
ORDER BY tc.numar_comenzi DESC;

--3
--Selectati numele produsului, numele categoriei, pre?ul de vânzare ?i cantitatea din tabelele, filtrând produsele cu pre?ul de vânzare mai mare decât media pre?urilor ?i sortând rezultatele în ordine descresc?toare a cantit??ii.
SELECT P.nume, C.nume AS categorie, PR.pret_de_vanzare, T.cantitate
FROM Produs P
JOIN Categorie C ON P.categorie_id = C.categorie_id
JOIN Preturi PR ON P.produs_id = PR.produs_id
JOIN Tendinte T ON PR.produs_id = T.produs_id
WHERE PR.pret_de_vanzare > (SELECT AVG(pret_de_vanzare) FROM Preturi)
ORDER BY T.cantitate DESC;

    
--4
--Selectati informa?ii despre comenzi, afi?ând numele produsului, pre?ul final, numele categoriei ?i o tendin?? în func?ie de cantitatea produsului, 
SELECT
  P.nume AS nume_produs,
  PR.pret_de_vanzare AS pret_final,
  CAT.nume AS nume_categorie,
  CASE
    WHEN T.cantitate > 100 THEN 'Cantitate mare'
    WHEN T.cantitate > 50 THEN 'Cantitate medie'
    ELSE 'Cantitate mica'
  END AS tendinta_cantitate
FROM
  Produs P
  JOIN Preturi PR ON P.produs_id = PR.produs_id
  JOIN Categorie CAT ON P.categorie_id = CAT.categorie_id
  JOIN Tendinte T ON P.produs_id = T.produs_id
WHERE
  P.produs_id IN (SELECT DISTINCT produs_id FROM Tendinte)
ORDER BY
  P.produs_id;
  
--5
--Selecteaz? ID-ul comenzii, statusul comenzii (transformându-l în func?ie de starea comenzii) ?i descrierea raportului (sau "Necunoscut" în lipsa acestuia) pentru fiecare înregistrare din tabela "Comanda"
SELECT
    c.comanda_id AS ID,
    NVL(DECODE(c.statusul_comenzii, 'Plasata', 'In asteptare', 'Prelucrata', 'Procesata', 'Finalizata', 'Livrat', 'Necunoscut'), 'Necunoscut') AS status_comanda,
    NVL(r.descriere, 'Necunoscut') AS descriere_raport
FROM
    Comanda c
    LEFT JOIN Rapoarte r ON c.comanda_id = r.comanda_id;
    
 ------------------------------EX13---------------------------------------
 
 --1
 --?tergerea rapoartelor asociate comenzilor finalizate utilizând o subcerere
DELETE FROM Rapoarte
WHERE comanda_id IN (
    SELECT comanda_id
    FROM Comanda
    WHERE statusul_comenzii = 'Finalizata'
);

--2
--Actualizarea pretul de vanzare cu cel de baza

UPDATE Preturi
SET pret_de_vanzare = (
    SELECT pret_de_baza
    FROM Produs
    WHERE Preturi.produs_id = Produs.produs_id
);

--3
--?tergerea produselor dintr-o anumita categorie (top)
DELETE FROM Produs
WHERE categorie_id = (
    SELECT categorie_id
    FROM Categorie
    WHERE nume = 'top'
);

    




