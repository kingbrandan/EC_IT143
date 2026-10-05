/*****************************************************************************************************************
NAME:    EC_IT143_W5.2_MyFC_KBM.sql
DESCR:   Deliverable 5.2 - MyFC Community Analysis (4 Questions & Answers)
AUTHOR:  King Brandan Mthimunye
DATE:    2026-10-05
******************************************************************************************************************/

-- Q1 (Self-Authored): How many players are on each team?
-- Author: King Brandan Mthimunye
-- A1: Count the total number of players grouped by team name.
SELECT t.team_name, COUNT(p.pl_id) AS total_players
FROM dbo.tblPlayerDim p
JOIN dbo.tblTeamDim t ON p.pl_team_id = t.team_id
GROUP BY t.team_name;

-- Q2 (Self-Authored): What is the total monthly salary expense for each team?
-- Author: King Brandan Mthimunye
-- A2: Sum the monthly salary (mtd_salary) joined across player dimension and team dimension.
SELECT t.team_name, SUM(f.mtd_salary) AS total_monthly_salary
FROM dbo.tblPlayerFact f
JOIN dbo.tblPlayerDim p ON f.pl_id = p.pl_id
JOIN dbo.tblTeamDim t ON p.pl_team_id = t.team_id
GROUP BY t.team_name;

-- Q3 (Peer-Authored): How many players play each position?
-- Author: KWIZERA HUBERT SAGE
-- A3: Group player records by position to get the head count per position.
SELECT pl_position, COUNT(pl_id) AS player_count
FROM dbo.tblPlayerDim
GROUP BY pl_position;

-- Q4 (Peer-Authored): What is the total salary per player across the dataset?
-- Author: Manu Owusu
-- A4: Aggregate total salary records by player ID and name.
SELECT p.pl_id, p.pl_name, SUM(f.mtd_salary) AS total_accumulated_salary
FROM dbo.tblPlayerDim p
JOIN dbo.tblPlayerFact f ON p.pl_id = f.pl_id
GROUP BY p.pl_id, p.pl_name;