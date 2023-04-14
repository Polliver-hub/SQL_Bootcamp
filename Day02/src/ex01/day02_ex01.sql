SELECT list::DATE AS missing_date
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') list
         LEFT JOIN (SELECT *
                    FROM person_visits
                    WHERE person_id = 1
                       OR person_id = 2) AS visit_1_2
                   ON list = visit_1_2.visit_date
WHERE visit_1_2.visit_date IS NULL
ORDER BY missing_date;