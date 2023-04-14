WITH Inc_Out AS (SELECT *
                 FROM person_visits
                 WHERE person_id = 1
                    OR person_id = 2)
SELECT list::DATE AS missing_date
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') list
         LEFT JOIN Inc_Out ON list = Inc_Out.visit_date
WHERE Inc_Out.visit_date IS NULL
ORDER BY missing_date;