use world;

##Question 1 : Count how many cities are there in each country?
select country.Country_Name as Country,
count(city.ID) as Number_of_Cities
from
country
join city on country.Country_code= city.CountryCode
group by country.Country_Name
order by Number_of_Cities desc;

##Question 2 : Display all continents having more than 30 countries
SELECT 
    Continent,
    COUNT(Country_code) AS Number_of_Countries
FROM 
    country
GROUP BY 
    Continent
HAVING 
    COUNT(Country_code) > 30;
    
##Question 3 : List regions whose total population exceeds 200 million.
   SELECT 
    Region,
    SUM(Country_Pop) AS Total_Population
FROM 
    country
GROUP BY 
    Region
HAVING 
    SUM(Country_Pop) > 200000000;
    
    ##Question 4 : Find the top 5 continents by average GNP per country
    SELECT 
    Continent,
    AVG(GNP) AS Average_GNP
FROM 
    country
GROUP BY 
    Continent
ORDER BY 
    Average_GNP DESC
LIMIT 5;

##Question 5 : Find the total number of official languages spoken in each continent.
SELECT 
    c.Continent,
    COUNT(cl.Language) AS Total_Official_Languages
FROM 
    country c
JOIN 
    countrylanguage cl ON c.Country_code = cl.CountryCode
WHERE 
    cl.IsOfficial = 'T'
GROUP BY 
    c.Continent
ORDER BY 
    Total_Official_Languages DESC;
    
##Question 6 : Find the maximum and minimum GNP for each continent.
SELECT 
    Continent,
    MAX(GNP) AS Max_GNP,
    MIN(GNP) AS Min_GNP
FROM 
    country
    WHERE GNP >0
GROUP BY 
    Continent
ORDER BY 
    Continent;

 ##Question 7 : Find the country with the highest average city population.
 SELECT 
    c.Country_Name,
    AVG(ci.City_Pop) AS Avg_City_Population
FROM 
    country c
JOIN 
    city ci ON c.Country_code = ci.CountryCode
GROUP BY 
    c.Country_Name
ORDER BY 
    Avg_City_Population DESC
LIMIT 1;

##Question 8 : List continents where the average city population is greater than 200,000.
SELECT 
    c.Continent,
    AVG(ci.City_Pop) AS Avg_City_Population
FROM 
    country c
JOIN 
    city ci ON c.Country_code = ci.CountryCode
GROUP BY 
    c.Continent
HAVING 
    AVG(ci.City_Pop) > 200000
ORDER BY 
    Avg_City_Population DESC;
    
    ##Question 9 : Find the total population and average life expectancy for each continent, ordered by average life expectancy descending.
    select Continent,
    sum(Country_Pop) as Total_Pop,
    avg(LifeExpectancy) as Avg_LE
    from country
    group by Continent
    order by Avg_LE desc;
    
##Question 10 : Find the top 3 continents with the highest average life expectancy, but only include those where the total population is over 200 million.
select Continent,
    sum(Country_Pop) as Total_Pop,
    avg(LifeExpectancy) as Avg_LE
    from country
    group by Continent
    having Total_Pop >200000000
    order by Avg_LE desc
    limit 3;


