USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = N'DiseaseBurdenDB')
BEGIN
    ALTER DATABASE DiseaseBurdenDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DiseaseBurdenDB;
END
GO

CREATE DATABASE DiseaseBurdenDB;
GO

USE DiseaseBurdenDB;
GO

DROP SCHEMA IF EXISTS DBschema;
GO

CREATE SCHEMA DBschema;
GO

-- ========================================
-- Table 1: `GlobalBurdenOfDisease`
-- ========================================

DROP TABLE IF EXISTS DBschema.GlobalBurdenOfDisease;
GO

CREATE TABLE DBschema.GlobalBurdenOfDisease (
    Country_Code        VARCHAR(15),
    Country_Name        VARCHAR(100),
    Year                VARCHAR(10),
    Age_Group           VARCHAR(25),
    Sex                 VARCHAR(10),
    Number_of_Deaths    VARCHAR(50),
    Death_Rate_Per_100k VARCHAR(50)
);

USE DiseaseBurdenDB;
GO

-- Recast 'Year' from VARCHAR to INT
ALTER TABLE DBschema.GlobalBurdenOfDisease
ALTER COLUMN Year INT;

-- Recast 'Number_of_Deaths' from VARCHAR to INT
ALTER TABLE DBschema.GlobalBurdenOfDisease
ALTER COLUMN Number_of_Deaths INT;

-- Recast 'Death_Rate_Per_100k' from VARCHAR to FLOAT
ALTER TABLE DBschema.GlobalBurdenOfDisease
ALTER COLUMN Death_Rate_Per_100k FLOAT;
GO

-- =========================================
-- Table 2 : `TBBurdenByCountry`
-- =========================================

DROP TABLE IF EXISTS DBschema.TBBurdenByCountry;
GO

CREATE TABLE DBschema.TBBurdenByCountry (
	Country VARCHAR(100),
	ISO_2_character_country VARCHAR(50),
	ISO_3_character_country VARCHAR(50),
	ISO_numeric_country INT,
	Region VARCHAR(50),
	Year INT,
	Estimated_total_population_number FLOAT,
	Estimated_prevalence_of_TB_per_100k FLOAT,
	Estimated_prevalence_of_TB_per_100k_low_bound FLOAT,
	Estimated_prevalence_of_TB_per_100k_high_bound FLOAT,
	Estimated_prevalence_of_TB_all_forms FLOAT,
	Estimated_prevalence_of_TB_all_forms_low_bound FLOAT,
	Estimated_prevalence_of_TB_all_forms_high_bound FLOAT,
	Method_to_derive_prevalence_estimates VARCHAR(50),
	Estimated_mortality_of_TB_cases_all_forms_excluding_HIV_per_100k FLOAT,
	Estimated_mortality_of_TB_cases_all_forms_excluding_HIV_per_100k_low_bound FLOAT,
	Estimated_mortality_of_TB_cases_all_forms_excluding_HIV_per_100k_high_bound FLOAT,
	Estimated_number_of_deaths_from_TB_all_forms_excluding_HIV FLOAT,
	Estimated_number_of_deaths_from_TB_all_forms_excluding_HIV_low_bound FLOAT,
	Estimated_number_of_deaths_from_TB_all_forms_excluding_HIV_high_bound FLOAT,
	Estimated_mortality_of_TB_cases_who_are_HIV_positive_per_100k FLOAT,
	Estimated_mortality_of_TB_cases_who_are_HIV_positive_per_100k_low_bound FLOAT,
	Estimated_mortality_of_TB_cases_who_are_HIV_positive_per_100k_high_bound FLOAT,
	Estimated_number_of_deaths_from_TB_in_people_who_are_HIV_positive FLOAT,
	Estimated_number_of_deaths_from_TB_in_people_who_are_HIV_positive_low_bound FLOAT,
	Estimated_number_of_deaths_from_TB_in_people_who_are_HIV_positive_high_bound FLOAT,
	Method_to_derive_mortality_estimates VARCHAR(50),
	Estimated_incidence_all_forms_per_100k FLOAT,
	Estimated_incidence_all_forms_per_100k_low_bound FLOAT,
	Estimated_incidence_all_forms_per_100k_high_bound FLOAT,
	Estimated_number_of_incident_cases_all_forms FLOAT,
	Estimated_number_of_incident_cases_all_forms_low_bound FLOAT,
	Estimated_number_of_incident_cases_all_forms_high_bound FLOAT,
	Method_to_derive_incidence_estimates VARCHAR(50),
	Estimated_HIV_in_incident_TB_percent FLOAT,
	Estimated_HIV_in_incident_TB_percent_low_bound FLOAT,
	Estimated_HIV_in_incident_TB_percent_high_bound FLOAT,
	Estimated_incidence_of_TB_cases_who_are_HIV_positive_per_100k FLOAT,
	Estimated_incidence_of_TB_cases_who_are_HIV_positive_per_100k_low_bound FLOAT,
	Estimated_incidence_of_TB_cases_who_are_HIV_positive_per_100k_high_bound FLOAT,
	Estimated_incidence_of_TB_cases_who_are_HIV_positive FLOAT,
	Estimated_incidence_of_TB_cases_who_are_HIV_positive_low_bound FLOAT,
	Estimated_incidence_of_TB_cases_who_are_HIV_positive_high_bound FLOAT,
	Method_to_derive_TBHIV_estimates VARCHAR(50),
	Case_detection_rate_all_forms_percent FLOAT,
	Case_detection_rate_all_forms_percent_low_bound FLOAT,
	Case_detection_rate_all_forms_percent_high_bound FLOAT
);
GO

