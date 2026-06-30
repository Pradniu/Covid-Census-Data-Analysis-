# COVID-19 Census Data Analysis

A comprehensive data analysis project exploring COVID-19 pandemic statistics across countries and regions. This project combines SQL data manipulation, Excel data cleaning, and interactive Power BI visualizations to derive meaningful insights from global COVID-19 data.

## Project Overview

This project analyzes global COVID-19 death and vaccination data to identify trends, infection rates, mortality rates, and vaccination progress across countries and continents. The analysis includes data exploration, statistical calculations, and interactive dashboards for data-driven insights.

Key metrics analyzed:
- Death Percentage: Calculated as (total_deaths/total_cases) × 100
- Infection Rate: (total_cases/population) × 100 by country
- Vaccination Coverage: Running total of vaccinations by location
- Continental Comparisons: Death counts and statistics by continent
- Country-Specific Analysis: Focused analysis on individual countries like Nepal

## Project Structure

The project contains the following files:

- README.md - This documentation file
- .gitignore - Git ignore configuration
- LICENSE - Project license
- CovidDeaths.xlsx - Raw COVID-19 deaths data
- covid vaccinations.xlsx - Raw vaccination data
- CovidSQLQuery.sql - SQL queries for data analysis
- Covid Data .twbx - Power BI dashboard visualization

## Tools and Technologies Used

- SQL Server - Data querying and analysis using T-SQL
- Microsoft Excel - Data cleaning, exploration, and preprocessing
- Power BI - Interactive dashboards and visualizations
- Git and GitHub - Version control and collaboration

## Data Description

CovidDeaths.xlsx contains historical COVID-19 death statistics with columns like:
- continent - Geographic continent
- location - Country name
- date - Date of record
- population - Country population
- total_cases - Cumulative COVID-19 cases
- new_cases - New cases on that date
- total_deaths - Cumulative deaths
- new_deaths - New deaths on that date

covid vaccinations.xlsx contains vaccination progress data with columns including:
- continent - Geographic continent
- location - Country name
- date - Date of record
- population - Country population
- new_vaccinations - Daily new vaccinations

## SQL Analysis Queries

The CovidSQLQuery.sql file contains multiple analytical queries:

### Data Overview
Retrieve all COVID death records by continent, and list location, date, cases, and deaths information.

### Death Percentage Analysis
Calculate death percentage for each location using (total_deaths/total_cases) × 100 formula. Includes country-specific analysis such as Nepal and global aggregate statistics.

### Infection Rate Analysis
Identifies countries with the highest infection rates compared to their population:

```sql
SELECT location, population, date, 
       MAX(total_cases) as HighestInfected,
       MAX((total_cases/population)) * 100 as InfectedPercentage
GROUP BY location, population, date
ORDER BY InfectedPercentage DESC
```

### Death Count Rankings
Shows countries with the highest death counts and continental death count comparisons. Excludes international aggregates to focus on actual country-level data.

### Vaccination Analysis
Joins the deaths and vaccination tables together to calculate running vaccination totals and compute vaccination percentage as (totalVaccinations/population) × 100.

### Advanced SQL Techniques Used
- Window Functions: Running totals with SUM() OVER (PARTITION BY ... ORDER BY ...)
- CTEs: Common Table Expressions for complex queries
- Temporary Tables: Performance optimization with #PercentPopulationvaccinated
- Views: Reusable queries with PercentPopulationvaccinated view

## Power BI Dashboard

The Power BI file (Covid Data .twbx) includes interactive visualizations:

- Map Visualizations: Geographic heat maps showing infection and death rates
- Trend Charts: Time-series analysis of cases and deaths
- Regional Dashboards: Continent and country-level comparisons
- KPI Cards: Key metrics for global statistics
- Vaccination Progress: Vaccination coverage by region

Features of the dashboard:
- Interactive filters by country, continent, and date range
- Drill-down capabilities for detailed analysis
- Real-time metric updates based on data refresh

## Getting Started

Prerequisites
- SQL Server or compatible database
- Microsoft Excel
- Power BI Desktop for viewing .twbx files
- Git for version control

Setup Instructions

1. Clone the Repository

