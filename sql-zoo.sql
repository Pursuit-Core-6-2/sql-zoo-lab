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
SELECT name, continent, population
  FROM world;

-- 2
SELECT name
  FROM world
  WHERE population > 200000000;

-- 3
SELECT name, GDP / population
  FROM world
  WHERE population > 200000000;

-- 4
SELECT name, population / 1000000
  FROM world
  WHERE continent = 'South America';

-- 5
SELECT name, population
  FROM world
  WHERE name IN ('France', 'Germany', 'Italy');

-- 6
SELECT name
  FROM world
  WHERE name LIKE '%United%';

-- 7
SELECT name, population, area
  FROM world
  WHERE area > 3000000 OR population > 250000000;

-- 8
SELECT name, population, area
  FROM world
  WHERE area > 3000000 XOR population > 250000000;

-- 9
SELECT name, ROUND(population / 1000000, 2), ROUND(GDP / 1000000000, 2)
  FROM world
  WHERE continent = 'South America';

-- 10
SELECT name, ROUND(GDP / population, -3)
  FROM world
  WHERE GDP > 1000000000000;

-- 11
SELECT name, capital
  FROM world
  WHERE LENGTH(name) = LENGTH(capital);

-- 12
SELECT name, capital
  FROM world
  WHERE LEFT(name, 1) = LEFT(capital, 1) AND name <> capital;

-- 13
SELECT name
  FROM world
  WHERE name NOT LIKE '% %' AND name LIKE '%a%' AND name LIKE '%e%' AND 
    name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%';


-- -- -- 3 SELECT from Nobel
--

-- 1
SELECT yr, subject, winner
  FROM nobel
  WHERE yr = 1950;

-- 2
SELECT winner
  FROM nobel
  WHERE yr = 1962 AND subject = 'Literature';

-- 3
SELECT yr, subject
  FROM nobel
  WHERE winner = 'Albert Einstein';

-- 4
SELECT winner
  FROM nobel
  WHERE yr >= 2000 AND subject = 'Peace';

-- 5
SELECT *
  FROM nobel
  WHERE subject = 'Literature' AND yr >= 1980 AND yr <= 1989;

-- 6
SELECT *
  FROM nobel
  WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');

-- 7
SELECT winner
  FROM nobel
  WHERE winner LIKE 'John_%';

-- 8
SELECT yr, subject, winner
  FROM nobel
  WHERE yr = 1980 AND subject = 'Physics' XOR subject = 'Chemistry' AND yr = 1984;

-- 9
SELECT yr, subject, winner
  FROM nobel
  WHERE yr = 1980 AND subject <> 'Chemistry' AND subject <> 'Medicine';

-- 10
SELECT yr, subject, winner
  FROM nobel
  WHERE subject = 'Medicine' AND yr < 1910 OR subject = 'Literature' AND yr >= 2004;

-- HARD 11
SELECT *
  FROM nobel
  WHERE winner = 'Peter Grünberg';

-- HARD 12
SELECT *
  FROM nobel
  WHERE winner = 'Eugene O''Neill';

-- HARD 13
SELECT winner, yr, subject
  FROM nobel
  WHERE winner LIKE 'Sir_%'
  ORDER BY yr DESC;

-- HARD 14
SELECT winner, subject
  FROM nobel
  WHERE yr=1984
  ORDER BY subject IN ('Chemistry', 'Physics') ASC, subject ASC, winner ASC;


-- -- -- 4 SELECT within SELECT
--

-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- DIFFICULT 9
-- DIFFICULT 10

