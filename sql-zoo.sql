-- This is a comment in sql code

--
-- 0 SELECT basics
--

-- 1
SELECT population FROM world
  WHERE name = 'Germany'

--2
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark')

--3
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

--
-- 1 SELECT name
--

-- 1
SELECT name FROM world
  WHERE name LIKE 'Y%'

--2
SELECT name FROM world
  WHERE name LIKE '%Y'

--3
SELECT name FROM world
  WHERE name LIKE '%x%'

--4 
