use FootballDB

/* 
======================================================
   PART 1: Exploratory Data Analysis (Raw Queries)
======================================================
*/


-- 1. Top 5 Tournaments by match count
select Top 5 tournament ,
COUNT(*) as total_matches
from matches 
group by (tournament)
order by  total_matches desc;

-- 2. Total goals for Egypt (Using CTE and UNION ALL)

with Egyptgoals as(
	
	select home_score as goals
	from matches
	where home_team = 'Egypt'

	union all
	select away_score as goals
	from matches
	where away_team = 'Egypt'
)
select sum(goals) As total_goals
from Egyptgoals

-- 3. Find the match with the highest total goals for each year (Using Window Functions)
WITH RankedMatches AS (
    SELECT 
        year,
        home_team,
        away_team,
        (home_score + away_score) AS total_goals,
        ROW_NUMBER() OVER (PARTITION BY year ORDER BY (home_score + away_score) DESC) AS row_num
    FROM 
        matches
)
SELECT 
    year,
    home_team,
    away_team,
    total_goals
FROM 
    RankedMatches
WHERE 
    row_num = 1
ORDER BY 
    year DESC;


/* 
======================================================
   PART 2: Automation & Stored Procedures
======================================================
*/

-- 1. Procedure to get total goals for ANY given team
Go
CREATE PROCEDURE GetTeamTotalGoals
    @TeamName NVARCHAR(100)
AS
BEGIN
    WITH TeamGoals AS (
        SELECT home_score AS goals
        FROM matches
        WHERE home_team = @TeamName

        UNION ALL
        
        SELECT away_score AS goals
        FROM matches
        WHERE away_team = @TeamName
    )
    SELECT 
        @TeamName AS Team, 
        SUM(goals) AS Total_Goals
    FROM TeamGoals;
END;
GO

EXEC GetTeamTotalGoals @TeamName = 'Egypt';



-- 2. Procedure to find the highest-scoring match for a specific year
Go 
CREATE PROCEDURE get_total_goals
    @Year int
as
begin
WITH RankedMatches AS (
    SELECT 
        year,
        home_team,
        away_team,
        (home_score + away_score) AS total_goals,
        ROW_NUMBER() OVER (ORDER BY (home_score + away_score) DESC) AS row_num
    FROM 
        matches
	where 
		year = @Year
)
SELECT 
    @Year as year,
    home_team,
    away_team,
    total_goals
FROM 
    RankedMatches
WHERE 
    row_num = 1
ORDER BY 
    year DESC;
end
go


exec get_total_goals @year = 2018