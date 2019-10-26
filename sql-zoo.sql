--SELECT basics

--1
SELECT population FROM world
  WHERE world.name = 'Germany'

--2
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark')

--3
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

-- SELECT from world

-- 1
SELECT name, continent, population FROM world

--2
SELECT name FROM world
WHERE population >= 200000000

--3
SELECT name, gdp/population FROM world
WHERE population >= 200000000

--4
SELECT name, population/1000000 FROM world
WHERE continent = 'South America'

--5
SELECT name, population FROM world
WHERE name IN ('France','Germany','Italy')

--6
SELECT name FROM world
WHERE name LIKE '%United%'

--7
SELECT name, population, area FROM world
WHERE population > 250000000 OR area > 3000000

--8
SELECT name, population, area FROM world
WHERE population > 250000000 XOR area > 3000000

--9
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2) FROM world
WHERE continent = 'South America'

--10
SELECT name, ROUND(gdp/population,-3) FROM world
WHERE gdp >= 1000000000000

--11
SELECT name, capital FROM world
WHERE LENGTH(name) = LENGTH(capital)

--12
SELECT name, capital FROM world
WHERE LEFT(name,1) = LEFT(capital,1) AND name <> capital

--13
SELECT name FROM world
WHERE name NOT LIKE '% %' AND name LIKE '%a%'
                          AND name LIKE '%e%'
                          AND name LIKE '%i%'
                          AND name LIKE '%o%'
                          AND name LIKE '%u%'

-- SELECT from nobel

--1
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

--2
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

--3
SELECT yr, subject
  FROM nobel
 WHERE winner = 'Albert Einstein'

--4
SELECT winner
  FROM nobel
 WHERE subject = 'Peace'
   AND yr >= 2000

--5
SELECT yr, subject, winner
  FROM nobel
 WHERE subject = 'Literature'
   AND yr >= 1980
   AND yr <= 1989

--6
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama')

--7
SELECT winner FROM nobel
 WHERE winner LIKE 'John%'

--8
SELECT * FROM nobel
 WHERE (yr=1980 AND subject='Physics') OR (yr=1984 AND subject='Chemistry')

--9
SELECT * FROM nobel
 WHERE yr = 1980 AND (subject NOT LIKE 'Chemistry' AND subject NOT LIKE 'Medicine')

 --10
 SELECT * FROM nobel
 WHERE (yr < 1910 AND subject='Medicine') OR (yr >= 2004 AND subject='Literature')


--SELECT from SELECT

--1
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

--2
SELECT name FROM world
 WHERE gdp/population >
      (SELECT gdp/population FROM world WHERE name='United Kingdom')
   AND continent = 'Europe'

--3
SELECT name, continent FROM world
 WHERE continent=
(SELECT continent FROM world WHERE name = 'Argentina')
    OR continent=
(SELECT continent FROM world WHERE name = 'Australia')
ORDER BY name

--4
SELECT name, population FROM world
 WHERE population>
(SELECT population FROM world WHERE name='Canada')
   AND population<
(SELECT population FROM world WHERE name='Poland')

--5
SELECT name, CONCAT(ROUND(population/(SELECT population FROM world WHERE name='Germany')*100),'%')

  FROM world
 WHERE continent = 'Europe'

--6
SELECT name
  FROM world
 WHERE gdp > ALL (SELECT gdp FROM world WHERE gdp>0 AND continent='Europe')

--7
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)

--8
SELECT continent,name FROM world x
 WHERE name = (SELECT name FROM world y WHERE x.continent=y.continent LIMIT 1)


--SUM and COUNT

--1
SELECT SUM(population)
FROM world

--2
SELECT DISTINCT continent
FROM world

--3
SELECT SUM(gdp)
FROM world
WHERE continent='Africa'

--4
SELECT COUNT(name)
FROM world
WHERE area>=1000000

--5
SELECT SUM(population)
FROM world
WHERE name IN('Estonia','Latvia','Lithuania')

--6
SELECT continent, COUNT(name)
FROM world
GROUP BY continent

--7
SELECT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent

--8
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000


--The JOIN operation

--1
SELECT matchid, player FROM goal
  WHERE teamid = 'GER'

