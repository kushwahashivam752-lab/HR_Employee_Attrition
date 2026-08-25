CREATE SCHEMA hr;

CREATE TABLE hr.employee_attrition (
Employee INT PRIMARY KEY,
Age INT,
Gender VARCHAR(15),
Marital_Status VARCHAR (10),
Education VARCHAR (20),
Department VARCHAR (15),
Job_Role VARCHAR (25),
Job_Level VARCHAR (50),
Employment_Type VARCHAR (50),
Work_Mode VARCHAR (15),
Business_Travel VARCHAR (20),
Date_Joined DATE,
Year_At_Company NUMERIC(4,1),
Salary INT,
Bonus_Percentage NUMERIC,
Bonus_Amount INT,
Job_Satisfaction INT,
Work_Life_Balance INT,
Enviroment_Satisfaction INT ,
Relationship_satisfaction INT,
Performance_rating INT,
Engagement_score INT,
Overtime VARCHAR (10),
Remote_Days_Per_Week INT,
Weekly_Work_Hours NUMERIC(5,1),
Training_Hours INT,
Projects_Count INT,
Absent_Days INT,
Late_Arrivals INT,
Promotions INT,
Years_Since_Promotion NUMERIC(4,1),
Team_Size INT,
Commute_Minutes INT,
Income_Band VARCHAR(20),
Age_Group VARCHAR(20),
Employee_Status VARCHAR(20),
Attrition VARCHAR(5),
Exit_reason VARCHAR(30)

);

SELECT COUNT(*) FROM hr.employee_attrition ;

-- check null count
SELECT
    COUNT(*) AS total_rows,

    COUNT(*) - COUNT(Employee) AS employee_nulls,
    COUNT(*) - COUNT(Age) AS age_nulls,
    COUNT(*) - COUNT(Gender) AS gender_nulls,
    COUNT(*) - COUNT(Marital_Status) AS marital_status_nulls,
    COUNT(*) - COUNT(Education) AS education_nulls,
    COUNT(*) - COUNT(Department) AS department_nulls,
    COUNT(*) - COUNT(Job_Role) AS job_role_nulls,
    COUNT(*) - COUNT(job_Level) AS job_level_nulls,
    COUNT(*) - COUNT(Employment_Type) AS employment_type_nulls,
    COUNT(*) - COUNT(Work_Mode) AS work_mode_nulls,
    COUNT(*) - COUNT(Business_Travel) AS business_travel_nulls,
    COUNT(*) - COUNT(Date_Joined) AS date_joined_nulls,
    COUNT(*) - COUNT(Years_At_Company) AS years_at_company_nulls,
    COUNT(*) - COUNT(Salary) AS salary_nulls,
    COUNT(*) - COUNT(Bonus_Percentage) AS bonus_percentage_nulls,
    COUNT(*) - COUNT(Bonus_Amount) AS bonus_amount_nulls,
    COUNT(*) - COUNT(Job_Satisfaction) AS job_satisfaction_nulls,
    COUNT(*) - COUNT(Work_Life_Balance) AS work_life_balance_nulls,
    COUNT(*) - COUNT(Environment_Satisfaction) AS environment_satisfaction_nulls,
    COUNT(*) - COUNT(Relationship_Satisfaction) AS relationship_satisfaction_nulls,
    COUNT(*) - COUNT(Performance_Rating) AS performance_rating_nulls,
    COUNT(*) - COUNT(Engagement_Score) AS engagement_score_nulls,
    COUNT(*) - COUNT(Overtime) AS overtime_nulls,
    COUNT(*) - COUNT(Remote_Days_Per_Week) AS remote_days_per_week_nulls,
    COUNT(*) - COUNT(Weekly_Work_Hours) AS weekly_work_hours_nulls,
    COUNT(*) - COUNT(Training_Hours) AS training_hours_nulls,
    COUNT(*) - COUNT(Projects_Count) AS projects_count_nulls,
    COUNT(*) - COUNT(Absent_Days) AS absent_days_nulls,
    COUNT(*) - COUNT(Late_Arrivals) AS late_arrivals_nulls,
    COUNT(*) - COUNT(Promotions) AS promotions_nulls,
    COUNT(*) - COUNT(Years_Since_Promotion) AS years_since_promotion_nulls,
    COUNT(*) - COUNT(Team_Size) AS team_size_nulls,
    COUNT(*) - COUNT(Commute_Minutes) AS commute_minutes_nulls,
    COUNT(*) - COUNT(Income_Band) AS income_band_nulls,
    COUNT(*) - COUNT(Age_Group) AS age_group_nulls,
    COUNT(*) - COUNT(Employee_Status) AS employee_status_nulls,
    COUNT(*) - COUNT(Attrition) AS attrition_nulls,
    COUNT(*) - COUNT(Exit_Reason) AS exit_reason_nulls

