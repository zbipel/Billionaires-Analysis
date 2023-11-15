

-- Finding evental duplicates



WITH duplicates_cte AS(

SELECT 
	personName,
	finalWorth,
	age,
	industry,
	gender,
	ROW_NUMBER() OVER(PARTITION BY personName, finalWorth, age, industry, gender ORDER BY personName) AS rows
FROM Billionaires_Stats
)

SELECT *
FROM duplicates_cte
WHERE rows > 1;




-- Finding missing values in main characteristics and calculating the percentage of missing / uncomplete rows



WITH missing_cte AS (
SELECT COUNT(*) AS missing_values
FROM Billionaires_Stats bs
WHERE bs.personName IS NULL 
	  OR bs.age IS NULL
	  OR bs.finalWorth IS NULL
),

total_cte AS (
SELECT COUNT(*) AS total_values
FROM Billionaires_Stats
)

SELECT CAST(100.0 * missing_values / total_values AS DECIMAL(5, 2)) AS missing_values_perc 
FROM missing_cte, total_cte;




-- Basic data understanding



SELECT 
	COUNT(id) as total_billionaires,
	ROUND(AVG(finalWorth),0) AS avg_net_worth_millions,
	MAX(finalWorth) AS max_net_worth_millions,
	MIN(finalWorth) AS min_net_worth_millions,
	ROUND(AVG(age),0) AS avg_billionaires_age,
	MAX(age) AS max_age,
	MIN(age) AS min_age
FROM Billionaires_Stats;




-- Number of unique industries



SELECT COUNT(DISTINCT industry) AS industries_count
FROM Billionaires_Stats;




-- Number of unique countries



SELECT COUNT(country_id) as total_countries
FROM Countries;




-- Number of billionaires by country



SELECT TOP (10)
	c.country,
	COUNT(*) AS total_billionaires
FROM Billionaires_Stats b
	JOIN Countries c 
	ON c.country_id = b.country_id
GROUP BY c.country
ORDER BY total_billionaires DESC;




-- Number of billionaires per 1 mil residents by country


WITH total_cte AS(
SELECT
	c.country,
	c.population_country,
	COUNT(*) AS total_billionaires
FROM Billionaires_Stats b
	JOIN Countries c 
	ON c.country_id = b.country_id
GROUP BY 
	c.country,
	c.population_country
)

SELECT TOP(10)
	country,
	ROUND((total_billionaires * 1000000 / population_country), 2) 
	AS billionaires_per_1mil_residents
FROM total_cte
ORDER BY billionaires_per_1mil_residents DESC;




-- Number of billionaires by industry



SELECT 
	industry,
	COUNT(*) as total_billionaires
FROM Billionaires_Stats
GROUP BY industry
ORDER BY total_billionaires DESC;




-- Number of billionaires by top 15 main sources of wealth



SELECT TOP(15)
	source,
	COUNT(*) as total_billionaires
FROM Billionaires_Stats
GROUP BY source
ORDER BY total_billionaires DESC;




-- Number of billionaires and average net worth by gender



SELECT 
	gender,
	COUNT(*) AS total_billionaires,
	ROUND(AVG(finalWorth), 0) AS avg_net_worth_millions
FROM Billionaires_Stats
GROUP BY gender
ORDER BY total_billionaires DESC;




-- Countries tax rates vs number of billionaires



SELECT TOP(15)
	c.country, 
	CAST(c.total_tax_rate_country AS DECIMAL(4, 1)) AS total_tax_rate_country, 
	COUNT(id) as total_billionaires
FROM Billionaires_Stats b
JOIN Countries c ON B.country_id = C.country_id
WHERE c.total_tax_rate_country IS NOT NULL
GROUP BY 
	C.country, 
	C.total_tax_rate_country
ORDER BY 
	total_billionaires DESC, 
	total_tax_rate_country  DESC;




-- Number of billionaires and average net worth by age groups



SELECT 
	CONCAT(age - CAST(age AS INT) % 10, 's')AS age_group,
	ROUND(AVG(finalWorth), 0) as avg_net_worth_millions,
	COUNT(id) AS total_billionaires
FROM Billionaires_Stats
WHERE age IS NOT NULL
GROUP BY age - CAST(age AS INT) % 10
ORDER BY 
	total_billionaires DESC,
	avg_net_worth_millions DESC;




-- Percentage of self-made billionaires



WITH self_made_cte AS(
SELECT COUNT(*) AS self_made_billionaires
FROM Billionaires_Stats
WHERE selfMade = 1
),
total AS(
SELECT COUNT(*) AS total_billionaires
FROM Billionaires_Stats
)

SELECT
	CONCAT(CAST(100.0 * self_made_billionaires / total_billionaires AS DECIMAL (5, 2)), ' %') AS self_made_perc
FROM 
	self_made_cte, 
	total;




