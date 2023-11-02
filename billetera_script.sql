CREATE TABLE billetera_cristian.companys (
    company_id          INTEGER NOT NULL,
    cpn_holder_name     VARCHAR(50) NOT NULL,
    cpn_number          VARCHAR(50) NOT NULL,
    cpn_name            VARCHAR(50) NOT NULL,
    cpn_expiration_date DATE NOT NULL,
    wallet_id           INTEGER NOT NULL
);

CREATE UNIQUE INDEX companys_pk ON
    billetera_cristian.companys(
        company_id
    ASC);

ALTER TABLE billetera_cristian.companys
ADD CONSTRAINT companys_pk PRIMARY KEY ( company_id );


CREATE TABLE billetera_cristian.contacts (
    contact_id    INTEGER NOT NULL,
    contact_name  VARCHAR(50) NOT NULL,
    contact_email VARCHAR(50) NOT NULL,
    wallet_id     INTEGER NOT NULL
);

CREATE UNIQUE INDEX contacts_pk ON billetera_cristian.contacts (
    contact_id ASC
);


ALTER TABLE billetera_cristian.contacts ADD CONSTRAINT contacts_pk PRIMARY KEY ( contact_id );
       

CREATE TABLE billetera_cristian.transactions (
    transaction_id         INTEGER NOT NULL,
    trans_amount           FLOAT(11) NOT NULL,
    trans_date             DATE NOT NULL,
    trans_description      VARCHAR(50) NOT NULL,
    wallet_id              INTEGER NOT NULL,
    type_of_transaction_id INTEGER NOT NULL,
    company_id             INTEGER NOT NULL,
    trans_tracking         VARCHAR(50) NOT NULL
);

CREATE UNIQUE INDEX transactions_pk ON
    billetera_cristian.transactions (
        transaction_id
    ASC );

ALTER TABLE billetera_cristian.transactions
    ADD CONSTRAINT transactions_pk PRIMARY KEY ( transaction_id )

CREATE TABLE billetera_cristian.typeoftransaction (
    type_of_transaction_id INTEGER NOT NULL,
    tpe_name               VARCHAR(50) NOT NULL
);

CREATE UNIQUE INDEX typeoftransaction_pk ON
    billetera_cristian.typeoftransaction (
        type_of_transaction_id
    ASC );

ALTER TABLE billetera_cristian.typeoftransaction ADD CONSTRAINT typeoftransaction_pk PRIMARY KEY ( type_of_transaction_id );

CREATE TABLE billetera_cristian.users (
    user_id       INTEGER NOT NULL,
    user_name     VARCHAR(50) NOT NULL,
    user_lastname VARCHAR(50) NOT NULL,
    user_email    VARCHAR(50) NOT NULL,
    user_password VARCHAR(50) NOT NULL
);

CREATE UNIQUE INDEX users_pk ON
    billetera_cristian.users (
        user_id
    ASC );
    
ALTER TABLE billetera_cristian.users
    ADD CONSTRAINT users_pk PRIMARY KEY ( user_id );

CREATE TABLE billetera_cristian.wallets (
    wallet_id INTEGER NOT NULL,
    user_id   INTEGER NOT NULL
);

CREATE UNIQUE INDEX wallets__idx ON
    billetera_cristian.wallets (
        user_id
    ASC );
   

CREATE UNIQUE INDEX wallets_pk ON
    billetera_cristian.wallets (
        wallet_id
    ASC );

ALTER TABLE billetera_cristian.wallets
    ADD CONSTRAINT wallets_pk PRIMARY KEY ( wallet_id );

ALTER TABLE billetera_cristian.companys
    ADD CONSTRAINT companys_wallets_fk FOREIGN KEY ( wallet_id )
        REFERENCES billetera_cristian.wallets ( wallet_id )
    NOT DEFERRABLE;

ALTER TABLE billetera_cristian.contacts
    ADD CONSTRAINT contacts_wallets_fk FOREIGN KEY ( wallet_id )
        REFERENCES billetera_cristian.wallets ( wallet_id )
    NOT DEFERRABLE;

ALTER TABLE billetera_cristian.transactions
    ADD CONSTRAINT transactions_companys_fk FOREIGN KEY ( company_id )
        REFERENCES billetera_cristian.companys ( company_id )
    NOT DEFERRABLE;

ALTER TABLE billetera_cristian.transactions
    ADD CONSTRAINT transactions_typeoftransaction_fk FOREIGN KEY ( type_of_transaction_id )
        REFERENCES billetera_cristian.typeoftransaction ( type_of_transaction_id )
    NOT DEFERRABLE;

ALTER TABLE billetera_cristian.transactions
    ADD CONSTRAINT transactions_wallets_fk FOREIGN KEY ( wallet_id )
        REFERENCES billetera_cristian.wallets ( wallet_id )
    NOT DEFERRABLE;

ALTER TABLE billetera_cristian.wallets
    ADD CONSTRAINT wallets_users_fk FOREIGN KEY ( user_id )
        REFERENCES billetera_cristian.users ( user_id )
    NOT DEFERRABLE;

