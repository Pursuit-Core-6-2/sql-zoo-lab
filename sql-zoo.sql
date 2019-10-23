-- This is a comment in sql code

--
-- 0 SELECT Basics
--

-- 1
SELECT population FROM world
  WHERE name = 'Germany'

-- 2
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

--
-- 1 SELECT from WORLD basics
--

-- 1
SELECT name, continent, population FROM world

-- 2
SELECT name FROM world
WHERE population > 200000000

-- 3
SELECT name, gdp/population FROM world
WHERE population > 200000000

-- 4
SELECT name, population/1000000 FROM world
WHERE continent = 'South America'

-- 5
SELECT name, population FROM world
WHERE name IN ('France', 'Germany', 'Italy')

-- 6
SELECT name FROM world
WHERE name LIKE 'United%'

-- 7
SELECT name, population, area FROM world
WHERE area > 3000000 
OR population >250000000

-- 8
SELECT name, population, area FROM world
WHERE area > 3000000
XOR population > 250000000

-- 9
SELECT name,
  ROUND(population/1000000,2),
  ROUND(GDP/1000000000,2)
FROM world
WHERE continent = 'South America'

-- 10
SELECT name, 
   ROUND(GDP/population,-3)
FROM world
WHERE GDP > 1000000000000

-- 11
SELECT name, capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital)

-- 12
SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1)
AND name <> capital

-- 13
SELECT name
   FROM world
WHERE name LIKE '%a%'
AND name LIKE '%e%'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%'
AND name NOT LIKE '% %'


--
-- 2 SELECT from Nobel
--

-- 1
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

-- 2
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

-- 3
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein'

-- 4
SELECT winner
FROM nobel
WHERE subject = 'Peace'
AND yr >= 2000

-- 5
SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Literature'
AND yr BETWEEN 1980 AND 1989

-- 6
SELECT yr, subject, winner 
FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama')

-- 7
SELECT winner 
FROM nobel
WHERE winner LIKE 'John%'

-- 8
SELECT yr, subject, winner 
FROM nobel 
WHERE subject = 'Physics'
AND yr = 1980
OR subject = 'Chemistry'
AND yr = 1984

-- 9
SELECT yr, subject, winner 
FROM nobel 
WHERE yr = 1980
AND NOT subject = 'Chemistry'
AND NOT subject = 'Medicine'

-- 10
SELECT yr, subject, winner 
FROM nobel 
WHERE subject = 'Medicine'
AND yr < 1910
OR subject = 'Literature'
AND yr >= 2004

-- 11


--
-- 3 SELECT within SELECT
--

-- 1
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

-- 2
SELECT name
FROM world
WHERE continent = 'Europe' 
AND gdp/population >
  (SELECT gdp/population 
   FROM world
   WHERE name = 'United Kingdom')

-- 3
SELECT name, continent 
FROM world
WHERE continent IN
(SELECT continent
FROM world
WHERE continent = 'Oceania'
OR continent = 'South America')
ORDER BY name ASC

-- 4
SELECT name, population
FROM world
WHERE population >
(SELECT population
FROM world
WHERE name = 'Canada')
AND population <
(SELECT population
FROM world
WHERE name = 'Poland')

-- 5
SELECT name, (population/population WHERE country = 'Germany' * 100 CONAT '%')
FROM world
WHERE continent = 'Europe'

-- 6
SELECT name
FROM world
WHERE gdp >
ALL(SELECT name
FROM world
WHERE continent = 'Europe')

-- 7

