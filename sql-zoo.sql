-- This is a comment in sql code

-- 0 SELECT BASICS

-- 1.) Introducing the world table of countries
    SELECT population FROM world
    WHERE name = 'Germany'

-- 2.) Scandinavia
    SELECT name, population FROM world
    WHERE name IN ('Sweden','Norway','Denmark');

-- 3.) Just the right size
    SELECT name, area FROM world
    WHERE area BETWEEN 200000 AND 250000



-- 1 SELECT FROM WORLD

-- 1.) Introduction
    SELECT name, continent, population FROM world

-- 2.) Large Countries
    SELECT name FROM world
    WHERE population > 200000000

--3.) Per capita GDP
    SELECT name, gdp/population 
    FROM world 
    WHERE population > 200000000

--4.) South America In millions
    SELECT name,population/1000000
    FROM world
    WHERE continent = 'South America'

--5.) France, Germany, Italy
    SELECT name, population
    from world
    WHERE name = 'France'
    OR name = 'Germany'
    OR name = 'Italy'

--6.) United
    SELECT name
    FROM world
    WHERE name LIKE '%United%' 

--7.) Two ways to be big
    SELECT name,population,area
    FROM world
    WHERE area > 3000000
    OR population > 250000000

--8.) One or the other (but not both)
    SELECT name,population,area
    FROM world
    WHERE area > 3000000
    XOR population > 250000000

--9.) Rounding
    SELECT name,ROUND(population/1000000, 2),ROUND(gdp/1000000000, 2)
    FROM world
    WHERE continent = 'South America'

--10.) Trillion dollar economies
    SELECT name,ROUND(gdp/population, -3)
    FROM world
    WHERE gdp > 1000000000000

--11.) Name and capital have the same length
    SELECT name,capital
    FROM world
    WHERE LENGTH(name) = LENGTH(capital)

--12.) Matching name and capital
    SELECT name, capital
    FROM world
    WHERE LEFT(name,1) = LEFT(capital,1)
    XOR name = capital

--13.) All the vowels
    SELECT name
    FROM world
    WHERE name NOT LIKE '% %'
    AND name LIKE '%a%'
    AND name LIKE '%e%'
    AND name LIKE '%i%'
    AND name LIKE '%o%'
    AND name LIKE '%u%'


-- 3 SELECT FROM NOBEL

-- 1.) Winners from 1950
    SELECT yr, subject, winner
    FROM nobel
    WHERE yr = 1950

-- 2.) 1962 Literature
    SELECT winner
    FROM nobel
    WHERE yr = 1962
    AND subject = 'Literature'

-- 3.) Albert Einstein
    SELECT yr, subject
    FROM nobel
    WHERE winner= 'Albert Einstein'

-- 4.) Recent Peace Prizes
    SELECT winner
    FROM nobel
    WHERE yr > 1999
    AND subject = 'PEACE'

-- 5.) Literature in the 1980's
    SELECT yr, subject, winner
    FROM nobel
    WHERE subject = 'Literature'
    AND yr > 1979
    AND yr < 1990

-- 6.) Only Presidents
    SELECT * 
    FROM nobel
    WHERE winner = 'Theodore Roosevelt'
    OR winner = 'Woodrow Wilson'
    OR winner = 'Jimmy Carter'
    OR winner = 'Barack Obama'

-- 7.) John
    SELECT winner
    FROM nobel
    WHERE winner LIKE 'John%'

-- 8.) Chemistry and Physics from different years
    SELECT yr, subject, winner
    FROM nobel 
    WHERE subject ='Physics'
    AND yr ='1980'
    UNION
    SELECT yr,subject,winner
    FROM nobel
    WHERE subject = 'Chemistry'
    AND yr ='1984'

-- 9.) Exclude Chemists and Medics
    SELECT yr, subject, winner
    FROM nobel
    WHERE yr = '1980'
    AND subject <> 'Chemistry'
    AND subject <> 'Medicine'

-- 10.) Early Medicine, Late Literature
    SELECT yr, subject, winner
    FROM nobel
    WHERE subject = 'Medicine'
    AND yr < 1910
    UNION
    SELECT yr, subject, winner
    FROM nobel
    WHERE subject = 'Literature'
    AND yr > 2003

-- 3 SELECT IN SELECT

-- 1.) Bigger than Russia
    SELECT name FROM world
    WHERE population >
        (SELECT population FROM world
        WHERE name='Russia')

-- 2.) Richer than UK
    SELECT name
    FROM world 
    WHERE continent = 'Europe'
    AND gdp/population > 38555.0739

-- 3.) Neighbours of Argentina and Australia
    SELECT name, continent
    FROM world
    WHERE continent IN (SELECT continent FROM world WHERE name = 'Australia' OR name = 'Argentina')
    ORDER BY name ASC

-- 4.) Between Canada and Poland
    SELECT name,population
    FROM world
    WHERE population > (SELECT population FROM world WHERE name = 'Canada')
    AND population < (SELECT population FROM world WHERE name = 'Poland')

-- 5.) Percentages of Germany
    SELECT name, 
                CONCAT(ROUND(100 * population/(SELECT  population
                                                        FROM world 
                                                        WHERE name ='Germany')), '%')
    FROM world
    WHERE continent = 'Europe'

-- 6.)