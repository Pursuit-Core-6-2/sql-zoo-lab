-- SELECT basics

-- 1.
SELECT population 
FROM world
WHERE name = 'Germany'

-- 2
SELECT name, population 
FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark')

-- 3
SELECT name, area 
FROM world
WHERE area BETWEEN 200000 AND 250000

-- SELECT Quiz
-- 1
SELECT name, population
FROM world
WHERE population BETWEEN 1000000 AND 1250000

-- 2
SELECT name, population
FROM world
WHERE name LIKE "Al%"

-- 3
SELECT name 
FROM world
WHERE name LIKE '%a' OR name LIKE '%l'

-- 4
SELECT name,length(name)
FROM world
WHERE length(name)=5 and region='Europe'

-- 5
SELECT name, area*2 
FROM world 
WHERE population = 64000

-- 6
SELECT name, area, population
FROM world
WHERE area > 50000 AND population < 10000000

-- 7
SELECT name, population/area
FROM world
WHERE name IN ('China', 'Nigeria', 'France', 'Australia')


-- /////////////////////////////////////////////////////////

-- SELECT from WORLD Tutorial

-- 1
SELECT name, continent, population 
FROM world

-- 2
SELECT name 
FROM world
WHERE population >= 200000000

-- 3
SELECT name, gdp/population
FROM world
WHERE population >= 200000000

-- 4
SELECT name, population/1000000
FROM world
WHERE continent IN 'South America'

-- 5
SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy')

-- 6
SELECT name
FROM world
WHERE name LIKE '%United%'

-- 7
SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000

-- 8
SELECT name, population, area
FROM world
WHERE area > 3000000 XOR population > 250000000

-- 9
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2)
FROM world
WHERE continent = 'South America'

-- 10
SELECT name, ROUND((gdp/population), -3)
FROM world
WHERE gdp > 1000000000000

-- 11
SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital)

-- 12
SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1) AND name <> capital

-- 13
SELECT name
FROM world
WHERE name LIKE '%a%' 
    AND name LIKE '%e%' 
    AND name LIKE '%i%'
    AND name LIKE '%o%'
    AND name LIKE '%u%'
    AND name NOT LIKE '% %'


-- BBC QUIZ
-- 1   Select the code which gives the name of countries beginning with U
SELECT name
FROM world
WHERE name LIKE 'U%'

-- 2   Select the code which shows just the population of United Kingdom?
SELECT population
FROM world
WHERE name = 'United Kingdom'

-- 3
SELECT continent 
FROM world 
WHERE name = 'France' --'name' should be name

-- 4
SELECT name, population / 10 
FROM world 
WHERE population < 10000
-- Nauru	990

-- 5   Select the code which would reveal the name and population of countries in Europe and Asia
SELECT name, population
FROM world
WHERE continent IN ('Europe', 'Asia')

-- 6   Select the code which would give two rows
SELECT name 
FROM world
WHERE name IN ('Cuba', 'Togo')

-- 7
SELECT name FROM world
WHERE continent = 'South America'
AND population > 40000000
-- Brazil
-- Colombia


-- ///////////////////////////////////////////////////////////////
-- SELECT from Nobel Tutorial

-- 1
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950

-- 2
SELECT winner
FROM nobel
WHERE yr = 1962 AND subject = 'literature'

-- 3
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein'

-- 4
SELECT winner
FROM nobel
WHERE subject = 'Peace' AND yr BETWEEN '2000' and '2019'

-- 5
SELECT *
FROM nobel
WHERE subject = 'Literature' AND yr BETWEEN '1980' and '1989'

-- 6
SELECT * 
FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')

-- 7
SELECT winner
FROM nobel
WHERE winner LIKE 'john%'

-- 8
SELECT *
FROM nobel
WHERE (subject = 'Physics' AND yr = '1980') OR (subject = 'Chemistry' AND yr = '1984')

-- 9
SELECT *
FROM nobel
WHERE yr = '1980' AND subject NOT IN ('Chemistry', 'Medicine')

-- 10
SELECT *
FROM nobel
WHERE subject = 'medicine' AND yr < '1910' OR subject = 'literature' AND yr >= '2004'

-- 11
SELECT *
FROM nobel
WHERE winner = 'PETER GRÜNBERG'

