--crear usuario y asignar privilegios
CREATE USER danielatriador IDENTIFIED BY Basededatos22023 DEFAULT TABLESPACE data;
GRANT CREATE SESSION TO danielatriador;
ALTER USER danielatriador QUOTA 50M ON data;
GRANT CREATE TABLE TO danielatriador;
GRANT CREATE SEQUENCE TO danielatriador;

--Crear las tablas
CREATE TABLE danielatriador.type_of_transactions (
    tpe_id NUMBER(10),
    tpe_name VARCHAR2(45) NOT NULL,
    CONSTRAINT type_of_transactions_pk PRIMARY KEY (tpe_id)
) TABLESPACE data;

CREATE TABLE danielatriador.users (
    user_id        NUMBER(10),
    user_name      VARCHAR2(45) NOT NULL,
    user_last_name VARCHAR2(45) NOT NULL,
    user_email     VARCHAR2(45) NOT NULL,
    user_password  VARCHAR2(45) NOT NULL,
    CONSTRAINT users_pk PRIMARY KEY (user_id)
) TABLESPACE data;

CREATE table danielatriador.wallets (
    wallet_id NUMBER(10),
    user_id NUMBER(10) NOT NULL,
    CONSTRAINT wallets_pk PRIMARY KEY (wallet_id),
    CONSTRAINT wallets_users_fk FOREIGN KEY ( user_id ) REFERENCES danielatriador.users ( user_id )
) TABLESPACE data;

 CREATE TABLE danielatriador.companies (
    companies_id              NUMBER(10),
    companies_holder_name     VARCHAR2(45) NOT NULL,
    companies_number          VARCHAR2(20),
    companies_company_name    VARCHAR2(45) NOT NULL,
    companies_api_key         VARCHAR2(45) NOT NULL,
    companies_expiration_date DATE NOT NULL,
    wallet_id              NUMBER(10) NOT NULL,
    CONSTRAINT companies_pk PRIMARY KEY (companies_id),
    CONSTRAINT companies_wallets_fk FOREIGN KEY ( wallet_id ) REFERENCES danielatriador.wallets ( wallet_id )
) TABLESPACE data;

CREATE TABLE danielatriador.contacts (
    contacts_id    NUMBER(10),
    contacts_name  VARCHAR2(45) NOT NULL,
    contacts_email VARCHAR2(45) NOT NULL,
    wallet_id    NUMBER(10) NOT NULL,
    CONSTRAINT contacts_pk PRIMARY KEY (contacts_id),
    CONSTRAINT contacts_wallets_fk FOREIGN KEY ( wallet_id ) REFERENCES danielatriador.wallets ( wallet_id )
) TABLESPACE data;

CREATE table danielatriador.transactions (
    transactions_id NUMBER(10),
    transactions_amount NUMBER(11) NOT NULL,
    transactions_signe VARCHAR2(45) NOT NULL,
    transactions_date DATE NOT NULL,
    transactions_description VARCHAR2(45) NOT NULL,
    transactions_tracking VARCHAR2(45) NOT NULL,
    tpe_id NUMBER(10) NOT NULL,
    wallet_id NUMBER(10) NOT NULL,
    companies_id NUMBER(10),
    CONSTRAINT transactions_pk PRIMARY KEY (transactions_id),
    CONSTRAINT transactions_companies_fk FOREIGN KEY ( companies_id ) REFERENCES danielatriador.companies ( companies_id ),
    CONSTRAINT transactions_type_of_transactions_fk FOREIGN KEY ( tpe_id ) REFERENCES danielatriador.type_of_transactions ( tpe_id ), 
    CONSTRAINT transactions_wallets_fk FOREIGN KEY ( wallet_id ) REFERENCES danielatriador.wallets ( wallet_id )
) TABLESPACE data;


--Insertar los datos
--Insertar datos en la tabla de type of transactions
insert into danielatriador.type_of_transactions (tpe_id, tpe_name) VALUES(1, 'CASH');
insert into danielatriador.type_of_transactions (tpe_id, tpe_name) VALUES(2, 'CARD');
insert into danielatriador.type_of_transactions (tpe_id, tpe_name) VALUES(3, 'INVOICE');
insert into danielatriador.type_of_transactions (tpe_id, tpe_name) VALUES(4, 'TRANSFER');
commit;
SELECT COUNT(*) as from danielatriador.type_of_transactions;


