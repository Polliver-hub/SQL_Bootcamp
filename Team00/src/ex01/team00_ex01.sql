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
              WHERE tour NOT LIKE ('%' || child.point1 || '%')),
    result AS (SELECT total_cost,
                      ('{' || tour || ',a}') AS tour
               FROM paths
               WHERE LENGTH(tour) = 7
                 AND point2 = 'a'),
    min_result AS (SELECT *
                   FROM result
                   WHERE total_cost IN (SELECT MIN(total_cost)
                                        FROM result)),
    max_result AS (SELECT *
                   FROM result
                   WHERE total_cost IN (SELECT MAX(total_cost)
                                        FROM result))
SELECT *
FROM min_result
UNION
SELECT *
FROM max_result
ORDER BY 1, 2;