-- 12
SELECT *
FROM nobel
WHERE winner = 'EUGENE O''NEILL'

-- 13
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC

-- 14
SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY subject IN ('Physics','Chemistry'), subject,winner


-- Nobel Quiz
-- 1. Pick the code which shows the name of winner's names beginning with C and ending in n
SELECT winner 
FROM nobel
WHERE winner LIKE 'C%' AND winner LIKE '%n'

-- 2. Select the code that shows how many Chemistry awards were given between 1950 and 1960
SELECT COUNT(subject) 
FROM nobel
WHERE subject = 'Chemistry' AND yr BETWEEN 1950 and 1960

-- 3. Pick the code that shows the amount of years where no Medicine awards were given
SELECT COUNT(DISTINCT yr) 
FROM nobel
WHERE yr NOT IN (
    SELECT DISTINCT yr 
    FROM nobel 
    WHERE subject = 'Medicine'
)

-- 4
SELECT subject, winner 
FROM nobel 
WHERE winner LIKE 'Sir%' AND yr LIKE '196%'

-- 5 Select the code which would show the year when neither a Physics or Chemistry award was given
SELECT yr 
FROM nobel
WHERE yr NOT IN (
    SELECT yr 
    FROM nobel
    WHERE subject IN ('Chemistry','Physics')
)

-- 6 Select the code which shows the years when a Medicine award was given but no Peace or Literature award was
SELECT DISTINCT yr
  FROM nobel
 WHERE subject='Medicine' 
   AND yr NOT IN(SELECT yr FROM nobel 
                  WHERE subject='Literature')
   AND yr NOT IN (SELECT yr FROM nobel
                   WHERE subject='Peace')

-- 7 
SELECT subject, COUNT(subject) 
FROM nobel 
WHERE yr ='1960' 
GROUP BY subject

-- ///////////////////////////////////////////////////////////////
-- SELECT within SELECT Tutorial

-- 1
SELECT name 
FROM world
WHERE population > (
    SELECT population 
    FROM world 
    WHERE name='russia'
)

-- 2
SELECT name
FROM world
WHERE continent = 'europe' AND gdp/population > (
    SELECT gdp/population
    FROM world
    WHERE name = 'united kingdom'
)

-- 3
SELECT name, continent
FROM world
WHERE continent IN (
    SELECT continent
    FROM world
    WHERE name IN ('Argentina', 'Australia')
)
ORDER BY name

-- 4
SELECT name, population
FROM world
WHERE population > (SELECT population FROM world WHERE name = 'canada') 
    AND population < (SELECT population FROM world WHERE name = 'poland')

-- 5
SELECT name, CONCAT(ROUND(population*100/(
    SELECT population 
    FROM world 
    WHERE name = 'germany')
    ) , '%')
FROM world
WHERE continent = 'europe'

-- 6
SELECT name
FROM world
WHERE gdp > ALL(
    SELECT gdp
    FROM world
    WHERE continent = 'europe' AND gdp <> 'null'
)

-- 7 (NEED TO REVIEW THAT)
SELECT continent, name, area 
FROM world x
WHERE area >= ALL (
    SELECT area 
    FROM world y
    WHERE y.continent = x.continent
)

-- 8 (NEED TO REVIEW THAT)
SELECT continent, name
FROM world x
WHERE name <= ALL (
    SELECT name
    FROM world y
    WHERE y.continent=x.continent
)


-- Nested SELECT Quiz
--1 Select the code that shows the name, region and population of the smallest country in each region
SELECT region, name, population 
FROM bbc x 
WHERE population <= ALL (
    SELECT population 
    FROM bbc y 
    WHERE y.region = x.region AND population > 0
)

--2 Select the code that shows the countries belonging to regions with all populations over 50000
SELECT name,region,population 
FROM bbc x 
WHERE 50000 < ALL (
    SELECT population 
    FROM bbc y 
    WHERE x.region = y.region AND y.population > 0
)

--3 Select the code that shows the countries with a less than a third of the population of the countries around it
SELECT name, region 
FROM bbc x
WHERE population < ALL (
    SELECT population/3 
    FROM bbc y 
    WHERE y.region = x.region AND y.name != x.name
)

