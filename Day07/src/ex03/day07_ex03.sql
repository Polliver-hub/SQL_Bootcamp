WITH vis AS (SELECT name,
                    COUNT(person_id) AS count,
                    'visit'          AS action_type
             FROM person_visits
                      JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
             GROUP BY name),
     ord AS (SELECT name,
                    COUNT(person_id) AS count,
                    'order'          AS action_type
             FROM person_order
                      JOIN menu ON person_order.menu_id = menu.id
                      JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
             GROUP BY name),
     vis_and_ord AS (SELECT vis.name, (vis.count + ord.count) AS total_count
                     FROM vis
                              JOIN ord
                                   ON vis.name = ord.name)
SELECT pizzeria.name,
       CASE
           WHEN total_count IS NULL
               THEN 0
           ELSE total_count
           END
FROM pizzeria
         FULL JOIN vis_and_ord
                   ON pizzeria.name = vis_and_ord.name
ORDER BY total_count DESC, pizzeria.name;