FROM hr.employee_attrition;

-- duplicate employee ids
SELECT Employee,
COUNT(*) AS duplicate_count
FROM hr.employee_attrition
GROUP BY Employee
HAVING COUNT (*) >1 ;

-- duplicate complete rows
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT (
        Employee,
        Age,
        Gender,
        Marital_Status,
        Education,
        Department,
        Job_Role,
        Job_Level,
        Employment_Type,
        Work_Mode,
        Business_Travel,
        Date_Joined,
        Year_At_Company,
        Salary,
        Bonus_Percentage,
        Bonus_Amount,
        Job_Satisfaction,
        Work_Life_Balance,
        Enviroment_Satisfaction,
        Relationship_Satisfaction,
        Performance_Rating,
        Engagement_Score,
        Overtime,
        Remote_Days_Per_Week,
        Weekly_Work_Hours,
        Training_Hours,
        Projects_Count,
        Absent_Days,
        Late_Arrivals,
        Promotions,
        Years_Since_Promotion,
        Team_Size,
        Commute_Minutes,
        Income_Band,
        Age_Group,
        Employee_Status,
        Attrition,
        Exit_Reason
    )) AS unique_rows
FROM hr.employee_attrition;

-- values check
SELECT Department, COUNT(*) AS Employee
FROM hr.employee_attrition
GROUP BY Department
ORDER BY Employee DESC ;

-- job level
SELECT Job_Level,
COUNT(*) AS Employee
FROM hr.employee_attrition
GROUP BY Job_Level
ORDER BY Employee DESC ;

-- work mode
SELECT Work_Mode,
COUNT(*) AS Employee
FROM hr.employee_attrition
GROUP BY Work_Mode ;

-- Attrition
SELECT Attrition,
COUNT(*) AS Employee
FROM hr.employee_attrition
GROUP BY Attrition ;

-- overtime
SELECT Overtime,
COUNT(*) AS Employee
FROM hr.employee_attrition
GROUP BY Overtime ;

-- Age
SELECT
MIN(Age) AS min_age,
MAX(Age) AS max_age,
AVG(Age) AS avg_age
FROM hr.employee_attrition ;

-- salary
SELECT
MIN(Salary) AS min_salary,
MAX(Salary) AS max_salary,
ROUND(AVG(Salary),2) AS avg_salary
FROM hr.employee_attrition ;

-- satisfaction score
SELECT
MIN(Job_Satisfaction) AS min_job_satisfaction,
MAX(Job_Satisfaction) AS max_job_satisfaction,
MIN(Work_Life_Balance) AS min_work_life_satisfaction,
MAX(Work_Life_Balance) AS max_work_life_satisfaction,
MIN(Enviroment_Satisfaction) AS min_enviroment_satisfaction,
MAX(Enviroment_Satisfaction) AS max_satisfaction,
MIN(Relationship_Satisfaction) AS min_relationship_satisfaction,
MAX(Relationship_Satisfaction) AS max_relationship_satisfaction
FROM hr.employee_attrition ;


-- performance ration
SELECT
MIN(performance_rating) AS min_performance_rating,
MAX(performance_rating) AS max_performance_rating
FROM hr.employee_attrition ;