-- 4
SELECT name FROM bbc
 WHERE population >
       (SELECT population
          FROM bbc
         WHERE name='United Kingdom')
   AND region IN
       (SELECT region
          FROM bbc
         WHERE name = 'United Kingdom');
--France
--Germany
--Russia
--Turkey

--5 Select the code that would show the countries with a greater GDP than any country in Africa 
-- (some countries may have NULL gdp values).
SELECT name 
FROM bbc
WHERE gdp > (
    SELECT MAX(gdp) 
    FROM bbc 
    WHERE region = 'Africa'
);

--6 Select the code that shows the countries with population smaller than Russia but bigger than Denmark
SELECT name 
FROM bbc
WHERE population < (
    SELECT population 
    FROM bbc 
    WHERE name='Russia'
) AND population > (
    SELECT population 
    FROM bbc 
    WHERE name='Denmark'
);

--7 
SELECT name 
FROM bbc
WHERE population > ALL (
    SELECT MAX(population)
    FROM bbc
    WHERE region = 'Europe'
) AND region = 'South Asia';
--Bangladesh
--India
--Pakistan


--////////////////////////////////////////////////////////////////
-- SUM and COUNT
--1
SELECT SUM(population) All_population
FROM world;

--2
SELECT DISTINCT continent
FROM world;

--3
SELECT SUM(gdp) AfricaGDP
FROM world
WHERE continent = 'africa';

--4
SELECT COUNT(name) TotalCountires
FROM world
WHERE area >= 1000000;

--5
SELECT SUM(population) TotalPopulation
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

--6
SELECT continent, COUNT(name) TotalCountries
FROM world
GROUP BY continent;

--7
SELECT continent, COUNT(name) TotalCountries
FROM world
WHERE population >= 10000000
GROUP BY continent;

--8
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) > 100000000;

-- QUIZ
--1 Select the statement that shows the sum of population of all countries in 'Europe'
SELECT SUM(population) 
FROM bbc 
WHERE region = 'Europe';

--2 Select the statement that shows the number of countries with population smaller than 150000
SELECT COUNT(name) 
FROM bbc 
WHERE population < 150000;

--3 Select the list of core SQL aggregate functions 
-- AVG(), COUNT(), MAX(), MIN(), SUM()

--4
SELECT region, SUM(area)
FROM bbc 
WHERE SUM(area) > 15000000 
GROUP BY region;
-- No result due to invalid use of the WHERE function

--5 Select the statement that shows the average population of 'Poland', 'Germany' and 'Denmark'
SELECT AVG(population) 
FROM bbc 
WHERE name IN ('Poland', 'Germany', 'Denmark');

--6 Select the statement that shows the medium population density of each region
SELECT region, SUM(population)/SUM(area) AS density 
FROM bbc 
GROUP BY region;

--7  Select the statement that shows the name and population density of the country with the largest population
SELECT name, population/area AS density 
FROM bbc 
WHERE population = (SELECT MAX(population) FROM bbc);

--8 
SELECT region, SUM(area) 
FROM bbc 
GROUP BY region 
HAVING SUM(area)<= 20000000;
-- Table-D
-- Americas	732240
-- Middle East	13403102
-- South America	17740392
-- South Asia	9437710


-- ///////////////////////////////////////////////////////////////
-- The JOIN operation
--1
SELECT matchid, player 
FROM goal 
WHERE teamid = (
    SELECT id
    FROM eteam
    WHERE teamname = 'germany'
);

--2
SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012;

--3
SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (game.id = goal.matchid)
WHERE goal.teamid = (
    SELECT id
    FROM eteam
    WHERE teamname = 'germany'
);

-- 4
SELECT team1, team2, player
FROM game JOIN goal ON (game.id = goal.matchid)
WHERE player LIKE 'Mario%';

--5
SELECT player, teamid, coach, gtime
FROM goal JOIN eteam ON (goal.teamid = eteam.id)
WHERE gtime<=10

--6
SELECT mdate, teamname
FROM game JOIN eteam ON (game.team1 = eteam.id)
WHERE coach = 'Fernando Santos';

--7
SELECT player
FROM game JOIN goal ON (game.id = goal.matchid)
WHERE stadium = 'National Stadium, Warsaw';

