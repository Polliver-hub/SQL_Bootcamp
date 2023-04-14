SELECT address,
       ROUND((MAX(age::decimal) - (MIN(age::decimal)
           / MAX(age::decimal))), 2)                               AS formula,
       ROUND(AVG(age::decimal), 2)                                 AS average,
       ROUND((MAX(age::decimal) - (MIN(age::decimal)
           / MAX(age::decimal))), 2) > ROUND(AVG(age::decimal), 2) AS comparison
FROM person
GROUP BY 1
ORDER BY 1;