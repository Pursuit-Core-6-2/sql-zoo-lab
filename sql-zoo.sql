-- Joseph P. Pasaoa
-- SQL Zoo Lab
--
--


-- -- -- 0 SELECT basics
-- 

-- 1
SELECT population
  FROM world
  WHERE name = 'Germany';

-- 2
SELECT name, population
  FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3
SELECT name, area
  FROM world
  WHERE area BETWEEN 200000 AND 250000;


-- -- -- 1 SELECT name
-- 

-- 1
SELECT name
  FROM world
  WHERE name LIKE 'Y%';

-- 2
SELECT name
  FROM world
  WHERE name LIKE '%y';

-- 3
SELECT name
  FROM world
  WHERE name LIKE '%x%';

-- 4
SELECT name
  FROM world
  WHERE name LIKE '%land';

-- 5
SELECT name
  FROM world
  WHERE name LIKE 'C%ia';

-- 6
SELECT name
  FROM world
  WHERE name LIKE '%oo%';

-- 7
SELECT name
  FROM world
  WHERE name LIKE '%a%a%a%';

-- 8
SELECT name
  FROM world
  WHERE name LIKE '_t%';

-- 9
SELECT name
  FROM world
  WHERE name LIKE '%o__o%';

-- 10
SELECT name
  FROM world
  WHERE name LIKE '____';

-- HARD 11
SELECT name
  FROM world
  WHERE name = capital;

-- HARD 12
SELECT name
  FROM world
  WHERE capital LIKE concat(name, '%City');

-- HARD 13
SELECT capital, name
  FROM world
  WHERE capital LIKE concat('%', name, '%');

-- HARD 14
SELECT capital, name
  FROM world
  WHERE capital LIKE concat(name, '_%');

-- HARD 15
SELECT name, REPLACE (capital, name, '')
  FROM world
  WHERE capital LIKE concat(name, '_%');


-- -- -- 2 SELECT from World
--

-- 1
