SELECT name,
       rating
FROM pizzeria
         LEFT JOIN person_visits ON pizzeria_id = pizzeria.id
WHERE pizzeria_id IS NULL;

