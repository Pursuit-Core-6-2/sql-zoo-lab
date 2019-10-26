SELECT population FROM world
  WHERE name = 'Germany'
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

SELECT name, continent, population FROM world 
SELECT name FROM world WHERE population >=200000000
SELECT name, gdp/population FROM world WHERE population>200000000
SELECT name, population/1000000 FROM world WHERE continent = 'South America' 
SELECT name, population FROM world WHERE name in ('France', 'Germany', 'Italy')
SELECT name FROM world WHERE name LIKE '%United%'
SELECT name, population, area  FROM world WHERE area>3000000 OR population>250000000
SELECT name, population, area  FROM world WHERE area>3000000 AND  population< 250000000 OR  area<3000000 AND  population> 250000000 
SELECT name, ROUND(population/1000000,2), ROUND(GDP/1000000000,2) FROM world WHERE continent = 'South America'
SELECT name, Round(GDP/population,-3) FROM world WHERE GDP>1000000000000
SELECT name,capital FROM world WHERE LENGTH(name) = LENGTH(capital) 
SELECT name, capital FROM world WHERE LEFT(capital,1) = LEFT(name,1) AND LEFT(capital,LENGTH(capital)) <> name 
SELECT name FROM world WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%' AND name NOT LIKE '% %'





SELECT yr, subject, winner FROM nobel WHERE yr = 1950
SELECT winner FROM nobel WHERE yr = 1962 AND subject = 'Literature'
SELECT yr, subject FROM nobel WHERE winner = 'Albert Einstein'
SELECT winner FROM nobel WHERE yr>=2000 AND subject = 'Peace'
SELECT yr, subject, winner FROM nobel WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989
SELECT *  FROM nobel WHERE winner IN('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')
SELECT winner FROM nobel WHERE winner LIKE 'John%'
SELECT * FROM nobel WHERE (subject= 'Physics' AND  yr= 1980 ) OR (subject= 'Chemistry'  AND yr= 1984)
SELECT * FROM nobel WHERE yr = 1980 AND  subject <>'Chemistry' AND subject <> 'Medicine'
SELECT * FROM nobel WHERE (subject = 'Medicine' AND yr<1910) OR (subject='Literature' AND yr>=2004)


SELECT name FROM world WHERE population > (SELECT population FROM world WHERE name='Russia')
SELECT name FROM world WHERE continent = 'Europe'  AND gdp/population  > (SELECT gdp/population FROM world WHERE name='United Kingdom')
SELECT name, continent FROM world WHERE continent IN(SELECT continent FROM world WHERE name='Argentina' OR name ='Australia') ORDER BY name

SELECT name, population FROM world WHERE population > 
(SELECT population FROM world WHERE name='Canada') AND 
population < (SELECT population FROM world WHERE name='Poland')

SELECT name, 
CONCAT(ROUND(
100*population/(SELECT population 
                            FROM world 
                            WHERE name='Germany'))
,'%')
 FROM world WHERE continent = 'Europe'

 SELECT name 
FROM world 
WHERE gdp> ALL(SELECT gdp 
                               FROM world 
                               WHERE continent = 'Europe' 
                               AND gdp IS NOT NULL)


SELECT continent, name, area 
FROM world x
WHERE area >= ALL(SELECT area 
                                   FROM world y
                                   WHERE y.continent=x.continent
                                   AND area>0)





SELECT SUM(population)
FROM world


SELECT DISTINCT continent
FROM world

SELECT SUM(gdp)
FROM world
WHERE continent ='Africa'

SELECT COUNT(name)
FROM world
WHERE area>1000000

SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

SELECT continent , COUNT(name)  
FROM world 
GROUP BY continent

SELECT continent ,COUNT(name) 
FROM world 
WHERE population>10000000 
GROUP BY continent


SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000








SELECT matchid,player 
FROM goal 
WHERE teamid LIKE 'GER%'

SELECT id,stadium,team1,team2
  FROM game
WHERE id = '1012'

SELECT  player, teamid, stadium, mdate
FROM game JOIN goal ON (id=matchid)
WHERE teamid  LIKE 'GER%'

SELECT  team1, team2, player 
FROM game JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%'


SELECT player, teamid,  coach, gtime
 FROM goal  JOIN eteam ON (teamid=id)
 WHERE gtime<=10

 SELECT mdate, teamname FROM game JOIN eteam ON(team1 = eteam.id)
WHERE coach LIKE '%Fernando Santos%'

SELECT player 
FROM goal JOIN game ON(goal.matchid=game.id)
WHERE stadium LIKE '%National Stadium, Warsaw%'