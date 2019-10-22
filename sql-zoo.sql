-- This is a comment in sql code

--SELECT basics
--1
SELECT population
FROM world
WHERE name = 'Germany'

--2
SELECT name, population
FROM world
WHERE name IN ('Denmark', 'Sweden', 'Norway');

--3
SELECT name, area
FROM world
WHERE area BETWEEN 200000 AND 250000

--SELECT from WORLD Tutorial

--1
SELECT name, continent, population
FROM world

--2
SELECT name
FROM world
WHERE name  IN ( 'Brazil', 'China', 'India', 'Indonesia', 'United States');

--3
SELECT name, gdp/population
FROM world
WHERE population >= 200000000

--4
SELECT name, population/1000000
FROM world
WHERE continent = 'South America'

--5
SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy')

--6
SELECT name
FROM world
wHERE name  LIKE 'United%'

--7
SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000

--8
SELECT name, population, area
FROM world
WHERE area > 3000000 XOR population > 250000000

--9
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2)
FROM world
WHERE continent = 'South America'

--10
SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp >= 1000000000000

--11
SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital) 

--12
SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1) AND name <> capital

--13
SELECT name
FROM world
WHERE name LIKE '%a%'
    AND name LIKE '%e%'
    AND name LIKE '%i%'
    AND name LIKE '%o%'
    AND name LIKE '%u%'
    AND name NOT LIKE '% %'


  --  SELECT from Nobel Tutorial
    
    --1
    SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950

    --2
    SELECT winner
FROM nobel
WHERE yr = 1962
    AND subject = 'literature'

    --3
    SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein'

    --4
    SELECT winner
FROM nobel
WHERE subject = 'peace'
    AND yr >= 2000

    --5
    SELECT yr, subject, winner
FROM nobel
WHERE subject = 'literature'
    AND yr BETWEEN 1980 AND 1989

    --6
    SELECT *
FROM nobel
WHERE winner IN ('Theodore Roosevelt',  'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')

    --7

