-- DATA CLEANING PORTFOLIO PROJECT

USE sql_datacleaning;

CREATE TABLE met_objects_clean AS
SELECT * FROM met_objects;

SELECT *
FROM sql_datacleaning.met_objects_clean;

-- Clean column names

ALTER TABLE `sql_datacleaning`.`met_objects_clean` 
CHANGE COLUMN `ï»¿Object Number` `object_number` TEXT NULL DEFAULT NULL;


-- [TRY] Create a table with the new column names, then UPDATE using the new names with a JOIN

CREATE TABLE met_new_column_names AS
SELECT REPLACE(LOWER(COLUMN_NAME), ' ', '_') AS new_names, ORDINAL_POSITION 
FROM `INFORMATION_SCHEMA`.`COLUMNS` 
WHERE `TABLE_SCHEMA`='sql_datacleaning' 
    AND `TABLE_NAME`='met_objects_clean';

-- Try this now

-- UPDATE TABLA1
-- SET TABLA1.COLUMNA = TABLA2.COLUMNA
-- FROM TABLA
-- JOIN TABLA2
-- ON (TABLA1.ORDINAL_POSITION = TABLA2.ORDINAL_POSITION)


-- SELECT * -- REPLACE(LOWER(COLUMN_NAME), ' ', '_')
-- FROM `INFORMATION_SCHEMA`.`COLUMNS` 
-- WHERE `TABLE_SCHEMA`='sql_datacleaning' 
    -- AND `TABLE_NAME`='met_objects_clean'
-- ORDER BY ORDINAL_POSITION;