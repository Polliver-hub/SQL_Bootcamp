SELECT pizza_name,
       pizzeria.name AS pizzeria_name
FROM menu
         JOIN pizzeria ON pizzeria_id = pizzeria.id
         JOIN person_order ON menu_id = menu.id
         JOIN person ON person_id = person.id
WHERE person.name = 'Denis'
   OR person.name = 'Anna'
ORDER BY 1, 2;