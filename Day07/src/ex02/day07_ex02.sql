WITH vis AS (SELECT name,
                    COUNT(person_id) AS count,
                    'visit'          AS action_type
             FROM person_visits
                      JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
             GROUP BY name
             ORDER BY action_type, count DESC
             LIMIT 3),
     ord AS (SELECT name,
                    COUNT(person_id) AS count,
                    'order'          AS action_type
             FROM person_order
                      JOIN menu ON person_order.menu_id = menu.id
                      JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
             GROUP BY name
             ORDER BY action_type, count DESC
             LIMIT 3)
SELECT *
FROM ord
UNION
SELECT *
FROM vis
ORDER BY action_type, count DESC;
