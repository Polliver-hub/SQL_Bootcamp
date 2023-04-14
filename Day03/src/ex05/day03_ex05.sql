WITH Andrey_visit AS (SELECT pizzeria.name AS pizzeria_name
                      FROM person_visits
                               JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
                               JOIN person ON person_visits.person_id = person.id
                      WHERE person.name = 'Andrey'),
     Andrey_order AS (SELECT DISTINCT pizzeria.name AS pizzeria_name
                      FROM menu
                               JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
                               JOIN person_order ON menu.id = person_order.menu_id
                               JOIN person ON person_order.person_id = person.id
                      WHERE person.name = 'Andrey')
SELECT pizzeria_name
FROM Andrey_visit
EXCEPT
SELECT pizzeria_name
FROM Andrey_order
ORDER BY pizzeria_name;