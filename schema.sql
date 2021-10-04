/*
Есть некоторый сервис, например СМС шлюз. Клиент имеет счет и может заказывать услуги, типа
отправки СМС разных видов, сервисные, массовая рассылка, и т.д. Каждая услуга стоит определенную сумму денег.
Сервис предоплатный, клиент должен пополнить баланс, и потом каждая услуга списывает с баланса свою стоимость.
Если на балансе меньше, чем стоимость услуги, то она не будет оказана.
Типовые опреации
- Пополнить счет
- Заказать услугу
- Узнать остаток на счете
- Узнать результат оказания последней услуги
*/

create table account
(
    account_id serial
        constraint account_pk
            primary key,
    client_id int not null,
    balance numeric(14,2) default 0
);

create table client
(
    client_id serial
        constraint client_pk
            primary key,
    client_name varchar(200) not null
);

alter table account
    add constraint account_client_client_id_fk
        foreign key (client_id) references client;

create table payment
(
    payment_id serial
        constraint payment_pk
            primary key,
    account_id int not null
        constraint payment_account_account_id_fk
            references account,
    payment_date timestamp with time zone not null,
    sum numeric(14,2) default 0 not null
);

create table service
(
    service_id serial
        constraint service_pk
            primary key,
    account_id int not null
        constraint service_account_account_id_fk
            references account,
    service_date timestamp with time zone not null,
    service_name varchar(200),
    service_cost numeric(14,2) default 0 not null
);

/*
 Вообще я добавил ограничения при создании таблицы, но можно придумать еще одно

 */

alter table service
    add constraint check_sum CHECK ((service_cost > 0) AND (service_name <> ''));