-- Recasting columns to their appropriate data type
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN ISO_numeric_country INT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Year INT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_total_population_number FLOAT;

-- Prevalence Metrics
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_prevalence_of_TB_per_100k FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_prevalence_of_TB_per_100k_low_bound FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_prevalence_of_TB_per_100k_high_bound FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_prevalence_of_TB_all_forms FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_prevalence_of_TB_all_forms_low_bound FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_prevalence_of_TB_all_forms_high_bound FLOAT;

-- Mortality (Excluding HIV) Metrics
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_mortality_of_TB_cases_all_forms_excluding_HIV_per_100k FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_mortality_of_TB_cases_all_forms_excluding_HIV_per_100k_low_bound FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_mortality_of_TB_cases_all_forms_excluding_HIV_per_100k_high_bound FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_number_of_deaths_from_TB_all_forms_excluding_HIV FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_number_of_deaths_from_TB_all_forms_excluding_HIV_low_bound FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_number_of_deaths_from_TB_all_forms_excluding_HIV_high_bound FLOAT;

-- Mortality (HIV Positive) Metrics
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_mortality_of_TB_cases_who_are_HIV_positive_per_100k FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_mortality_of_TB_cases_who_are_HIV_positive_per_100k_low_bound FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_mortality_of_TB_cases_who_are_HIV_positive_per_100k_high_bound FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_number_of_deaths_from_TB_in_people_who_are_HIV_positive FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_number_of_deaths_from_TB_in_people_who_are_HIV_positive_low_bound FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_number_of_deaths_from_TB_in_people_who_are_HIV_positive_high_bound FLOAT;

-- Incidence Metrics
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_incidence_all_forms_per_100k FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_incidence_all_forms_per_100k_low_bound FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_incidence_all_forms_per_100k_high_bound FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_number_of_incident_cases_all_forms FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_number_of_incident_cases_all_forms_low_bound FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_number_of_incident_cases_all_forms_high_bound FLOAT;

-- HIV/TB Percentage and Co-infection Co-incidence Metrics
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_HIV_in_incident_TB_percent FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_HIV_in_incident_TB_percent_low_bound FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_HIV_in_incident_TB_percent_high_bound FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_incidence_of_TB_cases_who_are_HIV_positive_per_100k FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_incidence_of_TB_cases_who_are_HIV_positive_per_100k_low_bound FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_incidence_of_TB_cases_who_are_HIV_positive_per_100k_high_bound FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_incidence_of_TB_cases_who_are_HIV_positive FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_incidence_of_TB_cases_who_are_HIV_positive_low_bound FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Estimated_incidence_of_TB_cases_who_are_HIV_positive_high_bound FLOAT;

-- Case Detection Rates
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Case_detection_rate_all_forms_percent FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Case_detection_rate_all_forms_percent_low_bound FLOAT;
ALTER TABLE DBschema.TBBurdenByCountry ALTER COLUMN Case_detection_rate_all_forms_percent_high_bound FLOAT;
GO

