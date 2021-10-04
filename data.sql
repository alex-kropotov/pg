/*
 можем добавить только клиентов и счета, потому что при добавлении услуг или оплат
 должен пересчитываться баланс, и соответственно, нужна логика
 */

INSERT INTO client (client_name)
VALUES
    ('Иванов Сергей'),
    ('Петров Иван'),
    ('Григорьева Ирина'),
    ('Финогенов Илья');


WITH client_list AS (
    SELECT client_id, 0 as balance FROM client
)
INSERT INTO account (client_id, balance)
SELECT * FROM client_list;