-- engagement score
SELECT
MIN(engagement_score) AS min_engagement_score,
MAX(engagement_score) AS max_engagement_score,
ROUND(AVG(engagement_score),2) AS avg_engagement_score
FROM hr.employee_attrition ;

-- attrition employee
SELECT * FROM hr.employee_attrition
WHERE
	(attrition = 'Yes' AND employee_status <> 'Exited' )
	OR
	(attrition = 'No' AND employee_status <> 'Active') ;

-- exit reason
SELECT * FROM hr.employee_attrition
WHERE
	attrition = 'No'
	AND exit_reason <> 'not_applicable' ;


-- overtime
SELECT overtime, COUNT(*)
FROM hr.employee_attrition
GROUP BY overtime ;
	

-- remote days
SELECT * FROM hr.employee_attrition
WHERE
	(work_mode = 'on-site'AND remote_days_per_week <>0)
	OR
	(work_mode = 'Remote' AND remote_days_per_week < 4) ; 

-- satisfaction range validation
SELECT * FROM hr.employee_attrition
WHERE
	job_satisfaction NOT BETWEEN 1 AND 5
	OR work_life_balance NOT BETWEEN 1 AND 5
	OR enviroment_satisfaction NOT BETWEEN 1 AND 5
	OR relationship_satisfaction NOT BETWEEN 1 AND 5 ;


-- performance validation
SELECT * FROM hr.employee_attrition
WHERE performance_rating NOT BETWEEN 1 AND 5 ;

-- engagement
SELECT * FROM hr.employee_attrition
WHERE engagement_score NOT BETWEEN 0 AND 100 ;

-- salary validation
SELECT * FROM hr.employee_attrition
WHERE salary <= 0 ;

-- work hour validation
SELECT  
MIN(weekly_work_hours) AS min_weekly_work_hours,
MAX(weekly_work_hours) AS max_weekly_work_hours
FROM hr.employee_attrition ;

-- abnormal records
SELECT *
FROM hr.employee_attrition
WHERE weekly_work_hours < 30
   OR weekly_work_hours > 65;

-- date validation
SELECT *
FROM hr.employee_attrition
WHERE date_joined > DATE '2026-01-01';

-- tenuar validation
SELECT *
FROM hr.employee_attrition
WHERE year_at_company < 0;

-- total employees
SELECT COUNT(*) AS total_employees
FROM hr.employee_attrition ;

-- total attrition
SELECT COUNT(*) FILTER (WHERE attrition = 'Yes') AS total_attrition
FROM hr.employee_attrition ;

-- attrition rate
SELECT
	ROUND(
	COUNT(*) FILTER (WHERE attrition ='Yes') * 100.0
	/ COUNT (*),
	2
	) AS attrition_rate
FROM hr.employee_attrition ;	

-- average salary
SELECT 
	ROUND(AVG(salary),2) AS avg_salary
FROM hr.employee_attrition ;	


-- average employee tenuar
SELECT
	ROUND(AVG(year_at_company),2) AS avg_tenuar
FROM hr.employee_attrition ;	

-- avg engagement score
SELECT 
	ROUND(AVG(engagement_score),2) AS avg_engagement_score
FROM hr.employee_attrition ;	


-- which department employees leave large
SELECT 
	department,
	COUNT(*) AS total_employees,
	COUNT(*) FILTER (WHERE attrition = 'Yes') AS attrition_count,
	ROUND (
	COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
	/ COUNT(*),
	2
	) AS attrition_rate
FROM hr.employee_attrition
GROUP BY department
ORDER BY attrition_rate DESC;

-- job role attritution
SELECT 
	job_role,
	COUNT(*) AS total_employees,
	COUNT(*) FILTER (WHERE attrition ='Yes') AS attrition_count,
	ROUND(
	COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
	/COUNT(*),
	2
	) AS attrition_rate
FROM hr.employee_attrition	
GROUP BY job_role
ORDER BY attrition_rate DESC;