/*
=========================================================
DATA DICTIONARY
=========================================================

-- Table: `global_burden_disease` (Global Burden of Disease Dataset)
	{
		'Country Code' : 'The unique three-letter geographical code identifying the nation',
		'Country Name' : 'The full, official name of the country or territory',
		'Year' : 'The specific calendar year the mortality data was collected',
		'Age Group' : 'The targeted age bracket of the population group, ranging from newborns to the elderly',
		'Sex' : 'The biological sex category of the tracked population group, including combined totals',
		'Number of Deaths' : 'The absolute total count of recorded human deaths within that specific demographic group',
		'Death Rate Per 100,000' : 'The standardized mortality rate calculated per 100,000 people in that group to allow for equal comparison'
	}

-- Table: `tuberculosis_burden` (Tuberculosis Burden by Country Dataset)
	{
		'Country or territory name' : 'The common name of the country, nation, or administrative territory',
		'ISO 2-character country/territory code' : 'A standard two-letter abbreviation representing the country',
		'ISO 3-character country/territory code' : 'A standard three-letter abbreviation representing the country',
		'ISO numeric country/territory code' : 'The official three-digit numeric code identifier for the country',
		'Region' : 'The geographical or administrative world region code as designated by health organizations',
		'Year' : 'The specific calendar year for which the tuberculosis metrics are estimated',
		'Estimated total population number' : 'The overall estimated head count of people living in the country that year',
		'Estimated prevalence of TB (all forms) per 100 000 population' : 'The expected number of active tuberculosis cases found for every 100,000 citizens',
		'Estimated prevalence of TB (all forms) per 100 000 population, low bound' : 'The lowest plausible statistical value for the TB case rate per 100,000 people',
		'Estimated prevalence of TB (all forms) per 100 000 population, high bound' : 'The highest plausible statistical value for the TB case rate per 100,000 people',
		'Estimated prevalence of TB (all forms)' : 'The total absolute number of people estimated to be living with active tuberculosis',
		'Estimated prevalence of TB (all forms), low bound' : 'The lowest plausible estimate for the total volume of active tuberculosis cases',
		'Estimated prevalence of TB (all forms), high bound' : 'The highest plausible estimate for the total volume of active tuberculosis cases',
		'Method to derive prevalence estimates' : 'The analytical model or source of data used to calculate the prevalence figures',
		'Estimated mortality of TB cases (all forms, excluding HIV) per 100 000 population' : 'The estimated annual death rate from tuberculosis per 100,000 people, specifically excluding individuals who also have HIV',
		'Estimated mortality of TB cases (all forms, excluding HIV), per 100 000 population, low bound' : 'The lower safety boundary for the estimated TB-only death rate per 100,000 people',
		'Estimated mortality of TB cases (all forms, excluding HIV), per 100 000 population, high bound' : 'The upper safety boundary for the estimated TB-only death rate per 100,000 people',
		'Estimated number of deaths from TB (all forms, excluding HIV)' : 'The total absolute count of individuals who died from tuberculosis, excluding those with HIV co-infection',
		'Estimated number of deaths from TB (all forms, excluding HIV), low bound' : 'The lower margin of error for the total absolute deaths from tuberculosis alone',
		'Estimated number of deaths from TB (all forms, excluding HIV), high bound' : 'The upper margin of error for the total absolute deaths from tuberculosis alone',
		'Estimated mortality of TB cases who are HIV-positive, per 100 000 population' : 'The estimated annual death rate from tuberculosis per 100,000 people among individuals who are also HIV-positive',
		'Estimated mortality of TB cases who are HIV-positive, per 100 000 population, low bound' : 'The lower plausible limit for the TB death rate among the HIV-positive population per 100,000 individuals',
		'Estimated mortality of TB cases who are HIV-positive, per 100 000 population, high bound' : 'The upper plausible limit for the TB death rate among the HIV-positive population per 100,000 individuals',
		'Estimated number of deaths from TB in people who are HIV-positive' : 'The absolute total count of lives lost to tuberculosis among patients who were co-infected with HIV',
		'Estimated number of deaths from TB in people who are HIV-positive, low bound' : 'The lower margin of certainty for the total deaths among TB-HIV co-infected patients',
		'Estimated number of deaths from TB in people who are HIV-positive, high bound' : 'The upper margin of certainty for the total deaths among TB-HIV co-infected patients',
		'Method to derive mortality estimates' : 'The analytical model or epidemiological technique used to determine the final death statistics',
		'Estimated incidence (all forms) per 100 000 population' : 'The estimated rate of brand-new tuberculosis infections developing per 100,000 individuals during that year',
		'Estimated incidence (all forms) per 100 000 population, low bound' : 'The minimum estimated rate of new annual TB infections per 100,000 people',
		'Estimated incidence (all forms) per 100 000 population, high bound' : 'The maximum estimated rate of new annual TB infections per 100,000 people',
		'Estimated number of incident cases (all forms)' : 'The total absolute number of newly diagnosed or emerging tuberculosis cases over the year',
		'Estimated number of incident cases (all forms), low bound' : 'The lowest expected total count of newly emerging tuberculosis cases',
		'Estimated number of incident cases (all forms), high bound' : 'The highest expected total count of newly emerging tuberculosis cases',
		'Method to derive incidence estimates' : 'The scientific framework or mathematical model applied to calculate new case development figures',
		'Estimated HIV in incident TB (percent)' : 'The percentage of individuals newly diagnosed with tuberculosis who are also found to test positive for HIV',
		'Estimated HIV in incident TB (percent), low bound' : 'The minimum plausible percentage value for TB and HIV co-infection in new cases',
		'Estimated HIV in incident TB (percent), high bound' : 'The maximum plausible percentage value for TB and HIV co-infection in new cases',
		'Estimated incidence of TB cases who are HIV-positive per 100 000 population' : 'The estimated rate of newly emerging TB cases specifically among the HIV-positive population per 100,000 individuals',
		'Estimated incidence of TB cases who are HIV-positive per 100 000 population, low bound' : 'The lowest plausible rate of new TB cases occurring in the HIV-positive community per 100,000 people',
		'Estimated incidence of TB cases who are HIV-positive per 100 000 population, high bound' : 'The highest plausible rate of new TB cases occurring in the HIV-positive community per 100,000 people',
		'Estimated incidence of TB cases who are HIV-positive' : 'The overall total count of new tuberculosis cases discovered in people who are HIV-positive',
		'Estimated incidence of TB cases who are HIV-positive, low bound' : 'The lower absolute statistical limit for new TB infections in the HIV-positive population',
		'Estimated incidence of TB cases who are HIV-positive, high bound' : 'The upper absolute statistical limit for new TB infections in the HIV-positive population',
		'Method to derive TBHIV estimates' : 'The specific analytical methodology or reporting system used to track TB-HIV co-infection rates',
		'Case detection rate (all forms), percent' : 'The proportion of actual tuberculosis cases that are successfully identified, diagnosed, and recorded by national healthcare infrastructure',
		'Case detection rate (all forms), percent, low bound' : 'The conservative lowest estimate for the efficiency rate of tracking and finding TB cases',
		'Case detection rate (all forms), percent, high bound' : 'The optimistic highest estimate for the efficiency rate of tracking and finding TB cases'
	}

====================================================================
TABLE DESCRIPTIONS
====================================================================
- global_burden_disease: A historical public health dataset recording global mortality numbers and standardized death rates across various countries and territories, broken down by specific age groups, calendar years, and sexes.
  
- tuberculosis_burden: A highly detailed epidemiological tracking dataset capturing annual country-level estimates of tuberculosis prevalence, incidence, mortality, and diagnostic detection rates, with a strong focus on assessing the overlap with HIV co-infection.
*/

