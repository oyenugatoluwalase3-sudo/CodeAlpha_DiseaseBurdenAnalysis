# CodeAlpha: Disease Burden & Tuberculosis Analysis

[![SQL Server](https://img.shields.io/badge/Database-SQL%20Server-red?style=flat-square&logo=microsoft-sql-server)](https://www.microsoft.com/en-us/sql-server)
[![Power BI](https://img.shields.io/badge/Dashboard-Power%20BI-yellow?style=flat-square&logo=power-bi)](https://powerbi.microsoft.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)](https://opensource.org/licenses/MIT)

## 📌 Project Overview
An exploratory data analysis (EDA) of global disease burden and tuberculosis trends leveraging **SQL Server (T-SQL)** for data warehousing and querying, and **Power BI** for interactive business intelligence reporting.

* **Internship:** CodeAlpha Data Analytics Internship
* **Tasks Covered:** Task 2 (EDA — SQL) & Task 3 (Data Visualization — Power BI)
* **Author:** Oyenuga Toluwalase Elijah

---

## 📊 Datasets
The analysis bridges two primary datasets to uncover global health insights. While they cover different spans, cross-dataset integration was achieved using the overlapping years: **1990, 2000, and 2010**.

| Dataset | Row Count | Country Coverage | Time Span | Breakdown Dimensions |
| :--- | :--- | :--- | :--- | :--- |
| **Global Burden of Disease** | 58,905 | 187 countries | 1970–2010 | Country, Year, Age Group, Sex |
| **TB Burden by Country** | 5,120 | 186 countries | 1990–2013 | Country, WHO Region, Year |

---

## 🗂️ Repository Structure

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
