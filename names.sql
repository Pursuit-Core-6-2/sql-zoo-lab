-- https://sqlzoo.net/wiki/SELECT_names


-- 1. 
-- You can use WHERE name LIKE 'B%' to find the countries that start with "B".
-- The % is a wild-card it can match any characters
-- Find the country that start with Y
SELECT name 
FROM world
WHERE name 
LIKE 'Y%'
-- Correct answer
-- name
-- Yemen


-- 2.
-- Find the countries that end with y
SELECT name 
FROM world
WHERE name 
LIKE '%Y'
-- Correct answer
-- name
-- Turkey
-- Germany
-- Hungary
-- Italy
-- Norway
-- Vatican City
-- Paraguay
-- Uruguay


-- 3.
-- Luxembourg has an x - so does one other country. List them both.
-- Find the countries that contain the letter x
SELECT name 
FROM world
WHERE name
LIKE '%x%'
-- Correct answer
-- name
-- Luxembourg
-- Mexico


-- 4.
-- Iceland, Switzerland end with land - but are there others?
-- Find the countries that end with land
SELECT name 
FROM world
WHERE name 
LIKE '%land'
-- Correct answer
-- name
-- Swaziland
-- Thailand
-- Finland
-- Iceland
-- Ireland
-- Poland
-- Switzerland
-- New Zealand


-- 5.
-- Columbia starts with a C and ends with ia - there are two more like this.
-- Find the countries that start with C and end with ia
SELECT name 
FROM world
WHERE name 
LIKE 'C%ia'
-- Correct answer
-- name
-- Cambodia
-- Colombia
-- Croatia


-- 6.
-- Greece has a double e - who has a double o?
-- Find the country that has oo in the name
SELECT name 
FROM world
WHERE name 
LIKE '%oo%'
-- Correct answer
-- name
-- Cameroon


-- 7.
-- Bahamas has three a - who else?
-- Find the countries that have three or more a in the name
SELECT name 
FROM world
WHERE name 
LIKE '%a%a%a%'
-- Correct answer
-- name
-- Central African Republic
-- Equatorial Guinea
-- Madagascar
-- Mauritania
-- Tanzania
-- Afghanistan
-- Azerbaijan
-- Malaysia
-- Saudi Arabia
-- United Arab Emirates
-- Antigua and Barbuda
-- Bahamas
-- Jamaica
-- Trinidad and Tobago
-- Albania
-- Bosnia and Herzegovina
-- Kazakhstan
-- Canada
-- Guatemala
-- Nicaragua
-- Panama
-- Australia
-- Marshall Islands
-- Micronesia, Federated States of
-- Papua New Guinea
-- Paraguay
-- Saint Vincent and the Grenadines


-- 8.
-- India and Angola have an n as the second character. You can use the underscore as a single character wildcard.
-- -- SELECT name FROM world
-- --  WHERE name LIKE '_n%'
-- -- ORDER BY name
-- Find the countries that have "t" as the second character.
SELECT name 
FROM world
WHERE name 
LIKE '_t%'
ORDER BY name
-- Correct answer
-- name
-- Ethiopia
-- Italy


-- 9.
-- Lesotho and Moldova both have two o characters separated by two other characters.
-- Find the countries that have two "o" characters separated by two others.
SELECT name 
FROM world
WHERE name 
LIKE '%o__o%'
-- Correct answer
-- name
-- Congo, Democratic Republic of
-- Congo, Republic of
-- Lesotho
-- Morocco
-- Sao Tomé and Príncipe
-- Mongolia
-- Moldova


-- 10.
-- Cuba and Togo have four characters names.
-- Find the countries that have exactly four characters.
SELECT name 
FROM world
WHERE name 
LIKE '____'
-- Correct answer
-- name
-- Chad
-- Mali
-- Togo
-- Iran
-- Iraq
-- Laos
-- Oman
-- Cuba
-- Fiji
-- Peru



-- Harder Questions
-- Well done for getting this far.
-- The next questions are optional and only for students who are finding the basic questions too easy.


-- 11.
-- The capital of Luxembourg is Luxembourg. 
-- Show all the countries where the capital is the same as the name of the country.
-- Find the country where the name is the capital city.
SELECT name
FROM world
WHERE name 
LIKE capital
-- Correct answer
-- name
-- Djibouti
-- Luxembourg
-- San Marino
-- Singapore


-- 12.
-- The capital of Mexico is Mexico City. 
-- Show all the countries where the capital has the country together with the word "City".
-- Find the country where the capital is the country plus "City".
-- The concat function
SELECT name
FROM world
WHERE capital
LIKE concat(name, ' city')
-- Correct answer
-- name
-- Guatemala
-- Kuwait
-- Mexico
-- Panama


-- 13.
-- Find the capital and the name where the capital includes the name of the country.
SELECT capital, name
FROM world
WHERE capital 
LIKE concat('%', name, '%')
-- Correct answer
-- capital	            name
-- Andorra la Vella	    Andorra
-- Djibouti	            Djibouti
-- Guatemala City	    Guatemala
-- Kuwait City	        Kuwait
-- Luxembourg	        Luxembourg
-- Mexico City	        Mexico
-- Monaco-Ville	        Monaco
-- Panama City	        Panama
-- San Marino	        San Marino
-- Singapore	        Singapore


-- 14.
-- Find the capital and the name where the capital is an extension of name of the country.
-- You should include Mexico City as it is longer than Mexico. 
-- You should not include Luxembourg as the capital is the same as the country.
SELECT capital, name
FROM world
WHERE capital
LIKE concat('%', name, '%') 
AND capital != name
-- Correct answer
-- capital	            name
-- Andorra la Vella	    Andorra
-- Guatemala City	    Guatemala
-- Kuwait City	        Kuwait
-- Mexico City	        Mexico
-- Monaco-Ville	        Monaco
-- Panama City	        Panama


-- 15.
-- For Monaco-Ville the name is Monaco and the extension is -Ville.
-- Show the name and the extension where the capital is an extension of name of the country.
-- You can use the SQL function REPLACE.
SELECT name, REPLACE(capital, name,'')
FROM world
WHERE capital
LIKE concat('%', name, '%') 
AND capital != name
-- Correct answer
-- name        	REPLACE(capit..
-- Andorra     	la Vella
-- Guatemala    City
-- Kuwait      	City
-- Mexico      	City
-- Monaco      	-Ville
-- Panama      	City