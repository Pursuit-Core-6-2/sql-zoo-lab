-- This is a comment in sql code
-- SELECT basics 
--1
SELECT population FROM world
WHERE name = 'germany'
--2
SELECT name, population FROM world
WHERE name IN ('sweden', 'norway', 'denmark')
--3
SELECT name, area FROM world
WHERE area BETWEEN 200000 AND 250000
--4

--SELECT from WORLD tutorial
--1
SELECT name, continent, population FROM world
--2
SELECT name FROM world WHERE population > 200000000
--3
SELECT name, gdp/population FROM world
WHERE gdp/population > 200000000
--4 
SELECT name, population/1000000 FROM world
WHERE continent = 'south america'
--5
SELECT name, population FROM world
WHERE name IN ('france', 'germany', 'italy')
--6
SELECT name FROM world
WHERE name LIKE 'united%'
--7
SELECT name, population, area FROM world
WHERE area > 3000000 OR population > 250000000
--8
SELECT name, population, area FROM world
WHERE area > 3000000 XOR population > 250000000
--9
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2) FROM world
WHERE continent = 'south america'
--10
SELECT name, ROUND(gdp/population, -3) FROM world
WHERE gdp > 1000000000000
--11
SELECT name, capital FROM world
 WHERE LENGTH(name) = LENGTH(capital)
 --12
 SELECT name, capital FROM world 
WHERE LEFT(name,1) = LEFT(capital,1) AND name <> capital
--13

