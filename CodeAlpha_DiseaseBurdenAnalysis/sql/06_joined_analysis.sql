USE DiseaseBurdenDB;
GO

/*
SELECT
	'TBBurdenByCountry' AS Column_Name,
	COUNT(*) AS Total_Rows
FROM DBschema.TBBurdenByCountry
UNION ALL
SELECT 
	'GlobalBurdenOfDisease',
	COUNT(*)
FROM DBschema.GlobalBurdenOfDisease;
GO

SELECT
	ORDINAL_POSITION AS Column_id,
	COLUMN_NAME AS Column_name,
	DATA_TYPE AS Data_Type
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Dbschema'
 AND TABLE_NAME = 'GlobalBurdenOfDisease';
GO

 
SELECT
	ORDINAL_POSITION AS Column_id,
	COLUMN_NAME AS Column_name,
	DATA_TYPE AS Data_Type
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Dbschema'
 AND TABLE_NAME = 'TBBurdenByCountry';
GO
*/

-- Cross-dataset join questions (bridge years: 1990, 2000, 2010):

-- In the bridge years, which countries appear in both datasets?

SELECT
	DISTINCT t.Country AS Country
FROM DBschema.TBBurdenByCountry AS t
JOIN DBschema.GlobalBurdenOfDisease AS g
	ON t.Country = g.Country_Name
	AND g.Year = t.Year
WHERE t.Year IN (1990, 2000, 2010);
GO

-- Do countries with high overall GBD death rates also show high TB burden?

/*
SELECT TOP 10
Country_Name AS Country,
SUM(Death_Rate_Per_100k )AS overall_GBD_Death_rates
FROM Dbschema.GlobalBurdenOfDisease
GROUP BY Country_Name
ORDER BY overall_GBD_Death_rates DESC

SELECT
	Country,
	ROUND(AVG(Estimated_prevalence_of_TB_per_100k), 2) AS high_TbB_Burden
FROM DBschema.TBBurdenByCountry
GROUP BY Country
ORDER BY high_TbB_Burden DESC
*/

SELECT
	t.Country AS Country,
	ROUND(COALESCE(AVG(g.Death_Rate_Per_100k), 0), 2) AS overall_GDB_death_rates,
	ROUND(COALESCE(AVG(t.Estimated_prevalence_of_TB_per_100k), 0), 2) AS TB_Burden
FROM DBschema.TBBurdenByCountry AS t
LEFT JOIN DBschema.GlobalBurdenOfDisease AS g
	ON g.Country_Name = t.Country
	AND t.year = g.year
	AND g.Age_Group = 'All ages'
	AND g.Sex = 'Both'
GROUP BY t.Country
ORDER BY overall_GDB_death_rates DESC;
GO