--2
SELECT id,stadium,team1,team2
  FROM game
 WHERE id=1012

--3
SELECT player,teamid,stadium,mdate
  FROM game JOIN goal ON (id=goal.matchid)
  WHERE teamid='GER'

--4
SELECT team1,team2,player
  FROM game JOIN goal ON (id=goal.matchid)
 WHERE player LIKE 'Mario%'

--5
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON (teamid=id)
 WHERE gtime<=10

--6
SELECT mdate, teamname
  FROM game JOIN eteam ON (team1=eteam.id)
 WHERE coach='Fernando Santos'

--7
SELECT player
  FROM goal JOIN game ON (goal.matchid=game.id)
 WHERE stadium='National Stadium, Warsaw'


-- More JOIN operations

--1
SELECT id, title
 FROM movie
 WHERE yr=1962

--2
SELECT yr
  FROM movie
 WHERE title='Citizen Kane'

--3
SELECT id,title,yr
  FROM movie
 WHERE title LIKE ('%Star Trek%')

--4
SELECT id
  FROM actor
 WHERE name='Glenn Close'

--5
SELECT id
  FROM movie
 WHERE title='Casablanca'

--6
SELECT name
  FROM actor JOIN casting ON (actor.id=casting.actorid)
 WHERE movieid=11768

--7
SELECT name
  FROM actor JOIN casting ON (actor.id=casting.actorid) JOIN movie ON (casting.movieid=movie.id)
 WHERE title='Alien'

--8
SELECT title
  FROM movie JOIN casting ON (movie.id = casting.movieid) JOIN actor ON (casting.actorid=actor.id)
 WHERE name='Harrison Ford'

--9
SELECT title
  FROM movie JOIN casting ON (movie.id = casting.movieid) JOIN actor ON (casting.actorid=actor.id)
 WHERE name='Harrison Ford' AND ord<>1

--10
SELECT title, name
  FROM movie JOIN casting ON (movie.id=casting.movieid) JOIN actor ON (casting.actorid=actor.id)
 WHERE yr=1962 AND ord=1


--Using NULL

--1
SELECT name
  FROM teacher
 WHERE dept IS NULL

--2
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

--3
SELECT teacher.name, dept.name
 FROM teacher LEFT OUTER JOIN dept
           ON (teacher.dept=dept.id)

--4
SELECT teacher.name, dept.name
 FROM teacher RIGHT OUTER JOIN dept
           ON (teacher.dept=dept.id)

--5
SELECT name, COALESCE(mobile,'07986 444 2266') as mobile
  FROM teacher

--6
SELECT teacher.name, COALESCE(dept.name,'None') as name
  FROM teacher LEFT JOIN dept ON (teacher.dept=dept.id)

--7
SELECT COUNT(name), COUNT(mobile)
  FROM teacher

--8
SELECT dept.name, COUNT(teacher.name)
  FROM dept LEFT JOIN teacher ON (dept.id=teacher.dept)
GROUP BY dept.name

--9
SELECT name, CASE WHEN (dept = 1) OR (dept = 2)
                  THEN 'Sci'
                  ELSE 'Art'
             END
  FROM teacher

--10
SELECT name, CASE WHEN (dept = 1) OR (dept = 2)
                  THEN 'Sci'
                  WHEN (dept = 1)
                  THEN 'Art'
                  ELSE 'None'
             END
  FROM teacher


--Self JOIN

--1
SELECT COUNT(id)
  FROM stops

--2
SELECT id
  FROM stops
 WHERE name='Craiglockhart'

--3
SELECT id, name
  FROM stops JOIN route ON (stops.id=route.stop)
 WHERE route.num=4 AND route.company='LRT'

--4
SELECT company, num, COUNT(*)
  FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING (COUNT(*) = 2)

--5
SELECT a.company, a.num, a.stop, b.stop
  FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
 WHERE a.stop=53 AND b.stop=149

--6
SELECT a.company, a.num, stopa.name, stopb.name
  FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
 WHERE stopa.name='Craiglockhart' AND stopb.name='London Road'

--7
SELECT DISTINCT a.company, a.num
  FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
 WHERE a.stop=115 AND b.stop =137

--8
SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='Tollcross'

--9
SELECT stopb.name, a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
