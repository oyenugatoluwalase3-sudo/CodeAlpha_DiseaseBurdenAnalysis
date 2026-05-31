USE DiseaseBurdenDB;
GO

-- check for Nulls

-- Table 1: `GlobalBurdenOfDisease`

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

SELECT TOP 5 * FROM DBschema.GlobalBurdenOfDisease;
GO

-- Table 2: `DBschema.TBBurdenByCountry`

SELECT
	COUNT(*) AS TotalRows,
	SUM(CASE WHEN Country IS NULL OR Country = '' THEN 1 ELSE 0 END) AS Column0_TotalNulls,
	SUM(CASE WHEN ISO_2_character_country IS NULL OR ISO_2_character_country = '' THEN 1 ELSE 0 END) AS Column1_TotalNulls,
	SUM(CASE WHEN ISO_3_character_country IS NULL OR ISO_3_character_country = '' THEN 1 ELSE 0 END) AS Column2_TotalNulls,
	SUM(CASE WHEN ISO_numeric_country IS NULL OR ISO_numeric_country = '' THEN 1 ELSE 0 END) AS Column3_TotalNulls,
	SUM(CASE WHEN Region IS NULL OR Region = '' THEN 1 ELSE 0 END) AS Column4_TotalNulls,
	SUM(CASE WHEN Year IS NULL OR Year = '' THEN 1 ELSE 0 END) AS Column5_TotalNulls,
	SUM(CASE WHEN Estimated_total_population_number IS NULL OR Estimated_total_population_number = '' THEN 1 ELSE 0 END) AS Column6_TotalNulls,
	SUM(CASE WHEN Estimated_prevalence_of_TB_per_100k IS NULL OR Estimated_prevalence_of_TB_per_100k = '' THEN 1 ELSE 0 END) AS Column7_TotalNulls,
	SUM(CASE WHEN Estimated_prevalence_of_TB_per_100k_low_bound IS NULL OR Estimated_prevalence_of_TB_per_100k_low_bound = '' THEN 1 ELSE 0 END) AS Column8_TotalNulls,
	SUM(CASE WHEN Estimated_prevalence_of_TB_per_100k_high_bound IS NULL OR Estimated_prevalence_of_TB_per_100k_high_bound = '' THEN 1 ELSE 0 END) AS Column9_TotalNulls,
	SUM(CASE WHEN Estimated_prevalence_of_TB_all_forms IS NULL OR Estimated_prevalence_of_TB_all_forms = '' THEN 1 ELSE 0 END) AS Column10_TotalNulls,
	SUM(CASE WHEN Estimated_prevalence_of_TB_all_forms_low_bound IS NULL OR Estimated_prevalence_of_TB_all_forms_low_bound = '' THEN 1 ELSE 0 END) AS Column11_TotalNulls,
	SUM(CASE WHEN Estimated_prevalence_of_TB_all_forms_high_bound IS NULL OR Estimated_prevalence_of_TB_all_forms_high_bound = '' THEN 1 ELSE 0 END) AS Column12_TotalNulls,
	SUM(CASE WHEN Method_to_derive_prevalence_estimates IS NULL OR Method_to_derive_prevalence_estimates = '' THEN 1 ELSE 0 END) AS Column13_TotalNulls,
	SUM(CASE WHEN Estimated_mortality_of_TB_cases_all_forms_excluding_HIV_per_100k IS NULL OR Estimated_mortality_of_TB_cases_all_forms_excluding_HIV_per_100k = '' THEN 1 ELSE 0 END) AS Column14_TotalNulls,
	SUM(CASE WHEN Estimated_mortality_of_TB_cases_all_forms_excluding_HIV_per_100k_low_bound IS NULL OR Estimated_mortality_of_TB_cases_all_forms_excluding_HIV_per_100k_low_bound = '' THEN 1 ELSE 0 END) AS Column15_TotalNulls,
	SUM(CASE WHEN Estimated_mortality_of_TB_cases_all_forms_excluding_HIV_per_100k_high_bound IS NULL OR Estimated_mortality_of_TB_cases_all_forms_excluding_HIV_per_100k_high_bound = '' THEN 1 ELSE 0 END) AS Column16_TotalNulls,
	SUM(CASE WHEN Estimated_number_of_deaths_from_TB_all_forms_excluding_HIV IS NULL OR Estimated_number_of_deaths_from_TB_all_forms_excluding_HIV = '' THEN 1 ELSE 0 END) AS Column17_TotalNulls,
	SUM(CASE WHEN Estimated_number_of_deaths_from_TB_all_forms_excluding_HIV_low_bound IS NULL OR Estimated_number_of_deaths_from_TB_all_forms_excluding_HIV_low_bound = '' THEN 1 ELSE 0 END) AS Column18_TotalNulls,
	SUM(CASE WHEN Estimated_number_of_deaths_from_TB_all_forms_excluding_HIV_high_bound IS NULL OR Estimated_number_of_deaths_from_TB_all_forms_excluding_HIV_high_bound = '' THEN 1 ELSE 0 END) AS Column19_TotalNulls,
	SUM(CASE WHEN Estimated_mortality_of_TB_cases_who_are_HIV_positive_per_100k IS NULL OR Estimated_mortality_of_TB_cases_who_are_HIV_positive_per_100k = '' THEN 1 ELSE 0 END) AS Column20_TotalNulls,
	SUM(CASE WHEN Estimated_mortality_of_TB_cases_who_are_HIV_positive_per_100k_low_bound IS NULL OR Estimated_mortality_of_TB_cases_who_are_HIV_positive_per_100k_low_bound = '' THEN 1 ELSE 0 END) AS Column21_TotalNulls,
	SUM(CASE WHEN Estimated_mortality_of_TB_cases_who_are_HIV_positive_per_100k_high_bound IS NULL OR Estimated_mortality_of_TB_cases_who_are_HIV_positive_per_100k_high_bound = '' THEN 1 ELSE 0 END) AS Column22_TotalNulls,
	SUM(CASE WHEN Estimated_number_of_deaths_from_TB_in_people_who_are_HIV_positive IS NULL OR Estimated_number_of_deaths_from_TB_in_people_who_are_HIV_positive = '' THEN 1 ELSE 0 END) AS Column23_TotalNulls,
	SUM(CASE WHEN Estimated_number_of_deaths_from_TB_in_people_who_are_HIV_positive_low_bound IS NULL OR Estimated_number_of_deaths_from_TB_in_people_who_are_HIV_positive_low_bound = '' THEN 1 ELSE 0 END) AS Column24_TotalNulls,
	SUM(CASE WHEN Estimated_number_of_deaths_from_TB_in_people_who_are_HIV_positive_high_bound IS NULL OR Estimated_number_of_deaths_from_TB_in_people_who_are_HIV_positive_high_bound = '' THEN 1 ELSE 0 END) AS Column25_TotalNulls,
	SUM(CASE WHEN Method_to_derive_mortality_estimates IS NULL OR Method_to_derive_mortality_estimates = '' THEN 1 ELSE 0 END) AS Column26_TotalNulls,
	SUM(CASE WHEN Estimated_incidence_all_forms_per_100k IS NULL OR Estimated_incidence_all_forms_per_100k = '' THEN 1 ELSE 0 END) AS Column27_TotalNulls,
	SUM(CASE WHEN Estimated_incidence_all_forms_per_100k_low_bound IS NULL OR Estimated_incidence_all_forms_per_100k_low_bound = '' THEN 1 ELSE 0 END) AS Column28_TotalNulls,
	SUM(CASE WHEN Estimated_incidence_all_forms_per_100k_high_bound IS NULL OR Estimated_incidence_all_forms_per_100k_high_bound = '' THEN 1 ELSE 0 END) AS Column29_TotalNulls,
	SUM(CASE WHEN Estimated_number_of_incident_cases_all_forms IS NULL OR Estimated_number_of_incident_cases_all_forms = '' THEN 1 ELSE 0 END) AS Column30_TotalNulls,
	SUM(CASE WHEN Estimated_number_of_incident_cases_all_forms_low_bound IS NULL OR Estimated_number_of_incident_cases_all_forms_low_bound = '' THEN 1 ELSE 0 END) AS Column31_TotalNulls,
	SUM(CASE WHEN Estimated_number_of_incident_cases_all_forms_high_bound IS NULL OR Estimated_number_of_incident_cases_all_forms_high_bound = '' THEN 1 ELSE 0 END) AS Column32_TotalNulls,
	SUM(CASE WHEN Method_to_derive_incidence_estimates IS NULL OR Method_to_derive_incidence_estimates = '' THEN 1 ELSE 0 END) AS Column33_TotalNulls,
	SUM(CASE WHEN Estimated_HIV_in_incident_TB_percent IS NULL OR Estimated_HIV_in_incident_TB_percent = '' THEN 1 ELSE 0 END) AS Column34_TotalNulls,
	SUM(CASE WHEN Estimated_HIV_in_incident_TB_percent_low_bound IS NULL OR Estimated_HIV_in_incident_TB_percent_low_bound = '' THEN 1 ELSE 0 END) AS Column35_TotalNulls,
	SUM(CASE WHEN Estimated_HIV_in_incident_TB_percent_high_bound IS NULL OR Estimated_HIV_in_incident_TB_percent_high_bound = '' THEN 1 ELSE 0 END) AS Column36_TotalNulls,
	SUM(CASE WHEN Estimated_incidence_of_TB_cases_who_are_HIV_positive_per_100k IS NULL OR Estimated_incidence_of_TB_cases_who_are_HIV_positive_per_100k = '' THEN 1 ELSE 0 END) AS Column37_TotalNulls,
	SUM(CASE WHEN Estimated_incidence_of_TB_cases_who_are_HIV_positive_per_100k_low_bound IS NULL OR Estimated_incidence_of_TB_cases_who_are_HIV_positive_per_100k_low_bound = '' THEN 1 ELSE 0 END) AS Column38_TotalNulls,
	SUM(CASE WHEN Estimated_incidence_of_TB_cases_who_are_HIV_positive_per_100k_high_bound IS NULL OR Estimated_incidence_of_TB_cases_who_are_HIV_positive_per_100k_high_bound = '' THEN 1 ELSE 0 END) AS Column39_TotalNulls,
	SUM(CASE WHEN Estimated_incidence_of_TB_cases_who_are_HIV_positive IS NULL OR Estimated_incidence_of_TB_cases_who_are_HIV_positive = '' THEN 1 ELSE 0 END) AS Column40_TotalNulls,
	SUM(CASE WHEN Estimated_incidence_of_TB_cases_who_are_HIV_positive_low_bound IS NULL OR Estimated_incidence_of_TB_cases_who_are_HIV_positive_low_bound = '' THEN 1 ELSE 0 END) AS Column41_TotalNulls,
	SUM(CASE WHEN Estimated_incidence_of_TB_cases_who_are_HIV_positive_high_bound IS NULL OR Estimated_incidence_of_TB_cases_who_are_HIV_positive_high_bound = '' THEN 1 ELSE 0 END) AS Column42_TotalNulls,
	SUM(CASE WHEN Method_to_derive_TBHIV_estimates IS NULL OR Method_to_derive_TBHIV_estimates = '' THEN 1 ELSE 0 END) AS Column43_TotalNulls,
	SUM(CASE WHEN Case_detection_rate_all_forms_percent IS NULL OR Case_detection_rate_all_forms_percent = '' THEN 1 ELSE 0 END) AS Column44_TotalNulls,
	SUM(CASE WHEN Case_detection_rate_all_forms_percent_low_bound IS NULL OR Case_detection_rate_all_forms_percent_low_bound = '' THEN 1 ELSE 0 END) AS Column45_TotalNulls,
	SUM(CASE WHEN Case_detection_rate_all_forms_percent_high_bound IS NULL OR Case_detection_rate_all_forms_percent_high_bound = '' THEN 1 ELSE 0 END) AS Column46_TotalNulls
	
