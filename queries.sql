/*Queries that provide answers to the questions from all projects.*/

--QUERIES FROM TABLE ANIMALS

--All animals whose name ends in "mon".
SELECT * FROM animals WHERE name LIKE '%mon';
--List the name of all animals born between 2016 and 2019.
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
--List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT name FROM animals WHERE neutered = 'true' AND escape_attempts < 3;
--List the date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
--List name and escape attempts of animals that weigh more than 10.5kg
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
--Find all animals that are neutered.
SELECT * FROM animals WHERE neutered = 'true';
--Find all animals not named Gabumon.
SELECT * FROM animals WHERE name != 'Gabumon';
--Find all animals with a weight between 10.4kg and 17.3kg
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

--UPDATES, DELETES AND TRANSACTIONS
--Transaction 1: setting the species column to unspecified
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT species from animals;
ROLLBACK;
--Verify transaction's 1 rollback
SELECT species FROM animals;

--Transaction 2: update species column by name
BEGIN;
--Set digimon in species where animals' name ends in mon
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
--Set pokemon in species where a vaule isn't set for this column
UPDATE animals SET species = 'pokemon' WHERE species IS null;
--Commit the transaction 2
COMMIT;
--Verify transaction's 2 changes persist
SELECT name, species FROM animals;

--Transaction 3: delete animal's records
BEGIN;
--Delete all records
DELETE FROM animals;
ROLLBACK;
--Verify if all records in the animals table still exists
SELECT COUNT(*) FROM animals;

--Transaction 4: update weight
BEGIN;
--Delete all animals born after Jan 1st, 2022.
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
--Create a savepoint for the transaction.
SAVEPOINT SP1;
--Update all animals' weight to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1;
--Rollback to the savepoint
ROLLBACK TO SP1;
--Update all animals' weights that are negative to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
--Commit transaction
COMMIT;
--Verify animals table data after transaction
SELECT name, weight_kg FROM animals;