-- Datos de ejemplo para la tabla billetera_cristian.users
INSERT INTO billetera_cristian.users (user_id, user_name, user_lastname, user_email, user_password) VALUES (1, 'Cristian', 'Huanco', 'cristian@email.com', '123456');
INSERT INTO billetera_cristian.users (user_id, user_name, user_lastname, user_email, user_password) VALUES(2, 'Jose', 'Perez', 'jose@email.com', '123456');
INSERT INTO billetera_cristian.users (user_id, user_name, user_lastname, user_email, user_password) VALUES (3, 'Franco', 'Casas', 'franco@email.com', '123456');

-- Datos de ejemplo para la tabla billetera_cristian.wallets
INSERT INTO billetera_cristian.wallets (wallet_id, user_id) VALUES (1, 1);
INSERT INTO billetera_cristian.wallets (wallet_id, user_id) VALUES (2, 2);
INSERT INTO billetera_cristian.wallets (wallet_id, user_id) VALUES (3, 3);

-- Datos de ejemplo para la tabla billetera_cristian.contacts
INSERT INTO billetera_cristian.contacts (contact_id, contact_name, contact_email, wallet_id) VALUES (1, 'Ana López', 'ana@email.com', 1);
INSERT INTO billetera_cristian.contacts (contact_id, contact_name, contact_email, wallet_id) VALUES (2, 'Carmen C', 'ana@email.com', 1);
INSERT INTO billetera_cristian.contacts (contact_id, contact_name, contact_email, wallet_id) VALUES (3, 'Carlos Martínez', 'carlos@email.com', 2);
INSERT INTO billetera_cristian.contacts (contact_id, contact_name, contact_email, wallet_id) VALUES (4, 'Laura Sánchez', 'laura@email.com', 3);

-- Datos de ejemplo para la tabla billetera_cristian.companys

INSERT INTO billetera_cristian.companys (company_id, cpn_holder_name, cpn_number, cpn_name, cpn_expiration_date, wallet_id)
VALUES (1, 'Juan Pérez', '1234 5678 9012 3456', 'Compañía Ejemplo 1 S.A.', TO_DATE('2023-09-16', 'YYYY-MM-DD'), 1);
INSERT INTO billetera_cristian.companys (company_id, cpn_holder_name, cpn_number, cpn_name, cpn_expiration_date, wallet_id)
VALUES (2, 'Juan Quinteros', '1245 5678 9012 3456', 'Compañía Ejemplo 2 S.A.', TO_DATE('2023-09-23', 'YYYY-MM-DD'), 1);
INSERT INTO billetera_cristian.companys (company_id, cpn_holder_name, cpn_number, cpn_name, cpn_expiration_date, wallet_id)
VALUES(3, 'María Rodríguez', '5678 9012 3456 7890', 'Compañía Ejemplo 3 S.A.', TO_DATE('2023-08-30', 'YYYY-MM-DD'), 2);
INSERT INTO billetera_cristian.companys (company_id, cpn_holder_name, cpn_number, cpn_name, cpn_expiration_date, wallet_id)
VALUES(4,'Pedro Gómez', '9876 5432 1098 7654', 'Compañía Ejemplo 4 S.A.', TO_DATE('2023-07-15', 'YYYY-MM-DD'), 3);

-- Datos de ejemplo para la tabla billetera_cristian.typeoftransaction
INSERT INTO billetera_cristian.typeoftransaction (type_of_transaction_id, tpe_name)
VALUES (1, 'Venta');
INSERT INTO billetera_cristian.typeoftransaction (type_of_transaction_id, tpe_name)
VALUES (2, 'Pago');
INSERT INTO billetera_cristian.typeoftransaction (type_of_transaction_id, tpe_name)
VALUES (3, 'Compra');


-- Datos de ejemplo para la tabla billetera_cristian.transactions
INSERT INTO billetera_cristian.transactions (transaction_id, trans_amount, trans_date, trans_description, wallet_id, type_of_transaction_id, company_id, trans_tracking)
VALUES (1, 100.50, TO_DATE('2023-09-16', 'YYYY-MM-DD'), 'Venta de productos', 1, 1, 1, 'TRACK001')
INSERT INTO billetera_cristian.transactions (transaction_id, trans_amount, trans_date, trans_description, wallet_id, type_of_transaction_id, company_id, trans_tracking)
VALUES (2, 75.20, TO_DATE('2023-08-30', 'YYYY-MM-DD'), 'Pago de factura', 2, 2, 2, 'TRACK002')
INSERT INTO billetera_cristian.transactions (transaction_id, trans_amount, trans_date, trans_description, wallet_id, type_of_transaction_id, company_id, trans_tracking)
VALUES (3, 200.00, TO_DATE('2023-07-15', 'YYYY-MM-DD'), 'Compra de suministros', 3, 3, 3, 'TRACK003')
INSERT INTO billetera_cristian.transactions (transaction_id, trans_amount, trans_date, trans_description, wallet_id, type_of_transaction_id, company_id, trans_tracking)
VALUES (4, 300.00, TO_DATE('2023-07-16', 'YYYY-MM-DD'), 'Pago de Factura', 3, 2, 2, 'TRACK004')

GRANT USAGE ON SCHEMA billetera_cristian TO abel;

grant select on all tables in schema billetera_cristian to abel 

grant insert on all tables in schema billetera_cristian to abel 

REVOKE INSERT ON ALL TABLES IN SCHEMA billetera_cristian FROM abel;