Open your terminal and run:
```bash
git clone https://github.com/Pradniu/Covid-Census-Data-Analysis-.git
cd Covid-Census-Data-Analysis-
```

2. Prepare the Data

Open CovidDeaths.xlsx and covid vaccinations.xlsx in Excel. Review data quality and structure. Check for any missing values or data inconsistencies.

3. Set Up SQL Database

Create a new database named "census" in SQL Server. Import the Excel files into SQL Server tables. Name the tables as CovidDeaths and CovidVaccinations.

4. Run SQL Queries

Open CovidSQLQuery.sql in SQL Server Management Studio. Execute queries sequentially to generate analysis tables. Export query results for Power BI integration.

5. View Power BI Dashboard

Open Covid Data .twbx in Power BI Desktop. Refresh data connections if needed. Explore the interactive visualizations and insights.

## Key Insights and Findings

Death Percentage
Global death percentage varies significantly by location and time period. Nepal-specific analysis is available in the query results showing the country's mortality trends.

Infection Rates
Countries are ranked by infection percentage relative to their population. This helps identify regions with the highest outbreak severity regardless of total population size.

Vaccination Progress
Running vaccination totals by country and date help track the vaccination rollout efficiency. The vaccination coverage percentage calculations show the percentage of the population vaccinated.

Continental Comparison
Aggregate death counts by continent identify the most affected regions. This data supports policy-level decision making at regional and international levels.

## Data Cleaning and Preparation

Steps Performed:
- Excel Data Review: Checked for duplicates, missing values, and data type consistency
- Type Conversion: Converted text numbers to proper numeric types in SQL
- Filtering: Removed international aggregates and incomplete records
- Aggregation: Grouped data by location, continent, and date for analysis

SQL Techniques Used for Cleaning:

```sql
-- Type conversion for calculations
CAST(new_deaths AS INT)
CONVERT(BIGINT, new_vaccinations)

-- Null filtering to focus on specific regions
WHERE continent IS NOT NULL
WHERE continent IS NULL

-- Window functions for running totals
SUM(CONVERT(BIGINT, new_vaccinations)) 
OVER (PARTITION BY location ORDER BY date)
```

## Query Examples

Example 1: Death Rate by Country

```sql
SELECT location, date, population, total_cases, total_deaths,
       (total_deaths/total_cases)*100 as DeathPercentage
FROM CovidDeaths
WHERE location LIKE '%nepal%'
ORDER BY location, date
```

Example 2: Top Countries by Death Count

```sql
SELECT TOP 10 location, MAX(CAST(total_deaths AS INT)) as TotalDeaths
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY TotalDeaths DESC
```

Example 3: Vaccination Coverage Percentage

```sql
SELECT continent, location, date, population, 
       (totalVaccinations/population)*100 as VaccinationPercentage
FROM PercentPopulationvaccinated
ORDER BY location, date
```

## File Formats and Sizes

| File | Type | Size | Purpose |
|------|------|------|---------|
| CovidDeaths.xlsx | Excel | 17.5 MB | Raw death statistics |
| covid vaccinations.xlsx | Excel | 23.5 MB | Raw vaccination data |
| CovidSQLQuery.sql | SQL Script | 4 KB | Analysis queries |
| Covid Data .twbx | Power BI | 4.4 MB | Interactive dashboard |

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (git checkout -b feature/improvement)
3. Commit your changes (git commit -m 'Add analysis improvement')
4. Push to the branch (git push origin feature/improvement)
5. Open a Pull Request

## License

This project is licensed under the MIT License. See the LICENSE file for details.

## Contact and Support

GitHub: Pradniu
Repository: Covid-Census-Data-Analysis-

For questions or issues, please open a GitHub Issue in the repository.

## Resources

SQL Server Documentation: https://docs.microsoft.com/en-us/sql/
Power BI Learning: https://docs.microsoft.com/en-us/power-bi/
COVID-19 Data Sources: https://covid19.who.int/

## Using This Project

To use this project, follow these steps:

1. Clone the repository
2. Review data files in Excel
3. Import data to SQL Server
4. Execute SQL queries
5. Verify results
6. Open Power BI dashboard
7. Customize visualizations as needed
8. Export insights and reports

Project Status: Active
Last Updated: June 2026
