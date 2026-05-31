USE DiseaseBurdenDB;
GO

-- ========================================
-- Table 1: `GlobalBurdenOfDisease`
-- ========================================

TRUNCATE TABLE DBschema.GlobalBurdenOfDisease;
GO

BULK INSERT DBschema.GlobalBurdenOfDisease
FROM 'C:\Users\Admin\Downloads\Datasets2\Health Datasets\GBD_clean.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);
GO

SELECT COUNT(*) AS Total_Rows FROM DBschema.GlobalBurdenOfDisease;
SELECT TOP 5 * FROM DBschema.GlobalBurdenOfDisease;
GO

-- =========================================
-- Table 2 : `TBBurdenByCountry`
-- =========================================

TRUNCATE TABLE DBschema.TBBurdenByCountry;
GO

BULK INSERT DBschema.TBBurdenByCountry
FROM 'C:\Users\Admin\Downloads\Datasets2\Health Datasets\TB_clean.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);
GO

SELECT COUNT(*) AS Total_Rows FROM DBschema.TBBurdenByCountry;
SELECT TOP 3 * 
FROM DBschema.TBBurdenByCountry;
GO