-- gender by attrition
SELECT
	gender,
	COUNT(*) AS total_employees,
	COUNT(*) FILTER (WHERE attrition = 'Yes') AS attrition_count,
	ROUND(
	COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
	/ COUNT(*),
	2
	) AS attrition_rate
FROM hr.employee_attrition
GROUP BY gender
ORDER BY attrition_rate DESC ;

-- overtime impact
SELECT
	overtime,
	COUNT(*) AS total_employees,
	COUNT(*) FILTER(WHERE attrition = 'Yes') AS attrition_count,
	ROUND(
	COUNT(*) FILTER(WHERE attrition = 'Yes') * 100.0
	/COUNT(*),
	2
	) AS attrition_rate
FROM hr.employee_attrition
GROUP BY overtime
ORDER BY attrition_rate DESC ;

-- job satisfaction vs attrition
SELECT
	job_satisfaction,
	COUNT(*) AS total_employees,
	COUNT(*) FILTER(WHERE attrition = 'Yes') AS attrition_count,
	ROUND(
	COUNT(*) FILTER(WHERE attrition = 'Yes') * 100.0
	/COUNT(*),
	2
	) AS attrition_rate
FROM hr.employee_attrition
GROUP BY job_satisfaction
ORDER BY attrition_rate DESC ;




-- age group attrition
SELECT
	age_group,
	COUNT(*) AS total_employees,
	COUNT(*) FILTER(WHERE attrition = 'Yes') AS attrition_COUNT,
	ROUND(
	COUNT(*) FILTER(WHERE attrition = 'Yes') * 100.0
	/COUNT (*),
	2
	) AS attrition_rate
FROM hr.employee_attrition
GROUP BY age_group
ORDER BY attrition_rate DESC ;

-- salary attrition
SELECT
	CASE
	WHEN salary < 40000 THEN 'Low Salary'
	WHEN salary < 70000 THEN 'Medium Salary'
	WHEN salary <100000 THEN 'High Salary'
	ELSE 'Very High Salary'
	END AS salary_band,

	COUNT(*) AS total_employees,
	COUNT(*) FILTER (WHERE attrition = 'Yes') AS attrition_count,
	ROUND(
	COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0
	/ COUNT(*),
	2
	) AS attrition_rate
FROM hr.employee_attrition

GROUP BY salary_band
ORDER BY attrition_rate DESC;


-- years at company vs attrition
SELECT
	CASE
		WHEN year_at_company < 2 THEN '0-1 year'
		WHEN year_at_company < 5 THEN '2-4 year'
		WHEN year_at_company < 10 THEN '5-9 year'
		WHEN year_at_company < 15 THEN '10-14 year'
		ELSE '15+year'
	END AS tenure_band,

	COUNT(*) AS total_employees,
	COUNT(*) FILTER(WHERE attrition = 'Yes') AS attrition_count,
	ROUND(
	COUNT(*) FILTER(WHERE attrition = 'Yes') * 100.0
	/ COUNT(*)
	) AS attrition_rate
FROM hr.employee_attrition
GROUP BY tenure_band
ORDER BY attrition_rate DESC ;
	
-- promotion vs attrition
SELECT
	CASE
		WHEN promotions < 0 THEN 'No promotion'
		WHEN promotions < 1 THEN '1 promotion'
		ELSE '2+ promotion'
		END AS promotion_group,

	COUNT(*) AS total_employees,
	COUNT(*) FILTER (WHERE attrition = 'Yes') AS attrition_count,
	ROUND(
		COUNT(*) FILTER(WHERE attrition = 'Yes') * 100.0
	/COUNT(*),
	2
	) AS attrition_rate
FROM hr.employee_attrition
GROUP BY promotions
ORDER BY attrition_rate DESC;


-- work life balance vs attrition
SELECT
	work_life_balance,
	COUNT(*) AS total_employees,
	COUNT(*) FILTER(WHERE attrition = 'Yes') AS attrition_count,
	ROUND(
	COUNT(*) FILTER(WHERE attrition = 'Yes') * 100.0
	/COUNT(*),
	2
	) AS attrition_rate