--Insertar datos en la tabla de users
insert into danielatriador.users (user_id, user_name, user_last_name, user_email, user_password) VALUES(1, 'Daniela','Triador', 'danielatriador@gmail.com', '36965115');
insert into danielatriador.users (user_id, user_name, user_last_name, user_email, user_password) VALUES(2, 'Nara','Triador', 'naratriador@gmail.com', '49025661');
insert into danielatriador.users (user_id, user_name, user_last_name, user_email, user_password) VALUES(3, 'Gabriel','Triador', 'gabrieltriador@gmail.com', '38772486');
insert into danielatriador.users (user_id, user_name, user_last_name, user_email, user_password) VALUES(4, 'Gabriela','Torres', 'gabrielatorres@gmail.com', '24058456');
insert into danielatriador.users (user_id, user_name, user_last_name, user_email, user_password) VALUES(5, 'Adrian','Gamester', 'adriangamester@gmail.com', '23597131');
insert into danielatriador.users (user_id, user_name, user_last_name, user_email, user_password) VALUES(6, 'Fausto','Triador', 'faustotriador@gmail.com', '50142369');
insert into danielatriador.users (user_id, user_name, user_last_name, user_email, user_password) VALUES(7, 'Julian','Triador', 'cucutriador@gmail.com', '52698417');
insert into danielatriador.users (user_id, user_name, user_last_name, user_email, user_password) VALUES(8, 'Yolanda','Coz', 'yolandacoz@gmail.com', '10514999');
commit;
SELECT COUNT(*) as from danielatriador.users;


--Insertar datos en la tabla wallets
insert into danielatriador.wallets (wallet_id, user_id) values (1, 1);
insert into danielatriador.wallets (wallet_id, user_id) values (2, 2);
insert into danielatriador.wallets (wallet_id, user_id) values (3, 3);
insert into danielatriador.wallets (wallet_id, user_id) values (4, 4);
insert into danielatriador.wallets (wallet_id, user_id) values (5, 5);
insert into danielatriador.wallets (wallet_id, user_id) values (6, 6);
insert into danielatriador.wallets (wallet_id, user_id) values (7, 7);
insert into danielatriador.wallets (wallet_id, user_id) values (8, 8);
commit;
SELECT COUNT(*) as from danielatriador.wallets;


--Insertar datos en la tabla companies
insert into danielatriador.companies (companies_id, companies_holder_name, companies_number, companies_company_name, companies_api_key, companies_expiration_date, wallet_id) 
values (1, 'DANIELA TRIADOR', '4140001234567899', 'Visa', 'api visa', sysdate, 1);
insert into danielatriador.companies (companies_id, companies_holder_name, comapnies_number, companies_company_name, companies_api_key, companies_expiration_date, wallet_id) 
values (2, 'DANIELA TRIADOR', '5399011296584789', 'Mastercard', 'api mastercard', sysdate, 1);

insert into danielatriador.companies (companies_id, companies_holder_name, companies_number, companies_company_name, companies_api_key, companies_expiration_date, wallet_id) 
values (3, 'GABRIELA TORRES', '4140001234565741', 'Visa', 'api visa', sysdate, 2);
insert into danielatriador.companies (companies_id, companies_holder_name, companies_number, companies_company_name, companies_api_key, companies_expiration_date, wallet_id) 
values (4, 'GABRIELA TORRES', '5399011296584258', 'Mastercard', 'api mastercard', sysdate, 2);

insert into danielatriador.companies (companies_id, companies_holder_name, companies_number, companies_company_name, companies_api_key, companies_expiration_date, wallet_id) 
values (5, 'GABRIEL TRIADOR', '4140001234561234', 'Visa', 'api visa', sysdate, 1);
insert into danielatriador.companies (companies_id, companies_holder_name, comapnies_number, companies_company_name, companies_api_key, companies_expiration_date, wallet_id) 
values (6, 'GABRIEL TRIADOR', '53990112965848589', 'Mastercard', 'api mastercard', sysdate, 1);

insert into danielatriador.companies (companies_id, companies_holder_name, companies_number, companies_company_name, companies_api_key, companies_expiration_date, wallet_id) 
values (7, 'NARA TRIADOR', '4140001234489741', 'Visa', 'api visa', sysdate, 2);
insert into danielatriador.companies (companies_id, companies_holder_name, companies_number, companies_company_name, companies_api_key, companies_expiration_date, wallet_id) 
values (8, 'NARA TRIADOR', '5399011296384258', 'Mastercard', 'api mastercard', sysdate, 2);

commit;
SELECT COUNT(*) as from danielatriador.companies;


--Insertar datos en la tabla contacts
insert into danielatriador.contacts (contacts_id, contacts_name, contacts_email, wallet_id) values (1, 'nara', 'naratriador@gmail.com', 2);
insert into danielatriador.contacts (contacts_id, contacts_name, contacts_email, wallet_id) values (2, 'gabriel', 'gabrieltriador@gmail.com', 3);
insert into danielatriador.contacts (contacts_id, contacts_name, contacts_email, wallet_id) values (3, 'gabriela', 'gabrielatorres@gmail.com', 4);
insert into danielatriador.contacts (contacts_id, contacts_name, contacts_email, wallet_id) values (4, 'adrian', 'adriangamester@gmail.com', 5);
insert into danielatriador.contacts (contacts_id, contacts_name, contacts_email, wallet_id) values (5, 'fausto', 'faustotriador@gmail.com', 6);
insert into danielatriador.contacts (contacts_id, contacts_name, contacts_email, wallet_id) values (6, 'julian', 'cucutriador@gmail.com', 7);
commit;
SELECT COUNT(*) as from danielatriador.contacts;


