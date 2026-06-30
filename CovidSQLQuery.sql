-- COVID-19 Data Analysis SQL Queries
-- Database: census
-- Tables: CovidDeaths, CovidVaccinations

-- Query 1: Get All Death Records by Continent
SELECT *
FROM [census]..CovidDeaths
WHERE continent IS NOT NULL
ORDER BY location, date

-- Query 2: Basic Data Overview
SELECT location, date, total_cases, new_cases, total_deaths, population 
FROM [census]..CovidDeaths
ORDER BY location, date

-- Query 3: Death Percentage for Nepal
SELECT location, date, population, total_cases, total_deaths, 
       (total_deaths/total_cases)*100 as DeathPercentage
FROM [census]..CovidDeaths
WHERE location LIKE '%nepal%' AND total_cases > 0
ORDER BY location, date

-- Query 4: Global Death Statistics
SELECT SUM(new_cases) as totalCases, 
       SUM(CAST(new_deaths AS BIGINT)) as totalDeaths,
       SUM(CAST(new_deaths AS BIGINT))/SUM(new_cases)*100 as DeathPercentage
FROM [census]..CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 1, 2

-- Query 5: Highest Infection Rates by Country
SELECT location, population, date, MAX(total_cases) as HighestInfected,
       MAX((total_cases/population))*100 as InfectedPercentage
FROM [census]..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location, population, date
ORDER BY InfectedPercentage DESC

-- Query 6: Countries with Highest Death Count
SELECT location, MAX(CAST(total_deaths AS BIGINT)) as TotalDeaths
FROM [census]..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY TotalDeaths DESC

-- Query 7: Continents with Highest Death Count
SELECT location, SUM(CAST(new_deaths AS BIGINT)) as TotalDeathCount
FROM [census]..CovidDeaths
WHERE continent IS NULL
AND location NOT IN ('World', 'European Union', 'International')
GROUP BY location
ORDER BY TotalDeathCount DESC

-- Query 8: Joining Deaths and Vaccinations Tables with Running Vaccination Total
SELECT DEA.continent, DEA.location, DEA.date, DEA.population, 
       DEA.new_vaccinations,
       SUM(CONVERT(BIGINT, VAC.new_vaccinations)) 
       OVER (PARTITION BY DEA.location ORDER BY DEA.date) as RunningTotalVaccinations
FROM [census]..CovidDeaths as DEA
JOIN [census]..CovidVaccinations as VAC
ON DEA.location = VAC.location AND DEA.date = VAC.date
WHERE DEA.continent IS NOT NULL
ORDER BY DEA.location, DEA.date

-- Query 9: CTE - Population vs Vaccination Data
WITH PopvsVac AS (
    SELECT DEA.continent, DEA.location, DEA.date, DEA.population, 
           VAC.new_vaccinations,
           SUM(CONVERT(BIGINT, VAC.new_vaccinations)) 
           OVER (PARTITION BY DEA.location ORDER BY DEA.date) as RunningTotalVaccinations
    FROM [census]..CovidDeaths as DEA
    JOIN [census]..CovidVaccinations as VAC
    ON DEA.location = VAC.location AND DEA.date = VAC.date
    WHERE DEA.continent IS NOT NULL
)
SELECT * FROM PopvsVac

-- Query 10: Temporary Table - Vaccination Percentage by Population
DROP TABLE IF EXISTS #PercentPopulationVaccinated

CREATE TABLE #PercentPopulationVaccinated (
    Continent NVARCHAR(255),
    Location NVARCHAR(255),
    Date DATETIME,
    Population NUMERIC,
    NewVaccinations NUMERIC,
    RunningTotalVaccinations NUMERIC
)

INSERT INTO #PercentPopulationVaccinated
SELECT DEA.continent, DEA.location, DEA.date, DEA.population, 
       VAC.new_vaccinations,
       SUM(CONVERT(BIGINT, VAC.new_vaccinations)) 
       OVER (PARTITION BY DEA.location ORDER BY DEA.date) as RunningTotalVaccinations
FROM [census]..CovidDeaths as DEA
JOIN [census]..CovidVaccinations as VAC
ON DEA.location = VAC.location AND DEA.date = VAC.date
WHERE DEA.continent IS NOT NULL

-- Show results with vaccination percentage
SELECT *, 
       CASE 
           WHEN Population > 0 THEN (RunningTotalVaccinations/Population)*100 
           ELSE 0 
       END as VaccinationPercentage
FROM #PercentPopulationVaccinated
ORDER BY Location, Date

-- Query 11: Create View - Vaccination Percentage
DROP VIEW IF EXISTS vw_PercentPopulationVaccinated

CREATE VIEW vw_PercentPopulationVaccinated AS 
SELECT DEA.continent, DEA.location, DEA.date, DEA.population, 
       VAC.new_vaccinations,
       SUM(CONVERT(BIGINT, VAC.new_vaccinations)) 
       OVER (PARTITION BY DEA.location ORDER BY DEA.date) as RunningTotalVaccinations,
       CASE 
           WHEN DEA.population > 0 THEN (SUM(CONVERT(BIGINT, VAC.new_vaccinations)) 
                OVER (PARTITION BY DEA.location ORDER BY DEA.date) / DEA.population) * 100
           ELSE 0 
       END as VaccinationPercentage
FROM [census]..CovidDeaths as DEA
JOIN [census]..CovidVaccinations as VAC
ON DEA.location = VAC.location AND DEA.date = VAC.date
WHERE DEA.continent IS NOT NULL