FROM DBschema.TBBurdenByCountry;
GO

SELECT TOP 5 * FROM DBschema.TBBurdenByCountry;
GO


-- check for duplicates

-- Table 1: `GlobalBurdenOfDisease`

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

-- Table 2: `TBBurdenByCountry`

WITH CTE_Table2_duplicateCheck AS (
	SELECT
		Country, Year,
		ROW_NUMBER() OVER ( PARTITION BY Country,
										 Year
							ORDER BY Country   ) AS duplicate_check
	FROM DBschema.TBBurdenByCountry
)
	SELECT
		COUNT(*) AS Table2_Total_duplicates
	FROM CTE_Table2_duplicateCheck
	WHERE duplicate_check > 1;
GO

/*
UPDATE DBschema.TBBurdenByCountry
SET
    Estimated_prevalence_of_TB_per_100k = 
        CASE WHEN Estimated_prevalence_of_TB_per_100k = 0 
              AND Estimated_prevalence_of_TB_per_100k_low_bound IS NULL 
             THEN NULL ELSE Estimated_prevalence_of_TB_per_100k END,

    Estimated_prevalence_of_TB_all_forms = 
        CASE WHEN Estimated_prevalence_of_TB_all_forms = 0 
              AND Estimated_prevalence_of_TB_all_forms_low_bound IS NULL 
             THEN NULL ELSE Estimated_prevalence_of_TB_all_forms END,

    Estimated_incidence_all_forms_per_100k = 
        CASE WHEN Estimated_incidence_all_forms_per_100k = 0 
              AND Estimated_incidence_all_forms_per_100k_low_bound IS NULL 
             THEN NULL ELSE Estimated_incidence_all_forms_per_100k END,

    Estimated_number_of_incident_cases_all_forms = 
        CASE WHEN Estimated_number_of_incident_cases_all_forms = 0 
              AND Estimated_number_of_incident_cases_all_forms_low_bound IS NULL 
             THEN NULL ELSE Estimated_number_of_incident_cases_all_forms END,

    Estimated_mortality_of_TB_cases_who_are_HIV_positive_per_100k = 
        CASE WHEN Estimated_mortality_of_TB_cases_who_are_HIV_positive_per_100k = 0 
              AND Estimated_mortality_of_TB_cases_who_are_HIV_positive_per_100k_low_bound IS NULL 
             THEN NULL ELSE Estimated_mortality_of_TB_cases_who_are_HIV_positive_per_100k END,

    Estimated_number_of_deaths_from_TB_in_people_who_are_HIV_positive = 
        CASE WHEN Estimated_number_of_deaths_from_TB_in_people_who_are_HIV_positive = 0 
              AND Estimated_number_of_deaths_from_TB_in_people_who_are_HIV_positive_low_bound IS NULL 
             THEN NULL ELSE Estimated_number_of_deaths_from_TB_in_people_who_are_HIV_positive END;

GO

SELECT 
    SUM(CASE WHEN Estimated_prevalence_of_TB_per_100k IS NULL THEN 1 ELSE 0 END) AS Prevalence_NULLs,
    SUM(CASE WHEN Estimated_prevalence_of_TB_per_100k = 0 THEN 1 ELSE 0 END)    AS Prevalence_Zeros,
    SUM(CASE WHEN Estimated_incidence_all_forms_per_100k IS NULL THEN 1 ELSE 0 END) AS Incidence_NULLs,
    SUM(CASE WHEN Estimated_incidence_all_forms_per_100k = 0 THEN 1 ELSE 0 END)    AS Incidence_Zeros,
    SUM(CASE WHEN Estimated_mortality_of_TB_cases_who_are_HIV_positive_per_100k IS NULL THEN 1 ELSE 0 END) AS HIV_Mort_NULLs,
    SUM(CASE WHEN Estimated_mortality_of_TB_cases_who_are_HIV_positive_per_100k = 0 THEN 1 ELSE 0 END)    AS HIV_Mort_Zeros
FROM DBschema.TBBurdenByCountry;

UPDATE DBschema.GlobalBurdenOfDisease
SET Number_of_Deaths = NULL
WHERE Number_of_Deaths = '';
*/