FROM hr.employee_attrition
GROUP BY work_life_balance
ORDER BY attrition_rate DESC ;

-- high risq employee segment
SELECT
    COUNT(*) AS high_risk_employees,
    COUNT(*) FILTER ( WHERE attrition = 'Yes') AS high_risk_attrition,
    ROUND(
        COUNT(*) FILTER ( WHERE attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS high_risk_attrition_rate
FROM hr.employee_attrition
WHERE
    job_satisfaction <= 2
    AND overtime = 'Yes'
    AND salary < 40000
    AND promotions = 0;	


-- high risk employee with department	
SELECT
	department,
	COUNT(*) AS high_risk_employees,
	COUNT(*) FILTER(WHERE attrition = 'Yes')AS attrition_count,
	ROUND(
		COUNT(*) FILTER(WHERE attrition = 'Yes') * 100.0
		/ COUNT(*),
		2
	) AS attrition_rate
FROM hr.employee_attrition
WHERE 
	job_satisfaction <= 2
	AND overtime = 'Yes'
	AND salary < 40000
	AND promotions = 0
GROUP BY department
ORDER BY attrition_rate DESC ;


-- high risk employees in job roles
SELECT
	job_role,
	COUNT(*) AS high_risk_employees,
	COUNT(*) FILTER(WHERE attrition = 'Yes') AS attrition_count,
	ROUND(
		COUNT(*) FILTER(WHERE attrition = 'Yes') * 100.0
		/COUNT(*),
		2
	) AS attrition_rate

FROM hr.employee_attrition
WHERE 
	job_satisfaction <= 2
	AND overtime = 'Yes'
	AND salary < 40000
	AND promotions = 0
GROUP BY job_role
ORDER BY attrition_rate DESC ;


-- risk category for all employees
SELECT
	risk_level,
	COUNT(*) AS employee_count,
	COUNT(*) FILTER(WHERE attrition = 'Yes') AS attrition_count,
	ROUND(
		COUNT(*) FILTER(WHERE attrition = 'Yes') * 100.0
		/COUNT(*),
		2
	) AS attrition_rate
FROM (
	SELECT
		attrition, 
	CASE
		WHEN
			(CASE WHEN job_satisfaction <= 2 THEN 1 ELSE 0 END)
		  + (CASE WHEN overtime = 'Yes' THEN 1 ELSE 0 END)
		  + (CASE WHEN salary < 40000 THEN 1 ELSE 0 END)
		  + (CASE WHEN promotions = 0 THEN 1 ELSE 0 END)
		  >= 3
		  THEN 'high_risk'
		  WHEN
			  (CASE WHEN job_satisfaction <=2 THEN 1 ELSE 0 END)
		    + (CASE WHEN overtime = 'Yes' THEN 1 ELSE 0 END)
		    + (CASE WHEN salary < 40000 THEN 1 ELSE 0 END)
		    + (CASE WHEN promotions = 0 THEN 1 ELSE 0 END)
		    = 2
		  THEN 'medium_risk'

		  ELSE 'low_risk'
		END AS risk_level

FROM hr.employee_attrition
) AS risk_data
GROUP BY risk_level
ORDER BY 
	CASE risk_level
		WHEN 'high_risk' THEN 1
		WHEN 'medium_risk' THEN 2
		WHEN 'low_risk' THEN 3
	END ;	
	
-- top 10 high risk job role
SELECT
	job_role,
	COUNT(*) AS total_employees,
	COUNT(*) FILTER (WHERE attrition = 'Yes') AS attrition_count,
	ROUND(
	COUNT(*) FILTER(WHERE attrition = 'Yes') * 100.0
	/ COUNT(*),
	2
	) AS attrition_rate
FROM hr.employee_attrition	
WHERE 
	job_satisfaction <= 2
	AND overtime = 'Yes'
GROUP BY job_role
HAVING COUNT(*) >= 100
ORDER BY attrition_rate DESC
LIMIT 10 ;

		  
-- depatment ranking
WITH department_analysis AS (                                                 
	SELECT
		department,
		COUNT(*) AS total_employees,
		COUNT(*) FILTER(WHERE attrition = 'Yes') AS attrition_count,
		ROUND(
			COUNT(*) FILTER(WHERE attrition = 'Yes') * 100.0
			/COUNT(*),
			2
		) AS attrition_rate
	FROM hr.employee_attrition
	GROUP BY department
)
SELECT
	department,
	total_employees,
	attrition_count,
	attrition_rate,
	RANK() OVER(
			ORDER BY attrition_rate DESC
	) AS attrition_rank 

FROM department_analysis
ORDER BY attrition_rank ;


-- job role ranking
WITH role_analysis AS (                                                     

	SELECT
		job_role,
		COUNT(*) AS total_employees,
		COUNT(*) FILTER(WHERE attrition = 'Yes') AS attrition_count,
		ROUND(
			COUNT(*) FILTER(WHERE attrition = 'Yes') * 100.0
			/ COUNT(*),
			2
		) AS attrition_rate
	FROM hr.employee_attrition
	GROUP BY job_role
)
SELECT 
	job_role,
	total_employees,
	attrition_count,
	attrition_rate,
	RANK() OVER (
		ORDER BY attrition_rate DESC
	) AS attrition_rank

FROM role_analysis
ORDER BY attrition_rank ;


-- department buys job ranking
WITH role_analysis AS (
	SELECT 
		department,
		job_role,
		COUNT(*) AS total_employees,
		COUNT(*) FILTER(WHERE attrition = 'Yes') AS attrition_count,
		ROUND(
			COUNT(*) FILTER(WHERE attrition = 'Yes') * 100.0
			/COUNT(*),
			2	
		) AS attrition_rate
	FROM hr.employee_attrition
	GROUP BY department, job_role
),
ranked_roles AS (
		SELECT *,
			RANK() OVER(
					PARTITION BY department
					ORDER BY attrition_rate DESC
			) AS role_rank
		FROM role_analysis	
)

SELECT * FROM ranked_roles
WHERE role_rank = 1
ORDER BY attrition_rate DESC ;


-- salary band ranking
WITH salary_analysis AS (
	SELECT
		CASE
			WHEN salary < 40000 THEN 'Low Salary'
            WHEN salary < 70000 THEN 'Medium Salary'
            WHEN salary < 100000 THEN 'High Salary'
            ELSE 'Very High Salary'
        END AS salary_band,
		COUNT(*) AS total_employees,
		COUNT(*) FILTER(WHERE attrition = 'Yes') AS attrition_count,
		ROUND(
			COUNT(*) FILTER(WHERE attrition = 'Yes') * 100.0
			/COUNT(*),
			2
		) AS attrition_rate
	FROM hr.employee_attrition
	GROUP BY 
		CASE
		    WHEN salary < 40000 THEN 'Low Salary'
        	WHEN salary < 70000 THEN 'Medium Salary'
            WHEN salary < 100000 THEN 'High Salary'
            ELSE 'Very High Salary'
            END 
) 

SELECT *,
RANK() OVER(
	ORDER BY attrition_rate DESC 
) AS salary_risk_rank
FROM salary_analysis
ORDER BY salary_risk_rank ;


-- attrition percentage by department
SELECT 
	department,
	COUNT(*) AS total_employees,
	COUNT(*) FILTER(WHERE attrition = 'Yes') AS attrition_count,
	ROUND(
		COUNT(*) FILTER(WHERE attrition = 'Yes') * 100.0
		/COUNT(*),
		2
	) AS attrition_rate,

	ROUND(
	COUNT(*) * 100.0
	/ SUM(COUNT(*)) OVER () ,
	2
	) AS employee_share_parcentage

FROM hr.employee_attrition
GROUP BY department
ORDER BY employee_share_parcentage DESC ;

-- top 20 highest risk employee
SELECT
    employee,
    department,
    job_role,
    salary,
    job_satisfaction,
    work_life_balance,
    overtime,
    promotions,
    engagement_score,
    attrition,
    (
        CASE WHEN job_satisfaction <= 2 THEN 2 ELSE 0 END
       + CASE WHEN overtime = 'Yes' THEN 2 ELSE 0 END
       + CASE WHEN salary < 40000 THEN 2 ELSE 0 END
       + CASE WHEN promotions = 0 THEN 1 ELSE 0 END
       + CASE WHEN work_life_balance <= 2 THEN 2 ELSE 0 END
       + CASE WHEN engagement_score < 50 THEN 1 ELSE 0 END
    ) AS risk_score

FROM hr.employee_attrition

ORDER BY risk_score DESC
LIMIT 20;


-- hr kpi summary
SELECT
    COUNT(*) AS total_employees,
    COUNT(*) FILTER(WHERE attrition = 'Yes') AS total_attrition,
    ROUND(
        COUNT(*) FILTER(WHERE attrition = 'Yes') * 100.0 
		/ COUNT(*),
        2
    ) AS attrition_rate,

    ROUND(AVG(age), 2) AS avg_age,
    ROUND(AVG(salary), 2) AS avg_salary,
    ROUND(AVG(year_at_company), 2) AS avg_tenure,
    ROUND(AVG(job_satisfaction), 2) AS avg_job_satisfaction,
    ROUND(AVG(work_life_balance), 2) AS avg_work_life_balance,
    ROUND(AVG(engagement_score), 2) AS avg_engagement_score
FROM hr.employee_attrition;


-- attrition drivers summery
SELECT
    'Overtime' AS factor,
    overtime AS category,
    COUNT(*) AS employees,

    COUNT(*) FILTER(WHERE attrition = 'Yes') AS attrition_count,
    ROUND(
        COUNT(*) FILTER(WHERE attrition = 'Yes') * 100.0 
		/ COUNT(*),
        2
    ) AS attrition_rate

FROM hr.employee_attrition
GROUP BY overtime

UNION ALL

SELECT
    'Job Satisfaction' AS factor,
    job_satisfaction::text AS category,
    COUNT(*) AS employees,
    COUNT(*) FILTER(WHERE attrition = 'Yes') AS attrition_count,
    ROUND(
        COUNT(*) FILTER(WHERE attrition = 'Yes') * 100.0 
		/ COUNT(*),
        2
    ) AS attrition_rate

FROM hr.employee_attrition
GROUP BY job_satisfaction

UNION ALL

SELECT
    'Work Life Balance' AS factor,
    work_life_balance::text AS category,
    COUNT(*) AS employees,
    COUNT(*) FILTER(WHERE attrition = 'Yes') AS attrition_count,
    ROUND(
        COUNT(*) FILTER(WHERE attrition = 'Yes') * 100.0 
		/ COUNT(*),
        2
    ) AS attrition_rate

FROM hr.employee_attrition
GROUP BY work_life_balance
ORDER BY attrition_rate DESC;


-- top 10 high risk employees
WITH employee_risk AS (

    SELECT
        employee,
        department,
        job_role,
        salary,
        job_satisfaction,
        work_life_balance,
        overtime,
        promotions,
        engagement_score,
        attrition,

        (
           + CASE WHEN job_satisfaction <= 2 THEN 2 ELSE 0 END
           + CASE WHEN overtime = 'Yes' THEN 2 ELSE 0 END
           + CASE WHEN salary < 40000 THEN 2 ELSE 0 END
           + CASE WHEN promotions = 0 THEN 1 ELSE 0 END
           + CASE WHEN work_life_balance <= 2 THEN 2 ELSE 0 END
           + CASE WHEN engagement_score < 50 THEN 1 ELSE 0 END
        ) AS risk_score
    FROM hr.employee_attrition
)

SELECT
    *,
    CASE
        WHEN risk_score >= 8 THEN 'High Risk'
        WHEN risk_score >= 5 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_level
FROM employee_risk
ORDER BY risk_score DESC
LIMIT 10;


















