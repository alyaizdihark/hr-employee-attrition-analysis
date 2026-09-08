CREATE DATABASE employee;
SELECT * FROM employee;

-- DATA CLEANSING & DATA PREPARATION
-- 1. Data type check
DESCRIBE employee;

-- 2. Duplicate check
SELECT EmployeeNumber, 
	COUNT(*) AS total_duplicate
FROM employee
GROUP BY EmployeeNumber
HAVING total_duplicate > 1;

-- 3. Missing values check
   SELECT
    SUM(Age IS NULL) AS Age,
    SUM(Attrition IS NULL) AS Attrition,
    SUM(BusinessTravel IS NULL) AS BusinessTravel,
    SUM(DailyRate IS NULL) AS DailyRate,
    SUM(Department IS NULL) AS Department,
    SUM(DistanceFromHome IS NULL) AS DistanceFromHome,
    SUM(Education IS NULL) AS Education,
    SUM(EducationField IS NULL) AS EducationField,
    SUM(EmployeeCount IS NULL) AS EmployeeCount,
    SUM(EmployeeNumber IS NULL) AS EmployeeNumber,
    SUM(EnvironmentSatisfaction IS NULL) AS EnvironmentSatisfaction,
    SUM(Gender IS NULL) AS Gender,
    SUM(HourlyRate IS NULL) AS HourlyRate,
    SUM(JobInvolvement IS NULL) AS JobInvolvement,
    SUM(JobLevel IS NULL) AS JobLevel,
    SUM(JobRole IS NULL) AS JobRole,
    SUM(JobSatisfaction IS NULL) AS JobSatisfaction,
    SUM(MaritalStatus IS NULL) AS MaritalStatus,
    SUM(MonthlyIncome IS NULL) AS MonthlyIncome,
    SUM(MonthlyRate IS NULL) AS MonthlyRate,
    SUM(NumCompaniesWorked IS NULL) AS NumCompaniesWorked,
    SUM(Over18 IS NULL) AS Over18,
    SUM(OverTime IS NULL) AS OverTime,
    SUM(PercentSalaryHike IS NULL) AS PercentSalaryHike,
    SUM(PerformanceRating IS NULL) AS PerformanceRating,
    SUM(RelationshipSatisfaction IS NULL) AS RelationshipSatisfaction,
    SUM(StandardHours IS NULL) AS StandardHours,
    SUM(StockOptionLevel IS NULL) AS StockOptionLevel,
    SUM(TotalWorkingYears IS NULL) AS TotalWorkingYears,
    SUM(TrainingTimesLastYear IS NULL) AS TrainingTimesLastYear,
    SUM(WorkLifeBalance IS NULL) AS WorkLifeBalance,
    SUM(YearsAtCompany IS NULL) AS YearsAtCompany,
    SUM(YearsInCurrentRole IS NULL) AS YearsInCurrentRole,
    SUM(YearsSinceLastPromotion IS NULL) AS YearsSinceLastPromotion,
    SUM(YearsWithCurrManager IS NULL) AS YearsWithCurrManager
FROM employee;

-- KPIs
-- Total Employees
SELECT COUNT(*) AS TotalEmployees
FROM employee;
-- Active Employees
SELECT COUNT(*) AS ActiveEmployees
FROM employee
WHERE Attrition = 'No';
-- Employees Left
SELECT COUNT(*) AS EmployeesLeft
FROM employee
WHERE Attrition = 'Yes';
-- Attrition Rate
SELECT ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)/COUNT(*))*100,2) AS AttritionRate
FROM employee;


-- Business Question
-- 1. Which gender has the highest number of employees left? 
SELECT Gender,
	COUNT(*) AS EmployeeLeft
FROM employee
WHERE Attrition = 'Yes'
GROUP BY Gender
ORDER BY EmployeeLeft DESC;

-- 2. Which age group has the highest number of employees left? 
SELECT
	CASE WHEN Age BETWEEN 18 AND 25 THEN '18-25'
		WHEN Age BETWEEN 26 AND 35 THEN '26-35'
		WHEN Age BETWEEN 36 AND 45 THEN '36-45'
		ELSE '46+'
	END AS AgeGroup,
	COUNT(*) AS EmployeeLeft
FROM employee
WHERE Attrition = 'Yes'
GROUP BY AgeGroup
ORDER BY EmployeeLeft DESC;

-- 3. Which job roles have the highest number of employees left? 
SELECT JobRole, 
	COUNT(*) AS EmployeeLeft
FROM employee
WHERE Attrition = 'Yes'
GROUP BY JobRole
ORDER BY EmployeeLeft DESC;

-- 4. Do employees who work overtime account for more employees left? 
SELECT OverTime, 
	COUNT(*) AS EmployeeLeft
FROM employee
WHERE Attrition = 'Yes'
GROUP BY OverTime
ORDER BY EmployeeLeft DESC;

-- 5. Which monthly income group has the highest number of employees left?
SELECT
	CASE
        WHEN MonthlyIncome < 3000 THEN '< $3K'
        WHEN MonthlyIncome <= 5000 THEN '$3K-$5K'
        WHEN MonthlyIncome <= 8000 THEN '$5K-$8K'
        ELSE '> $8K'
    END AS MonthlyIncomeGroup,
	COUNT(*) AS EmployeeLeft
FROM employee
WHERE Attrition = 'Yes'
GROUP BY MonthlyIncomeGroup
ORDER BY EmployeeLeft DESC;
 
-- 6. At what tenure stage do most employees leave?
SELECT
	CASE
        WHEN YearsAtCompany <= 2 THEN '0-2 years'
        WHEN YearsAtCompany <= 5 THEN '3-5 years'
        WHEN YearsAtCompany <= 10 THEN '6-10 years'
        ELSE '11+ years'
    END AS TenureGroup,
	COUNT(*) AS EmployeeLeft
FROM employee
WHERE Attrition = 'Yes'
GROUP BY TenureGroup
ORDER BY EmployeeLeft DESC;