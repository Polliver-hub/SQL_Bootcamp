SELECT table1.name    AS person_name1,
       table2.name    AS person_name2,
       table1.address AS common_address
FROM person AS table1
         JOIN person AS table2
              ON table1.address = table2.address
WHERE table1.id > table2.id
ORDER BY 1, 2, 3;

SELECT pizza_name, pizza_price, pizzeria_name, visit_date
FROM person_order
WHERE person.name = 'Kate'
  AND pizza_price BETWEEN 800 AND 1000
ORDER BY pizza_name, pizza_price, pizzeria_name;