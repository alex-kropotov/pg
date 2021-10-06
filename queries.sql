SELECT sum(sum) FROM payment WHERE account_id = 1 AND payment_date >= '2021-01-01' AND payment_date < '2021-02-01';

SELECT count(*) FROM service WHERE service_name = 'Some service';

UPDATE account SET balance =
    (SELECT SUM(sum) FROM payment WHERE account_id = 1) -
    (SELECT SUM(service_cost) FROM service WHERE account_id = 1)
WHERE account_id = 1;

/*
 Таблицы payment и service неплохо бы проиндексировать по ид аккаунта и по дате

 */

