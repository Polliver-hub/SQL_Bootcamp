WITH t1 AS (SELECT pizzeria.name, pizza_name, price, pizzeria.id
            FROM menu
                     JOIN pizzeria
                          ON menu.pizzeria_id = pizzeria.id),
     t2 AS (SELECT *
            FROM t1)
SELECT DISTINCT t1.pizza_name,
                t1.name AS pizzeria_name_1,
                t2.name AS pizzeria_name_2,
                t1.price
FROM t2,
     menu
         JOIN t1 ON menu.pizzeria_id = t1.id
WHERE t1.pizza_name = t2.pizza_name
  AND t1.price = t2.price
  AND t1.name < t2.name
ORDER BY pizza_name;