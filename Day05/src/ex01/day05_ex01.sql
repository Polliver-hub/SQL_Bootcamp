SET enable_seqscan = off;
-- планировщик будет использовать всё,
--     что только можно,
--     дабы избежать последовательного сканирования.
EXPLAIN ANALYZE
SELECT pizza_name,
       pizzeria.name AS pizzeria_name
FROM menu
         JOIN pizzeria ON menu.pizzeria_id = pizzeria.id;
