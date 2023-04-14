SELECT COALESCE(u.name, 'not defined')     AS name,
       COALESCE(u.lastname, 'not defined') AS lastname,
       b.type,
       SUM(b.money)                        AS volume,
       COALESCE(c.name, 'not defined')     AS currency_name,
       CASE
           WHEN c.rate_to_usd IS NULL
               THEN 1
           ELSE c.rate_to_usd END          AS last_rate_to_usd,
       SUM(b.money) *
       CASE
           WHEN c.rate_to_usd IS NULL
               THEN 1
           ELSE c.rate_to_usd END          AS total_volume_in_usd

FROM "user" u
         FULL JOIN balance b ON u.id = b.user_id
         FULL JOIN currency c ON b.currency_id = c.id
         FULL JOIN (SELECT id, MAX(updated) AS updated
                    FROM currency
                    GROUP BY id) AS lc ON lc.id = c.id
WHERE lc.updated = c.updated
   OR c.name IS NULL
GROUP BY 1, 2, 3, 5, 6
ORDER BY 1 DESC, 2, 3;