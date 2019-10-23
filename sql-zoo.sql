-- This is a comment in sql code

--  SELECT basics

-- Introducing the world table of countries
SELECT population FROM world
  WHERE name = 'Germany'

-- Scandinavia
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark')

-- Just the right size
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

-- SELECT from WORLD Tutorial

-- Introduction
SELECT name, continent, population FROM world

-- Large Countries
SELECT name FROM world
WHERE population >= 200000000

-- Per capita GDP
SELECT name, gdp/population FROM world
WHERE population >= 200000000

-- South America In millions
SELECT name, population/1000000
FROM world
WHERE continent = 'South America'

-- France, Germany, Italy
SELECT name, population
FROM world
WHERE name in ('France', 'Germany', 'Italy')

-- United
SELECT name
FROM world
WHERE name LIKE 'United%'

-- Two ways to be big
SELECT name, population, area FROM world
WHERE area > 3000000 OR population > 250000000

-- One or the other (but not both)
SELECT name, population, area FROM world
WHERE area > 3000000 XOR population > 250000000

-- Rounding
SELECT name, ROUND(population / 1000000, 2) AS population, ROUND(gdp / 1000000000, 2) AS gdp FROM world
WHERE continent = 'South America'

-- Trillion dollar economies
SELECT name, ROUND(gdp/population, -3) AS 'per-capita GDP' FROM world
WHERE gdp >= 1000000000000

-- Name and capital have the same length
SELECT name, capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital)

-- Matching name and capital
SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1) AND name <> capital

-- All the vowels
SELECT name
   FROM world
WHERE name LIKE '%a%'
  AND name LIKE '%e%'
  AND name LIKE '%i%'
  AND name LIKE '%o%'
  AND name LIKE '%u%'
  AND name NOT LIKE '% %'

-- SELECT from Nobel Tutorial

-- Winners from 1950
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1960

-- 1962 Literature
SELECT winner
  FROM nobel
 WHERE yr = 1960
   AND subject = 'Physics'

-- Albert Einstein


-- WEBSITE BUGGY NOT SHOWING REST OF MY WORK

-- SELECT within SELECT Tutorial

-- Bigger than Russia
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

-- Richer than UK
SELECT name FROM world
  WHERE continent = 'Europe'
AND gdp/population >
  (SELECT gdp/population FROM world
     WHERE name = 'United Kingdom')

-- Neighbours of Argentina and Australia
SELECT name, continent FROM world
WHERE continent = 
  (SELECT continent FROM world
   WHERE name = ('Argentina'))
  OR 
continent = 
  (SELECT continent FROM world
   WHERE name = ('Australia'))
ORDER BY name

-- Between Canada and Poland
SELECT name, population FROM world
WHERE population > 
  (SELECT population FROM world 
   WHERE name = 'Canada')
AND
  population <
  (SELECT population FROM world 
   WHERE name = 'Poland')

-- Percentages of Germany

SELECT name,
CONCAT(FORMAT(100 * population / (SELECT population FROM world 
  WHERE name = 'Germany'), 'P'),  '%')
FROM world
WHERE continent = 'Europe'

-- Bigger than every country in Europe
SELECT name FROM world
WHERE gdp > all
  (SELECT gdp FROM world WHERE continent = 'Europe' AND gdp IS NOT NULL)

-- Largest in each continent
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT MAX(area) FROM world y
        WHERE y.continent = x.continent
          AND population>0)

-- First country of each continent (alphabetically)
SELECT continent, MIN(name) FROM world
GROUP BY continent
ORDER BY continent ASC

-- Difficult Questions That Utilize Techniques Not Covered In Prior Sections

-- Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.

SELECT name, continent, population FROM world x
WHERE 25000000 >= ALL
(SELECT population FROM world y 
WHERE x.continent = y.continent)

-- Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.

select name, population from world              
where population > (SELECT population FROM world where name = 'Australia')

-- SUM and COUNT

-- Total world population
SELECT SUM(population)
FROM world

-- List of continents
SELECT DISTINCT continent FROM world

-- GDP of Africa
SELECT SUM(gdp) FROM world
WHERE continent = 'Africa'

-- Count the big countries
SELECT COUNT(name) FROM world
WHERE area > 1000000

-- Baltic states population
SELECT SUM(population) FROM world
WHERE name = 'Estonia'
OR name = 'Latvia'
OR name = 'Lithuania'

-- Using GROUP BY and HAVING
SELECT DISTINCT continent, COUNT(name) FROM world
GROUP BY continent

-- Counting big countries in each continent
SELECT continent, COUNT(name) FROM world
WHERE population > 10000000
GROUP BY continent

-- Counting big continents
SELECT DISTINCT continent FROM world x
WHERE 100000000 < ALL
  (SELECT SUM(population) FROM world y
   WHERE x.continent = y.continent)

-- The JOIN operation

-- 1
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

-- 2
SELECT id,stadium,team1,team2
  FROM game
    WHERE id = ALL 
      (SELECT matchid FROM goal WHERE matchid = 1012)

-- 3
SELECT player,teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
  WHERE teamid = 'GER'

-- 4
SELECT team1, team2, player
  FROM game JOIN goal ON (id = matchid)
  WHERE player LIKE 'Mario%'

-- 5
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam on teamid=id
    WHERE gtime <= 10

-- 6
SELECT mdate, teamname 
  FROM game JOIN eteam ON team1 = eteam.id
    WHERE coach = 'Fernando Santos'

