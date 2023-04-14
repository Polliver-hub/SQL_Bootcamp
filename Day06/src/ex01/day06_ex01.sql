INSERT INTO person_discounts
WITH visits AS (SELECT person_id,
                       pizzeria_id,
                       count(person_id) AS visits
                FROM person_order
                         JOIN menu ON menu.id = person_order.menu_id
                GROUP BY person_id, pizzeria_id
                ORDER BY 1, 2)
SELECT ROW_NUMBER() OVER () AS id,
       person_id,
       pizzeria_id,
       CASE
           WHEN visits = 1 THEN 10.5
           WHEN visits = 2 THEN 22
           ELSE 30
           END              AS discount
FROM visits;