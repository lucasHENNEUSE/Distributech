BEGIN TRANSACTION;
CREATE TABLE commande (
            numero_commande TEXT PRIMARY KEY,
            revendeur_id INTEGER NOT NULL,
            commande_date TEXT NOT NULL,
            FOREIGN KEY (revendeur_id) REFERENCES revendeur(revendeur_id)
        );
INSERT INTO "commande" VALUES('CMD-20250710-001',1,'2025-07-10');
INSERT INTO "commande" VALUES('CMD-20250711-001',1,'2025-07-11');
CREATE TABLE ligne_commande (
            id_ligne INTEGER PRIMARY KEY AUTOINCREMENT,
            numero_commande TEXT NOT NULL,
            product_id INTEGER NOT NULL,
            quantity INTEGER NOT NULL,
            unit_price REAL NOT NULL,
            FOREIGN KEY (numero_commande) REFERENCES commande(numero_commande),
            FOREIGN KEY (product_id) REFERENCES produit(product_id)
        );
INSERT INTO "ligne_commande" VALUES(1,'CMD-20250710-001',101,5,59.9);
INSERT INTO "ligne_commande" VALUES(2,'CMD-20250710-001',102,10,19.9);
INSERT INTO "ligne_commande" VALUES(3,'CMD-20250710-001',105,2,129.9);
INSERT INTO "ligne_commande" VALUES(4,'CMD-20250711-001',108,3,44.9);
INSERT INTO "ligne_commande" VALUES(5,'CMD-20250711-001',103,4,89.9);
CREATE TABLE production (
            production_id INTEGER PRIMARY KEY AUTOINCREMENT,
            product_id INTEGER NOT NULL,
            quantity INTEGER NOT NULL,
            date_production TEXT NOT NULL,
            FOREIGN KEY (product_id) REFERENCES produit(product_id)
        );
INSERT INTO "production" VALUES(1,101,50,'2025-07-01');
INSERT INTO "production" VALUES(2,102,80,'2025-07-01');
INSERT INTO "production" VALUES(3,103,40,'2025-07-02');
INSERT INTO "production" VALUES(4,104,60,'2025-07-02');
INSERT INTO "production" VALUES(5,105,20,'2025-07-03');
INSERT INTO "production" VALUES(6,106,35,'2025-07-03');
INSERT INTO "production" VALUES(7,107,25,'2025-07-04');
INSERT INTO "production" VALUES(8,108,30,'2025-07-04');
INSERT INTO "production" VALUES(9,109,45,'2025-07-05');
INSERT INTO "production" VALUES(10,110,15,'2025-07-05');
CREATE TABLE produit (
            product_id INTEGER PRIMARY KEY,
            product_name TEXT NOT NULL,
            cout_unitaire REAL NOT NULL
        );
INSERT INTO "produit" VALUES(101,'Casque Bluetooth',59.9);
INSERT INTO "produit" VALUES(102,'Chargeur USB-C',19.9);
INSERT INTO "produit" VALUES(103,'Enceinte Portable',89.9);
INSERT INTO "produit" VALUES(104,'Batterie Externe',24.9);
INSERT INTO "produit" VALUES(105,'Montre Connectée',129.9);
INSERT INTO "produit" VALUES(106,'Webcam HD',49.9);
INSERT INTO "produit" VALUES(107,'Hub USB 3.0',34.9);
INSERT INTO "produit" VALUES(108,'Clavier sans fil',44.9);
INSERT INTO "produit" VALUES(109,'Souris ergonomique',39.9);
INSERT INTO "produit" VALUES(110,'Station d''accueil',109.9);
CREATE TABLE region (
            region_id INTEGER PRIMARY KEY,
            region_name TEXT NOT NULL
        );
INSERT INTO "region" VALUES(1,'Île-de-France');
INSERT INTO "region" VALUES(2,'Occitanie');
INSERT INTO "region" VALUES(3,'Auvergne-Rhône-Alpes');
INSERT INTO "region" VALUES(4,'Bretagne');
CREATE TABLE revendeur (
            revendeur_id INTEGER PRIMARY KEY,
            revendeur_name TEXT NOT NULL,
            region_id INTEGER NOT NULL,
            FOREIGN KEY (region_id) REFERENCES region(region_id)
        );
INSERT INTO "revendeur" VALUES(1,'TechExpress',1);
INSERT INTO "revendeur" VALUES(2,'ElectroZone',1);
INSERT INTO "revendeur" VALUES(3,'SudTech',2);
INSERT INTO "revendeur" VALUES(4,'GadgetShop',2);
INSERT INTO "revendeur" VALUES(5,'Connectik',3);
INSERT INTO "revendeur" VALUES(6,'Domotik+',3);
INSERT INTO "revendeur" VALUES(7,'BreizhTech',4);
INSERT INTO "revendeur" VALUES(8,'SmartBretagne',4);
INSERT INTO "revendeur" VALUES(9,'HighNord',1);
INSERT INTO "revendeur" VALUES(10,'OuestConnect',4);
CREATE TABLE stock (
            id_stock INTEGER PRIMARY KEY AUTOINCREMENT,
            product_id INTEGER NOT NULL,
            date_mouvement TEXT NOT NULL,
            quantity INTEGER NOT NULL,
            id_type INTEGER NOT NULL,
            FOREIGN KEY (product_id) REFERENCES produit(product_id),
            FOREIGN KEY (id_type) REFERENCES type_evenement(id_type)
        );
INSERT INTO "stock" VALUES(1,101,'2025-07-01',50,1);
INSERT INTO "stock" VALUES(2,102,'2025-07-01',80,1);
INSERT INTO "stock" VALUES(3,103,'2025-07-02',40,1);
INSERT INTO "stock" VALUES(4,104,'2025-07-02',60,1);
INSERT INTO "stock" VALUES(5,105,'2025-07-03',20,1);
INSERT INTO "stock" VALUES(6,106,'2025-07-03',35,1);
INSERT INTO "stock" VALUES(7,107,'2025-07-04',25,1);
INSERT INTO "stock" VALUES(8,108,'2025-07-04',30,1);
INSERT INTO "stock" VALUES(9,109,'2025-07-05',45,1);
INSERT INTO "stock" VALUES(10,110,'2025-07-05',15,1);
INSERT INTO "stock" VALUES(11,101,'2025-07-10',-5,2);
INSERT INTO "stock" VALUES(12,102,'2025-07-10',-10,2);
INSERT INTO "stock" VALUES(13,105,'2025-07-10',-2,2);
INSERT INTO "stock" VALUES(14,108,'2025-07-11',-3,2);
INSERT INTO "stock" VALUES(15,103,'2025-07-11',-4,2);
CREATE TABLE type_evenement (
            id_type INTEGER PRIMARY KEY,
            libelle_type TEXT UNIQUE
        );
INSERT INTO "type_evenement" VALUES(1,'Réapprovisionnement');
INSERT INTO "type_evenement" VALUES(2,'Commande client');
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('production',10);
INSERT INTO "sqlite_sequence" VALUES('ligne_commande',5);
INSERT INTO "sqlite_sequence" VALUES('stock',15);
COMMIT;