--Insertar datos en la tabla de type of transactions
insert into danielatriador.transactions (transactions_id, transactions_amount, transactions_signe, transactions_date, transactions_description, transactions_tracking, tpe_id, wallet_id, companies_id)
values (1, 10000, '+', sysdate,'RAPIPAGO','12311', 1, 1, null);
insert into danielatriador.transactions (transactions_id, transactions_amount, transactions_signe, transactions_date, transactions_description, transactions_tracking, tpe_id, wallet_id, companies_id)
values (2, 80000, '+', sysdate,'PAGOFACIL','12312', 2, 1, 1);
insert into danielatriador.transactions (transactions_id, transactions_amount, transactions_signe, transactions_date, transactions_description, transactions_tracking, tpe_id, wallet_id, companies_id)
values (3, 50000, '-', sysdate,'CANTINA UNDEC','12313', 3, 1, null);
insert into danielatriador.transactions (transactions_id, transactions_amount, transactions_signe, transactions_date, transactions_description, transactions_tracking, tpe_id, wallet_id, companies_id)
values (4, 10000, '-', sysdate,'naratriador@gmail.com','12314', 4, 1, null);

insert into danielatriador.transactions (transactions_id, transactions_amount, transactions_signe, transactions_date, transactions_description, transactions_tracking, tpe_id, wallet_id, companies_id)
values (5, 2500, '+', sysdate,'HILAL','123211', 1, 2, null);
insert into danielatriador.transactions (transactions_id, transactions_amount, transactions_signe, transactions_date, transactions_description, transactions_tracking, tpe_id, wallet_id, companies_id)
values (6, 7800, '-', sysdate,'CINTAS','12313', 3, 2, null);
insert into danielatriador.transactions (transactions_id, transactions_amount, transactions_signe, transactions_date, transactions_description, transactions_tracking, tpe_id, wallet_id, companies_id)
values (7, 1000, '+', sysdate,'gabrielatorres@gmail.com','12314', 4, 2, null);

commit;
SELECT COUNT(*) as from danielatriador.transactions;


-- Creacion de secuencias que empiezn en 10 para no afectar los registros previamente cargados 
-- Secuencia para type_of_transactions
CREATE SEQUENCE seq_type_of_transactions START WITH 10 INCREMENT BY 1 NOCACHE NOCYCLE;
-- Secuencia para users
CREATE SEQUENCE seq_users START WITH 10 INCREMENT BY 1 NOCACHE NOCYCLE;
-- Secuencia para wallets
CREATE SEQUENCE seq_wallets START WITH 10 INCREMENT BY 1 NOCACHE NOCYCLE;
-- Secuencia para companies
CREATE SEQUENCE seq_companies START WITH 10 INCREMENT BY 1 NOCACHE NOCYCLE;
-- Secuencia para contacts
CREATE SEQUENCE seq_contacts START WITH 10 INCREMENT BY 1 NOCACHE NOCYCLE;
-- Secuencia para transactions
CREATE SEQUENCE seq_transactions START WITH 10 INCREMENT BY 1 NOCACHE NOCYCLE;


-- MOfiicar las tablas para asigna el valor de las secuanci por defecto en los primary key
-- Modificar la tabla type_of_transactions para usar la secuencia
ALTER TABLE danielatriador.type_of_transactions MODIFY (tpe_id DEFAULT seq_type_of_transactions.NEXTVAL);
-- Modificar la tabla users para usar la secuencia
ALTER TABLE danielatriador.users MODIFY (usr_id DEFAULT seq_users.NEXTVAL);
-- Modificar la tabla wallets para usar la secuencia
ALTER TABLE danielatriador.wallets MODIFY (wal_id DEFAULT seq_wallets.NEXTVAL);
-- Modificar la tabla companies para usar la secuencia
ALTER TABLE danielatriador.companies MODIFY (cpn_id DEFAULT seq_companies.NEXTVAL);
-- Modificar la tabla contacts para usar la secuencia
ALTER TABLE danielatriador.contacts MODIFY (con_id DEFAULT seq_contacts.NEXTVAL);
-- Modificar la tabla transactions para usar la secuencia
ALTER TABLE danielatriador.transactions MODIFY (tra_id DEFAULT seq_transactions.NEXTVAL);


-- Ccrear nuevo usuario para lectura y asisgna privilegios
CREATE USER wallet_dev IDENTIFIED BY Unacontrasenia2023 DEFAULT TABLESPACE data;
GRANT CREATE SESSION TO wallet_dev;
GRANT SELECT ON danielatriador.type_of_transactions TO wallet_dev;
GRANT SELECT ON danielatriador.users TO wallet_dev;
GRANT SELECT ON danielatriador.wallets TO wallet_dev;
GRANT SELECT ON danielatriador.companies TO wallet_dev;
GRANT SELECT ON danielatriador.contacts TO wallet_dev;
GRANT SELECT ON danielatriador.transactions TO wallet_dev;