-- 7
SELECT player 
FROM goal 
JOIN game 
ON (goal.matchid = game.id)
WHERE stadium = 'National Stadium, Warsaw'

-- 8
SELECT DISTINCT player
  FROM goal 
  JOIN game 
  ON goal.matchid = game.id
    WHERE (team1 = 'GER' OR team2 = 'GER')
    AND teamid <> 'GER'

-- 9
SELECT teamname, COUNT(teamid)
  FROM eteam JOIN goal ON id=teamid
  GROUP BY teamname

-- 10
SELECT stadium, COUNT(teamid)
FROM game
JOIN goal
ON (game.id = goal.matchid)
GROUP BY stadium

-- 11
SELECT matchid, mdate, COUNT(player) goals_scored
FROM game
JOIN goal ON goal.matchid = game.id
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY goal.matchid, game.mdate

-- 12
SELECT matchid, mdate, COUNT(player)
FROM goal JOIN game ON (game.id = goal.matchid)
WHERE goal.teamid = 'GER'
GROUP BY game.mdate, goal.matchid

-- 13
SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2

FROM game JOIN goal ON goal.matchid = game.id

GROUP BY game.id, game.mdate, game.team1, game.team2
ORDER BY mdate, matchid, team1, team2

-- More JOIN operations

-- 1962 movies

SELECT id, title
 FROM movie
 WHERE yr=1962

-- When was Citizen Kane released?

SELECT yr
FROM movie
WHERE title = 'Citizen Kane'

-- Star Trek movies

SELECT id, title, yr
FROM movie
WHERE title LIKE ('%Star Trek%')

-- id for actor Glenn Close

SELECT id FROM actor
WHERE name = 'Glenn Close'

-- id for Casablanca

SELECT id FROM movie
WHERE title = 'Casablanca'

-- Cast list for Casablanca

SELECT actor.name
FROM actor JOIN casting ON (actor.id = casting.actorid)
WHERE casting.movieid = 11768

-- Alien cast list

SELECT DISTINCT actor.name
FROM casting
JOIN movie ON (movie.id = casting.movieid)
JOIN actor ON (actor.id = casting.actorid)
WHERE movie.title = 'Alien'


-- Harrison Ford movies

SELECT title
FROM casting
JOIN actor ON (actor.id = casting.actorid)
JOIN movie ON (movie.id = casting.movieid)
WHERE actor.name = 'Harrison Ford'

-- Harrison Ford as a supporting actor

SELECT title
FROM casting
JOIN actor ON (actor.id = casting.actorid)
JOIN movie ON (movie.id = casting.movieid)
WHERE actor.name = 'Harrison Ford'
AND casting.ord <> 1

-- Lead actors in 1962 movies

SELECT movie.title, actor.name
FROM casting
JOIN actor ON (actor.id = casting.actorid)
JOIN movie ON (movie.id = casting.movieid)
WHERE yr = 1962
AND ord = 1

-- Busy years for Rock Hudson

SELECT yr, COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- Lead actor in Julie Andrews movies

SELECT title, actor.name
FROM casting 
JOIN movie ON (movieid = id)
JOIN actor ON (actor.id = casting.actorid)
WHERE 
casting.ord = 1
AND
movie.id IN 
(
SELECT movieid FROM casting
WHERE actorid IN 
(
  SELECT id FROM actor
  WHERE name='Julie Andrews'
)
)

-- SELECT movie.title, MIN(actor.name)
-- FROM casting
-- JOIN movie ON (movie.id = casting.movieid)
-- JOIN actor ON (actor.id = casting.actorid)

-- WHERE movie.id = ALL
--    (SELECT movie.id FROM actor JOIN casting ON (casting.actorid = actor.id)
--     WHERE casting.actorid = (SELECT name FROM actor WHERE name='Julie Andrews'))
-- AND casting.ord = 1

-- GROUP BY movie.title

-- SELECT movie.title
-- FROM casting
-- JOIN movie ON (movie.id = casting.movieid)
-- JOIN actor ON (actor.id = casting.actorid)

-- WHERE movie.id = ALL
-- (SELECT casting.movieid 
-- FROM actor 
-- JOIN casting ON (casting.actorid = actor.id)
-- WHERE casting.actorid = 
-- (SELECT id FROM actor WHERE name='Julie Andrews'))

-- GROUP BY movie.title

-- Actors with 30 leading roles

SELECT actor.name
FROM casting
JOIN actor
ON (casting.actorid = actor.id)
WHERE casting.ord = 1

GROUP BY actor.name
HAVING COUNT(casting.actorid) >= 30
ORDER BY COUNT(casting.actorid) DESC

-- List the films released in the year 1978 ordered by the number of actors in the cast, then by title.

SELECT title, COUNT(casting.actorid)
FROM movie
JOIN casting ON (movie.id = casting.movieid)
WHERE yr = 1978
GROUP BY movie.title
ORDER BY COUNT(casting.actorid) DESC, title ASC

-- List all the people who have worked with 'Art Garfunkel'.

SELECT DISTINCT name
FROM actor
WHERE actor.id IN
(
SELECT actorid
FROM casting
WHERE movieid IN
(
SELECT movieid
FROM casting
WHERE casting.actorid = 
    (SELECT id
     FROM actor
     WHERE name = 'Art Garfunkel')
)
)
AND name <> 'Art Garfunkel'