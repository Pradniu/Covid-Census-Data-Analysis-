# COVID-19 Census Data Analysis
<img width="2312" height="1264" alt="image" src="https://github.com/user-attachments/assets/746ca616-5315-4cc9-bbfb-f44c74458b39" />

Analyzed global COVID-19 pandemic data to identify trends, infection rates, mortality rates, and vaccination progress. Used SQL Server for data queries, Excel for data cleaning, and Tableau interactive visualizations.

## Table of Contents
1. Project Overview
2. Key Metrics
3. Tools Used
4. Project Files
5. How to Use
6. Key Findings
7. Setup Instructions
8. Contact

## Project Overview

This project explores COVID-19 death and vaccination data across countries and continents to answer critical questions:
- Which countries have the highest infection rates relative to population?
- What is the death percentage by country?
- How effectively did vaccination programs roll out globally?
- Which continents were most affected?

## Key Metrics

Death Percentage: (total_deaths/total_cases) × 100
- Measures how many COVID cases resulted in death in each country

Infection Rate: (total_cases/population) × 100
- Shows what percentage of population got infected

Vaccination Coverage: (total_vaccinations/population) × 100
- Tracks vaccination rollout effectiveness

## Tools Used

SQL Server - Complex data queries and analysis
Excel - Data cleaning and preprocessing
Tableau - Interactive dashboards and visualizations
Git - Version control

## Project Files

CovidDeaths.xlsx (17.5 MB)
- Raw COVID-19 death statistics by country and date
- Includes: location, date, cases, deaths, population

covid vaccinations.xlsx (23.5 MB)
- Raw vaccination data by country and date
- Includes: location, date, new vaccinations, population

CovidSQLQuery.sql (4 KB)
- 11 optimized SQL queries for data analysis
- Includes: death percentages, infection rates, vaccination coverage, continental comparisons

Covid Data .twbx (4.4 MB)
- Interactive Tableau DashBoard
- Features: maps, trend charts, regional comparisons, KPI cards

## How to Use

1. Clone the Repository
```bash
git clone https://github.com/Pradniu/Covid-Census-Data-Analysis-.git
```

2. Open Data Files
- Review CovidDeaths.xlsx and covid vaccinations.xlsx in Excel

3. Set Up Database
- Create database named "census" in SQL Server
- Import Excel files as tables: CovidDeaths and CovidVaccinations

4. Run SQL Queries
- Execute CovidSQLQuery.sql in SQL Server Management Studio
- Queries generate analysis tables for Power BI

5. View Dashboard
- Open Covid Data .twbx in Tableau Desktop or Public
- Explore interactive visualizations and filter by country, continent, date range

## Key Findings

Deaths by Country
- Top countries by total death count identified and ranked
- Nepal-specific analysis shows death percentage trends

Infection Rates
- Countries ranked by percentage of population infected
- Shows outbreak severity beyond raw case numbers
- Helps identify most impacted regions

Vaccination Progress
- Running vaccination totals track rollout by country
- Shows vaccination percentage relative to population
- Compares vaccination speed across continents

Continental Comparison
- Aggregate death counts and statistics by continent
- Identifies regional patterns and trends
- Supports policy-level decision making

## Setup Instructions

Requirements:
- SQL Server (2016 or later)
- Microsoft Excel
- Tableau
- Git

Step-by-Step:

1. Clone repository and navigate to folder

2. Open SQL Server Management Studio
   - Create new database: census
   - Right-click > Tasks > Import Data
   - Select CovidDeaths.xlsx file
   - Import as table: CovidDeaths
   - Repeat for covid vaccinations.xlsx as CovidVaccinations

3. Open CovidSQLQuery.sql
   - Execute all queries to generate analysis tables

4. Connect Tableau to Database
   - Open Covid Data .twbx
   - Update data source connections to your census database
   - Refresh data

5. Explore Dashboard
   - Filter by country, continent, date
   - Export reports as needed

## SQL Query Summary

Query 1: Overview of all death records by continent

Query 2: Basic metrics (cases, deaths, population) by location and date

Query 3: Death percentage for Nepal - shows how deadly COVID was

Query 4: Global statistics - aggregated deaths and case percentages

Query 5: Highest infection rates - which countries had population most affected

Query 6: Countries ranked by total death count

Query 7: Continents ranked by total death count

Query 8: Join deaths with vaccination data - shows vaccination progress

Query 9: CTE approach - organized view of population vs vaccination

Query 10: Temporary table with vaccination percentage calculations

Query 11: Reusable view for vaccination data analysis

## Tableau Dashboard Features

Map Visualizations - Heat maps showing infection and death rates by country

Trend Charts - Time-series graphs of cases and deaths over time

Regional Dashboards - Country-level and continent-level comparisons

KPI Cards - Key metrics at a glance (global deaths, cases, vaccinations)

Vaccination Progress - Coverage percentage by region

Interactive Filters - Drill down by country, continent, date range

## Data Quality

- All null values handled with proper WHERE clauses
- Division by zero errors prevented with CASE statements
- Type conversion ensures accurate calculations
- Duplicate queries removed for clean analysis

## Key Technologies Demonstrated

Window Functions - Running totals of vaccinations by location

Common Table Expressions (CTEs) - Organized complex queries

Temporary Tables - Performance optimization

Views - Reusable query logic

Type Conversion - Consistent numeric calculations

Aggregation - Grouping by location, continent, date

## Insights for Recruiters

Demonstrates advanced SQL skills: Window functions, CTEs, joins, aggregation

Shows data visualization expertise: Tableau interactive dashboards

Proves data cleaning ability: Excel preprocessing and SQL validation

Indicates analytical thinking: Identified key metrics and trends

Shows version control knowledge: Git repository structure

Reflects attention to detail: Error handling, null checks, consistent formatting

## Contributing

Fork the repository
Create feature branch (git checkout -b feature/improvement)
Commit changes (git commit -m 'Add analysis improvement')
Push branch (git push origin feature/improvement)
Open Pull Request

## License

MIT License - See LICENSE file for details

## Contact

GitHub: Pradniu
Repository: Covid-Census-Data-Analysis-

Questions or suggestions? Open a GitHub Issue.

## Quick Start Checklist

Clone repository
Review data files in Excel
Create "census" database in SQL Server
Import Excel files as tables
Execute all SQL queries
Open Tableau dashboard
Customize visualizations
Export insights and reports

Project Status: Complete and Active
Last Updated: June 2026
