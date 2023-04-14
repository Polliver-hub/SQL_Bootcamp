CREATE TABLE IF NOT EXISTS route_cost
(
    point1 VARCHAR NOT NULL,
    point2 VARCHAR NOT NULL,
    cost   INT     NOT NULL
);

INSERT INTO route_cost
VALUES ('a', 'b', 10),
       ('a', 'c', 15),
       ('a', 'd', 20),
       ('b', 'a', 10),
       ('b', 'c', 35),
       ('b', 'd', 25),
       ('c', 'a', 15),
       ('c', 'b', 35),
       ('c', 'd', 30),
       ('d', 'a', 20),
       ('d', 'b', 25),
       ('d', 'c', 30);

WITH RECURSIVE
    paths AS (SELECT point1 AS tour,
                     point1,
                     point2,
                     cost,
                     cost   AS total_cost
              FROM route_cost
              WHERE point1 = 'a'
              UNION ALL
              SELECT (parrent.tour || ',' || child.point1) AS trace,
                     child.point1,
                     child.point2,
                     child.cost,
                     parrent.total_cost + child.cost       AS total_cost
              FROM route_cost AS child
                       JOIN paths AS parrent
                            ON child.point1 = parrent.point2
              WHERE tour NOT LIKE ('%' || child.point1 || '%'))
--     result AS (SELECT total_cost,
--                       ('{' || tour || ',a}') AS tour
--                FROM paths
--                WHERE LENGTH(tour) = 7
--                  AND point2 = 'a'),
--     min_result AS (SELECT *
--                    FROM result
--                    WHERE total_cost IN (SELECT MIN(total_cost)
--                                         FROM result))
SELECT *
FROM paths
ORDER BY 1, 2;