SELECT person.name                    AS name,
       pizza_name,
       menu.price,
       price - price * discount / 100 AS discount_price,
       pizzeria.name                  AS pizzeria_name
FROM person
         JOIN person_order ON person.id = person_order.person_id
         JOIN menu ON person_order.menu_id = menu.id
         JOIN person_discounts ON person_order.person_id = person_discounts.person_id
         JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY 1, 2;