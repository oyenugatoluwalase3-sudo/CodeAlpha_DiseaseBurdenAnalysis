USE DiseaseBurdenDB;
GO

/*
SELECT TOP 5 * FROM DBschema.TBBurdenByCountry;
GO

SELECT 
    ORDINAL_POSITION AS Column_ID,
    COLUMN_NAME AS Column_Name,
	DATA_TYPE AS Data_type
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'DBschema'
  AND TABLE_NAME = 'TBBurdenByCountry'
ORDER BY ORDINAL_POSITION;
GO
*/

-- How many distinct countries and years are covered?

SELECT 'Total_distinct_countries' AS Formula, COUNT(DISTINCT Country) AS Value FROM DBschema.TBBurdenByCountry
UNION ALL
SELECT 'Total_distinct_years', COUNT(DISTINCT Year) FROM DBschema.TBBurdenByCountry;
GO

-- Which columns have the most NULLs — and are they the confidence interval columns?

DECLARE @SQL NVARCHAR(MAX) = '';

-- Dynamically build the UNION ALL query for all 47 columns
SELECT @SQL = @SQL + 
    'SELECT ''' + COLUMN_NAME + ''' AS [Column_Name], ' +
    'SUM(CASE WHEN [' + COLUMN_NAME + '] IS NULL ' +
    CASE 
        -- If it's a text column, also check for empty string literals
        WHEN DATA_TYPE IN ('varchar', 'nvarchar', 'char') THEN 'OR [' + COLUMN_NAME + '] = '''' ' 
        ELSE '' 
    END + 'THEN 1 ELSE 0 END) AS [Total_Nulls] ' +
    'FROM DBschema.TBBurdenByCountry UNION ALL '
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'DBschema' 
  AND TABLE_NAME = 'TBBurdenByCountry';

-- Strip out the very last trailing 'UNION ALL '
SET @SQL = SUBSTRING(@SQL, 1, LEN(@SQL) - 10);

-- Wrap the entire generated query in an outer block to handle your sorting requirement
SET @SQL = 'SELECT * FROM (' + @SQL + ') AS MissingDataSummary ORDER BY Total_Nulls DESC;';

-- Execute the final compiled query
EXEC sp_executesql @SQL;
GO

-- Which WHO regions have the highest average TB incidence per 100,000?

SELECT TOP 1
	Region,
	ROUND(AVG(Estimated_incidence_all_forms_per_100k), 2) AS highest_avg_TB_incidence
FROM DBschema.TBBurdenByCountry
GROUP BY Region
ORDER BY highest_avg_TB_incidence DESC;
GO

-- How has average TB incidence trended year by year (1990–2013)?

SELECT
	Year,
	ROUND(AVG(Estimated_incidence_all_forms_per_100k), 2) AS highest_avg_TB_incidence
FROM DBschema.TBBurdenByCountry
GROUP BY Year
ORDER BY Year;
GO

-- Which countries have the lowest case detection rates?

SELECT TOP 1
	Country,
	ROUND(AVG(Case_detection_rate_all_forms_percent), 2) AS lowest_avg_case_detection_rates
FROM DBschema.TBBurdenByCountry
GROUP BY Country
ORDER BY lowest_avg_case_detection_rates;
GO

-- What is the average HIV-positive share of TB deaths by region?

SELECT
	Region,
	ROUND(
		SUM(Estimated_number_of_deaths_from_TB_in_people_who_are_HIV_positive) /
		NULLIF(SUM(Estimated_number_of_deaths_from_TB_all_forms_excluding_HIV + Estimated_number_of_deaths_from_TB_in_people_who_are_HIV_positive), 0) * 100
		, 2)  AS avg_TB_in_HIV_deaths_percent
FROM DBschema.TBBurdenByCountry
GROUP BY Region
ORDER BY avg_TB_in_HIV_deaths_percent;
GO

-- Is there a pattern between low case detection rate and high TB incidence?

/*
SELECT
	ORDINAL_Position AS Column_id,
	COLUMN_NAME AS Column_Name
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'DBschema'
AND TABLE_NAME = 'TBBurdenByCountry'
ORDER BY Column_id;
*/

SELECT
	Country,
	Year,
	COALESCE(ROUND((Case_detection_rate_all_forms_percent), 2), 999999) AS low_Case_Detection_rate,
	COALESCE(ROUND((Estimated_incidence_all_forms_per_100k), 2), 9999999) AS high_TB_incidence
FROM Dbschema.TBBurdenByCountry
ORDER BY low_Case_Detection_rate, high_TB_incidence DESC;
GO