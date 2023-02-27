WITH cte AS (
  SELECT 1 AS n
  UNION ALL
  SELECT n + 1 FROM cte WHERE n < 100
)
SELECT 
    n AS Pořadí,
    CASE 
        WHEN n % 3 = 0 AND n % 5 = 0 THEN '100MEGA'
        WHEN n % 3 = 0 THEN '100'
        WHEN n % 5 = 0 THEN 'MEGA'
        ELSE '-'
    END AS Firma
FROM 
    cte;