-- QUIZ
--1 You want to find the stadium where player 'Dimitris Salpingidis' scored. Select the JOIN condition to use:
game  JOIN goal ON (id=matchid);

--2 You JOIN the tables goal and eteam in an SQL statement. Indicate the list of column names that may be used in the SELECT line:
--matchid, teamid, player, gtime, id, teamname, coach

--3 Select the code which shows players, their team and the amount of goals they scored against Greece(GRE).
SELECT player, teamid, COUNT(*)
FROM game JOIN goal ON matchid = id
WHERE (team1 = "GRE" OR team2 = "GRE") AND teamid != 'GRE'
GROUP BY player, teamid;

--4 
SELECT DISTINCT teamid, mdate
FROM goal JOIN game on (matchid=id)
WHERE mdate = '9 June 2012';
--DEN	9 June 2012
--GER	9 June 2012

--5 Select the code which would show the player and their team for those who have scored against Poland(POL) in National Stadium, Warsaw.
SELECT DISTINCT player, teamid 
FROM game JOIN goal ON matchid = id 
WHERE stadium = 'National Stadium, Warsaw' 
    AND (team1 = 'POL' OR team2 = 'POL')
    AND teamid != 'POL';

--6 Select the code which shows the player, their team and the time they scored, 
--for players who have played in Stadion Miejski (Wroclaw) but not against Italy(ITA).
SELECT DISTINCT player, teamid, gtime
FROM game JOIN goal ON matchid = id
WHERE stadium = 'Stadion Miejski (Wroclaw)'
    AND (( teamid = team2 AND team1 != 'ITA') 
    OR ( teamid = team1 AND team2 != 'ITA'));

-- 7
SELECT teamname, COUNT(*)
FROM eteam JOIN goal ON teamid = id
GROUP BY teamname
HAVING COUNT(*) < 3;
-- Netherlands	2
-- Poland	2
-- Republic of Ireland	1
-- Ukraine	2


-- ///////////////////////////////////////////////////////////////
-- More JOIN operations
--1
SELECT id, title
FROM movie
WHERE yr=1962;

--2
SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

--3
SELECT id, title, yr
FROM movie
WHERE title LIKE '%star trek%'
ORDER BY yr;

--4
SELECT id
FROM actor
WHERE name = 'glenn close';

--5
SELECT id
FROM movie
WHERE title = 'casablanca';

--6
SELECT name
FROM actor 
WHERE id IN (
    SELECT actorid
    FROM casting
    WHERE movieid = (
        SELECT id
        FROM movie
        WHERE title = 'casablanca'
    )
);
--6
SELECT name
FROM actor JOIN casting ON (actor.id = casting.actorid)
    JOIN movie ON (casting.movieid = movie.id)
WHERE movie.title = 'casablanca';

--7
SELECT name
FROM actor JOIN casting ON (actor.id = casting.actorid)
    JOIN movie ON (casting.movieid = movie.id)
WHERE movie.title = 'alien';

--8
SELECT title
FROM movie JOIN casting ON (movie.id = casting.movieid)
    JOIN actor ON (casting.actorid = actor.id)
WHERE actor.name = 'harrison ford';

--9
SELECT title
FROM movie JOIN casting ON (movie.id = casting.movieid)
    JOIN actor ON (casting.actorid = actor.id)
WHERE actor.name = 'harrison ford' AND casting.ord != 1;

--10
SELECT title, name
FROM movie JOIN casting ON (movie.id = casting.movieid)
    JOIN actor ON (casting.actorid = actor.id)
WHERE yr=1962 AND ord = 1;

-- QUIZ
--1 Select the statement which lists the unfortunate directors of the movies which have caused financial loses (gross < budget)
SELECT name
FROM actor INNER JOIN movie ON actor.id = director
WHERE gross < budget

--2. Select the correct example of JOINing three tables
SELECT *
  FROM actor JOIN casting ON actor.id = actorid
  JOIN movie ON movie.id = movieid;

--3 Select the statement that shows the list of actors called 'John' by order of number of movies in which they acted
SELECT name, COUNT(movieid)
  FROM casting JOIN actor ON actorid=actor.id
 WHERE name LIKE 'John %'
 GROUP BY name ORDER BY 2 DESC;