/*

A database called DiseaseBurdenDB was created in SQL Server to store
two public health datasets. A schema called DBschema was used to keep
both tables organised in one place.

TABLE 1: GlobalBurdenOfDisease
This table stores global mortality data covering 195 countries from
1970 to 2010. It tracks death counts and death rates broken down by
country, year, age group, and sex. The table has 7 columns and loaded
58,905 rows successfully.

Design notes:
- Number_of_Deaths and Death_Rate_Per_100k were stored as VARCHAR
  instead of numbers because the source file had commas inside the
  values (e.g. "19,241"). Storing them as text first allowed the data
  to load without errors. The commas are removed at query time.
- Year was stored as INT because the source only contains 4-digit years,
  not full dates.

TABLE 2: TBBurdenByCountry
This table stores WHO tuberculosis data covering 217 countries from
1990 to 2013. It tracks TB prevalence, incidence, mortality, and case
detection rates, each with low and high confidence bounds. The table
has 47 columns and loaded 5,120 rows successfully.

Design notes:
- All numeric metric columns were stored as FLOAT because some values
  are decimals and some rows have missing data. Using INT would have
  caused errors or lost decimal precision.
- The three Method columns were stored as VARCHAR because they contain
  text descriptions like "predicted" and "Survey", not numbers.

IMPORT PROCESS:
Both CSV files had commas inside some field values — inside country
names like "Congo, the Democratic Republic of the" and inside large
numbers like "19,241". This caused SQL Server to misread the column
boundaries during import.

To fix this, a Python script was used to:
- Remove the commas from inside country names
- Strip thousands-separator commas from numeric columns
- Save the files correctly so Windows line endings did not cause
  further import errors

After these fixes, both files loaded cleanly using BULK INSERT.
These are common issues when importing real-world datasets and are
worth noting as part of the data preparation process.
*/