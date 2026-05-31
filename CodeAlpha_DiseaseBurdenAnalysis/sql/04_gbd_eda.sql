USE DiseaseBurdenDB;
GO

/*
SELECT TOP 5 * FROM DBschema.GlobalBurdenOfDisease;
GO
*/

-- How many distinct countries, years, age groups, and sex categories exist?

SELECT 'Total_Distinct_Country' AS Formula, COUNT(DISTINCT COuntry_Name) AS 'Value' FROM DBschema.GlobalBurdenOfDisease
UNION ALL
SELECT 'Total_Distinct_years', COUNT(DISTINCT Year)FROM DBschema.GlobalBurdenOfDisease
UNION ALL
SELECT 'Total_Distinct_age_group', COUNT(DISTINCT Age_Group)FROM DBschema.GlobalBurdenOfDisease
UNION ALL
SELECT 'Total_Distinct_Sex_category', COUNT(DISTINCT Sex) FROM DBschema.GlobalBurdenOfDisease;
GO

-- Which columns have NULL values and how many?

SELECT
	COUNT(*) AS TotalRows,
	SUM(CASE WHEN Country_Code IS NULL OR Country_Code = '' THEN 1 ELSE 0 END) AS CountryCode_TotalNulls,
	SUM(CASE WHEN Country_Name IS NULL OR Country_Name = '' THEN 1 ELSE 0 END) AS CountryName_TotalNulls,
	SUM(CASE WHEN Year IS NULL OR Year = '' THEN 1 ELSE 0 END) AS Year_TotalNulls,
	SUM(CASE WHEN Age_Group IS NULL OR Age_Group = '' THEN 1 ELSE 0 END) AS Age_Group_TotalNulls,
	SUM(CASE WHEN Sex IS NULL OR Sex = '' THEN 1 ELSE 0 END) AS Sex_TotalNulls,
	SUM(CASE WHEN Number_of_Deaths IS NULL OR Number_of_Deaths = '' THEN 1 ELSE 0 END) AS NumberOfDeaths_TotalNulls,
	SUM(CASE WHEN Death_Rate_Per_100k IS NULL OR Death_Rate_Per_100k = '' THEN 1 ELSE 0 END) AS DeathRate_TotalNulls
FROM DBschema.GlobalBurdenOfDisease;
GO

-- Are there duplicate rows (same country + year + age group + sex)?

WITH CTE_Table1_duplicateCheck AS (
	SELECT
		Country_Name,
		ROW_NUMBER() OVER ( PARTITION BY Country_Code,
										 Year,
										 Age_Group,
										 Sex
							ORDER BY Country_Name   ) AS duplicate_check
	FROM DBschema.GlobalBurdenOfDisease
)
	SELECT
		COUNT(*) AS Table1_Total_duplicates
	FROM CTE_Table1_duplicateCheck
	WHERE duplicate_check > 1;
GO

-- What is the MIN, MAX, AVG death rate per 100,000 overall?

SELECT
	MIN(Death_Rate_Per_100k)  AS min_death_rate,
	ROUND(MAX(Death_Rate_Per_100k), 2)  AS max_death_rate,
	ROUND(AVG(Death_Rate_Per_100k), 2)  AS avg_death_rate
FROM DBschema.GlobalBurdenOfDisease;
GO

-- Which countries have the highest total death counts?

SELECT TOP 10
	Country_Name AS Country,
	ROUND(SUM(Number_of_Deaths), 2) AS highest_death_count
FROM DBschema.GlobalBurdenOfDisease
WHERE Sex = 'Both'
AND Age_Group = 'All ages'
GROUP BY Country_Name
ORDER BY highest_death_count DESC;
GO

-- How does the average death rate change across years (1970–2010)?

SELECT
	Year,
	ROUND(AVG(Death_Rate_Per_100k), 2) AS avg_death_rate
FROM DBschema.GlobalBurdenOfDisease
GROUP BY Year
ORDER BY year;
GO

-- Which age group has the highest average death rate?

SELECT TOP 1
	Age_Group,
	ROUND(AVG(Death_Rate_Per_100k), 2) AS highest_average_death_rate
FROM DBschema.GlobalBurdenOfDisease
GROUP BY Age_Group
ORDER BY highest_average_death_rate DESC;
GO

-- Is there a consistent gender gap in death rates across age groups?

SELECT
	Sex AS Gender,
	Age_Group,
	ROUND(AVG(Death_Rate_Per_100k), 2) AS avg_death_rate
FROM DBschema.GlobalBurdenOfDisease
WHERE Sex IN ('Male', 'Female')
	AND Age_Group != 'All ages'
GROUP BY 
	Sex,
	Age_Group
ORDER BY Age_Group, Sex;
GO