--4
SELECT title 
   FROM movie JOIN casting ON (movieid=movie.id)
              JOIN actor   ON (actorid=actor.id)
  WHERE name='Paul Hogan' AND ord = 1;
--Table-B
--"Crocodile" Dundee
--Crocodile Dundee in Los Angeles
--Flipper
--Lightning Jack

--5. Select the statement that lists all the actors that starred in movies directed by Ridley Scott who has id 351
SELECT name
FROM movie JOIN casting ON movie.id = actorid
    JOIN actor ON actor.id = movieid
WHERE ord = 1 AND director = 351

--6. There are two sensible ways to connect movie and actor. They are:
--link the director column in movies with the primary key in actor
--connect the primary keys of movie and actor via the casting table


--7
 SELECT title, yr 
   FROM movie, casting, actor 
  WHERE name='Robert De Niro' AND movieid=movie.id AND actorid=actor.id AND ord = 3;
--Table-B
--A Bronx Tale	1993
--Bang the Drum Slowly	1973
--Limitless	2011


--////////////////////////////////////////////////////////////////
-- Using Null
--1
SELECt name
FROM teacher
WHERE dept IS NULL;

--2
SELECT teacher.name, dept.name
FROM teacher JOIN dept -- JOIN === INNER JOIN
ON (teacher.dept=dept.id);

--3
SELECT teacher.name, dept.name
FROM teacher LEFT JOIN dept
ON (teacher.dept=dept.id);

--4
SELECT teacher.name, dept.name
FROM teacher RIGHT JOIN dept
ON (teacher.dept=dept.id);

--5
SELECT name, COALESCE(mobile, '07986 444 2266') AS Mobile
FROM teacher;

--6
SELECT teacher.name, COALESCE(dept.name, 'None') AS departement
FROM teacher LEFT JOIN dept ON (teacher.dept = dept.id);

--7
SELECT COUNT(name) AS Teachers, COUNT(mobile) AS Mobiles
FROM teacher;

--8
SELECT dept.name, COUNT(teacher.name) AS Staff
FROM teacher RIGHT JOIN dept ON (dept.id = teacher.dept)
GROUP BY dept.name;

--9
SELECT name, CASE 
        WHEN dept IN ('1', '2') THEN 'Sci' 
        ELSE 'Art' 
    END AS Field
FROM teacher;

--10
SELECT name, CASE 
        WHEN dept IN ('1', '2') THEN 'Sci' 
        WHEN dept = '3' THEN 'Art'
        ELSE 'None' 
    END AS Field
FROM teacher;

-- Using Null Quiz
--1. Select the code which uses an outer join correctly.
SELECT teacher.name, dept.name 
FROM teacher LEFT OUTER JOIN dept ON (teacher.dept = dept.id);

--2. Select the correct statement that shows the name of department which employs Cutflower 
SELECT dept.name 
FROM teacher JOIN dept ON (dept.id = teacher.dept) 
WHERE teacher.name = 'Cutflower';

--3. Select out of following the code which uses a JOIN to show a list of all the departments and number of employed teachers
SELECT dept.name, COUNT(teacher.name) 
FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept 
GROUP BY dept.name;

--4. Using SELECT name, dept, COALESCE(dept, 0) AS result FROM teacher on teacher table will:
-- display 0 in result column for all teachers without department

--5
SELECT name,
    CASE WHEN phone = 2752 THEN 'two'
        WHEN phone = 2753 THEN 'three'
        WHEN phone = 2754 THEN 'four'
    END AS digit
FROM teacher
-- 'four' for Throd

--6
SELECT name, 
    CASE WHEN dept IN (1) THEN 'Computing' 
        ELSE 'Other' 
    END 
FROM teacher;



--////////////////////////////////////////////////////////////////
--Self join
--1
SELECT COUNT (name) AS Total_Stops
FROM stops;

--2
SELECT id
FROM stops
WHERE name = 'Craiglockhart';

--3
SELECT id, name
FROM stops JOIN route ON stop = id
WHERE num = '4' AND company = 'LRT';

--4
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2;

--5
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
WHERE a.stop = 53 AND b.stop = 149;

--6
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON (a.company = b.company AND a.num = b.num)
  JOIN stops stopa ON (a.stop = stopa.id)
  JOIN stops stopb ON (b.stop = stopb.id)
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'London Road';

--7