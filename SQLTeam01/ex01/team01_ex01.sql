-- team01_ex01.sql

INSERT INTO currency
VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');
INSERT INTO currency
VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');

SELECT DISTINCT COALESCE(u.name, 'not defined')     AS name,
                COALESCE(u.lastname, 'not defined') AS lastname,
                c.name                              AS currency_name,
                COALESCE((SELECT rate_to_usd
                          FROM currency c2
                          WHERE c2.id = b.currency_id
                            AND c2.updated < b.updated
                          ORDER BY c2.updated DESC
                          LIMIT 1),
                         (SELECT rate_to_usd
                          FROM currency c2
                          WHERE c2.id = b.currency_id
                            AND c2.updated > b.updated
                          ORDER BY c2.updated ASC
                          LIMIT 1)) * b.money       AS currency_in_usd
FROM "user" u
       RIGHT JOIN balance b ON u.id = b.user_id
       INNER JOIN currency c ON c.id = b.currency_id
ORDER BY name DESC, lastname ASC, currency_name ASC;