SELECT 'GlobalBurdenOfDisease' AS Dataset, COUNT(*) AS Total_Nr_Of_Rows FROM DBschema.GlobalBurdenOfDisease
UNION ALL
SELECT 'TBBurdenByCountry', COUNT(*) FROM DBschema.TBBurdenByCountry;
GO

/*

Both tables were checked for nulls, empty strings, duplicates,
and false zeros. No duplicate records were found in either table.

GLOBALBURDEROFDISEASE — FINDINGS:

The dataset is largely complete. Six out of seven columns have no
missing values at all across all 58,905 rows.

One issue was found: the Number_of_Deaths column had 77 empty
string values. These were not caught by a standard IS NULL check
because they were stored as blank text rather than true NULLs.
The OR = '' condition in the null check query caught them correctly.
These 77 rows still have valid death rate values, so they are
only partially affected. An UPDATE was run to convert the empty
strings to proper NULLs so they are handled correctly in calculations.
This affects 0.13% of the dataset and does not significantly impact
the analysis.

TBBURDENBYCOUNTRY — FINDINGS:

This table has missing values across several columns, but all of
them are expected based on how the WHO collected and reported
this data. None of them indicate a data quality problem.

- ISO 2-character country code: 24 missing (0.5%)
  Some small territories do not have an ISO 2-letter code assigned.
  The ISO 3-character code is fully populated and will be used
  as the join key instead.

- Prevalence columns: 20 missing each (0.4%)
  These are very small island territories where the WHO had no
  TB burden data to report. The same 20 rows also had false zeros
  — where the value showed 0 but the confidence bounds were missing.
  This confirmed they were actually empty in the source, not genuine
  zero readings. They were corrected to NULL.

- Mortality columns (excluding HIV): 151 to 220 missing (2.9% to 4.3%)
  These are countries where TB mortality was too low to estimate or
  was not reported. The slight difference in counts between the
  central estimate and the bounds is normal in WHO datasets.

- Incidence columns: 94 missing each (1.8%)
  Same situation — countries where TB incidence was too low to
  reliably estimate. These also had false zeros that were corrected
  to NULL.

- HIV-related columns: roughly 1,475 to 2,108 missing (29% to 41%)
  This is the largest group of missing values. HIV-related TB data
  was missing mostly in earlier years because many countries were
  not yet consistently tracking HIV-TB co-infection. This is a
  historical gap in the WHO data, not a problem with the dataset
  itself. These columns should be filtered with IS NOT NULL in
  any HIV-related queries.

- Method_to_derive_incidence_estimates: 2,133 missing (41.7%)
  The WHO did not record the method used for roughly 42% of
  incidence estimates. This column can be used where it is
  populated but cannot be treated as a complete reference.

- Method_to_derive_TBHIV_estimates: 5,120 missing (100%)
  This entire column is blank across all rows. It has no usable
  data and will be excluded from all analysis.

- Case detection rate columns: 469 missing each (9.2%)
  About 9% of country-year combinations have no detection rate
  recorded. These gaps are mostly in earlier years and smaller
  territories.

FALSE ZERO CORRECTION:
Some columns had values recorded as 0 when the confidence bounds
for the same row were missing. A genuine zero reading would have
bounds of 0 or close to 0. Where the central value was 0 but the
bounds were NULL, the value was considered an empty cell from the
source and was updated to NULL. This affected:
- Prevalence columns: 20 rows corrected
- Incidence columns: 94 rows corrected
- HIV mortality columns: 1,942 rows corrected

35 rows of zero HIV mortality were kept as 0 because their
confidence bounds were also 0 — these are considered genuine
values for countries with very low HIV-TB burden.

OVERALL CONCLUSION:
Both datasets are ready for analysis. The GBD dataset is nearly
complete with one minor issue corrected. The TB dataset has
missing values in several columns, but they do not significantly
affect analysis of the main TB metrics — prevalence, incidence,
mortality, and case detection rate — which are complete enough
for meaningful analysis across the full time period.
*/