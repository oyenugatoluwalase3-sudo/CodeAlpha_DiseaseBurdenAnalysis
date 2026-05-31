# CodeAlpha_DiseaseBurdenAnalysis

## Project Overview
Exploratory data analysis of global disease burden and tuberculosis trends using SQL Server and Power BI.

* **Internship:** CodeAlpha Data Analytics Internship
* **Tasks Covered:** Task 2 (EDA — SQL) | Task 3 (Data Visualization — Power BI)
* **Author:** Oyenuga Toluwalase Elijah

## Datasets
Two datasets were used for this project:
* Global Burden of Disease — 58,905 rows, covering 187 countries across 1970–2010, with data broken down by country, year, age group, and sex.
* TB Burden by Country — 5,120 rows, covering 186 countries across 1990–2013, with data broken down by country, WHO region, and year.

Both datasets share 186 countries. Since they cover different time periods, cross-dataset analysis was performed using the overlapping years 1990, 2000, and 2010.

## Repository Structure
```text
CodeAlpha_DiseaseBurdenAnalysis/
├── data/
│   ├── Global_Burden_of_Disease.csv
│   └── Tuberculosis_Burden_by_Country.csv
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_load_data.sql
│   ├── 03_data_validation.sql
│   ├── 04_gbd_eda.sql
│   ├── 05_tb_eda.sql
│   └── 06_joined_analysis.sql
├── powerbi/
│   ├── DiseaseBurdenDashboard.pbix
│   └── screenshots/
│       ├── page1_global_burden.png
│       └── page2_tb_burden.png
├── findings/
│   └── EDA_Insights_Summary.md
└── README.md
