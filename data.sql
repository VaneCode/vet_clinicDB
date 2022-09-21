/* Populate database with sample data. */

--TABLE ANIMALS
--Insert initial data
INSERT INTO animals (name, date_of_birth, escape_attempts,neutered, weight_kg) VALUES
('Agumon','2020-02-03',0,true,10.23),
('Gabumon','2018-11-18',2,true,8),
('Pikachu','2021-01-07',1,false,15.04),
('Devimon','2017-05-12',5,true,11);
--Add new data into animals
INSERT INTO animals (name, date_of_birth, escape_attempts,neutered, weight_kg) VALUES
('Charmander','2020-02-08',0,false,-11),
('Plantmon','2021-11-15',2,true,-5.7),
('Squirtle','1993-04-02',3,false,-12.13),
('Angemon','2005-06-12',1,true,-45),
('Boarmon','2005-06-07',7,true,20.4),
('Blossom','1998-10-13',3,true,17),
('Ditto','2022-05-14',4,true,22);

--Modify your inserted animals so it includes the species_id value
BEGIN;
--If the name ends in "mon" it will be Digimon
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
--All other animals are Pokemon
UPDATE animals SET species_id = 1 WHERE species_id IS null;
--Commit the changes
COMMIT;

--Modify your inserted animals to include owner information (owner_id):
BEGIN;
-- Sam Smith owns Agumon.
UPDATE animals SET owner_id = 1 WHERE id = 12;
-- Jennifer Orwell owns Gabumon and Pikachu.
UPDATE animals SET owner_id = 2 WHERE (id = 13 OR id=14);
-- Bob owns Devimon and Plantmon.
UPDATE animals SET owner_id = 3 WHERE (id = 15 OR id=17);
-- Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals SET owner_id = 4 WHERE (id = 16 OR id = 18 OR id=21);
-- Dean Winchester owns Angemon and Boarmon.
UPDATE animals SET owner_id = 5 WHERE (id = 19 OR id=20);
--Commit changes
COMMIT;

--TABLE OWNERS
--Popullate table owners
INSERT INTO owners(full_name, age)
	VALUES 
	('Sam Smith',34),
	('Jennifer Orwell',19),
	('Bob',45),
	('Melody Pond',77),
	('Dean Winchester',14),
	('Jodie Whittaker',38);
	
--TABLE SPECIES
--Popullate table species
INSERT INTO species(name)
	VALUES 
	('Pokemon'),
	('Digimon');
	
--TABLE VETS
--Insert data for vets
INSERT INTO vets(name, age, date_of_graduation)
VALUES 
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

--TABLE SPECIALIZATIONS
--Insert data for specializations
INSERT INTO specializations(vet_id, species_id)
VALUES 
(1,1),
(3,2),
(3,1),
(4,2);

--TABLE VISITS
--Insert data for visits
INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES
(12, 1, '2020-05-24'),
(12, 3, '2020-07-22'),
(13, 4, '2021-02-02'),
(14, 2, '2020-01-05'),
(14, 2, '2020-03-08'),
(14, 2, '2020-05-14'),
(15, 3, '2021-05-04'),
(16, 4, '2021-02-24'),
(17, 2, '2019-12-21'),
(17, 1, '2020-08-10'),
(17, 2, '2021-04-07'),
(18, 3, '2019-09-29'),
(19, 4, '2020-10-03'),
(19, 4, '2020-11-04'),
(20, 2, '2019-01-24'),
(20, 2, '2019-05-15'),
(20, 2, '2020-02-27'),
(20, 2, '2020-08-03'),
(21, 3, '2020-05-24'),
(21, 1, '2021-01-11');
