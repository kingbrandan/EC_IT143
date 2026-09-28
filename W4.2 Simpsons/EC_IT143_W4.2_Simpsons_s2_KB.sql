-- Q: What is the total transaction amount per family?

-- A: Let's ask SQL Server and find out...

-- Step 1: Join the Family_Data table with the FBS_Viza_Costmo transaction table.
-- Step 2: Group by family ID and calculate the SUM of the transaction amounts.