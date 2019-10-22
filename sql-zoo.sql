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

--7
SELECT continent, name, area 
FROM world x
WHERE area >= ALL (
    SELECT area 
    FROM world y
    WHERE y.continent = x.continent
)
