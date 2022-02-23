-- DATA CLEANING PORTFOLIO PROJECT

USE sql_datacleaning;

CREATE TABLE met_objects_clean AS
SELECT * FROM met_objects;

SELECT *
FROM sql_datacleaning.met_objects_clean;

-- Clean column names
-- I'm still looking for an efficient way to automate this process...

ALTER TABLE `sql_datacleaning`.`met_objects_clean` 
CHANGE COLUMN `ï»¿Object Number` `object_number` TEXT NULL DEFAULT NULL,
CHANGE COLUMN `Is Highlight` `is_highlight` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Is Timeline Work` `is_timeline_work` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Is Public Domain` `is_public_domain` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Object ID` `object_id` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Gallery Number` `gallery_number` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Department` `department` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `AccessionYear` `accessionyear` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Object Name` `object_name` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Title` `title` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Culture` `culture` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Period` `period` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Dynasty` `dynasty` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Reign` `reign` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Portfolio` `portfolio` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Constituent ID` `constituent_id` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Artist Role` `artist_role` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Artist Prefix` `artist_prefix` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Artist Display Name` `artist_display_name` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Artist Display Bio` `artist_display_bio` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Artist Suffix` `artist_suffix` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Artist Alpha Sort` `artist_alpha_sort` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Artist Nationality` `artist_nationality` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Artist Begin Date` `artist_begin_date` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Artist End Date` `artist_end_date` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Artist Gender` `artist_gender` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Artist ULAN URL` `artist_ULAN_URL` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Artist Wikidata URL` `artist_wikidata_URL` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Object Date` `object_date` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Object Begin Date` `object_begin_date` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Object End Date` `object_end_date` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Medium` `medium` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Dimensions` `dimensions` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Credit Line` `credit_line` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Geography Type` `geography_type` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `City` `city` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `State` `state` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `County` `county` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Country` `country` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Region` `region` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Subregion` `subregion` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Locale` `locale` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Locus` `locus` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Excavation` `excavation` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `River` `river` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Classification` `classification` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Rights and Reproduction` `rights_and_reproduction` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Link Resource` `link_resource` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Object Wikidata URL` `object_wikidata_URL` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Metadata Date` `metadata_date` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Repository` `repository` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Tags` `tags` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Tags AAT URL` `tags_AAT_URL` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Tags Wikidata URL` `tags_wikidata_URL` TEXT NULL DEFAULT NULL ;



-- Fix typo in 'object_number', 'artist_display_bio' and 'object_date'

SELECT *
FROM met_objects_clean
WHERE object_number LIKE '%â€“%';

UPDATE met_objects_clean
SET
	object_number = REPLACE(object_number, "â€“", "-"),
    artist_display_bio = REPLACE(artist_display_bio, "â€“", "-"),
    object_date = REPLACE(object_date, "â€“", "-");

-- Find duplicates

SELECT object_number, object_id, link_resource, COUNT(*)
FROM met_objects_clean
GROUP BY object_number, object_id, link_resource
HAVING COUNT(*) > 1;



-- [TRY] Separate each tag in different columns

SELECT tags, LENGTH(tags)
FROM met_objects_clean
ORDER BY LENGTH(tags) DESC






-- Checklist:

-- +Clean column names
-- +Misspelled words/numbers
-- +Duplicates
-- Inconsistent strings/date formats
-- Extra spaces/characters
-- Null data
-- Mismatched data types
-- Truncated data
