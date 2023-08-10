CREATE database SHOP;
DROP database TIENDA;

show databases;

USE SHOP;



CREATE TABLE CLIENTS (
        ID_CLIENT int PRIMARY KEY auto_increment,
        FIRSTNAME VARCHAR(50),
        LASTNAME VARCHAR(50),
        DNI VARCHAR(20),        
        ADDRESS VARCHAR(100),
        CITY VARCHAR(25),
        EMAIL VARCHAR(25),
        PASSWORD VARCHAR(20),
        TELEPHONE CHAR(20)
    );
DROP TABLE CLIENTS;

CREATE TABLE PRODUCTS (
        ID_PRODUCT INT PRIMARY KEY auto_increment,
        NAME_P VARCHAR(50),
        DESCRIPTION_P VARCHAR(100),
        FORMAT_P INT,
        PRICE FLOAT
        );
SELECT * FROM PRODUCTS;
drop table products;
CREATE TABLE BUYS(
        ID_BUY int PRIMARY KEY auto_increment,
        ID_CLIENT int not null,
        ID_PRODUCT int not null,
        BUY_DATE DATE,
        foreign key (ID_CLIENT) references CLIENTS(ID_CLIENT),
        FOREIGN KEY (ID_PRODUCT) REFERENCES PRODUCTS(ID_PRODUCT)        
        );
DROP TABLE BUYS;
        
insert into clients (FIRSTNAME,LASTNAME,DNI,ADDRESS,CITY,EMAIL,PASSWORD,TELEPHONE)
	values ('Santiago', 'Perez','78945612K','camposancos570','vigo','sanpher@gmail.com','santi1234',987654321);
insert into clients (FIRSTNAME,LASTNAME,DNI,ADDRESS,CITY,EMAIL,PASSWORD,TELEPHONE)
	values ('Sofi', 'Perez','75875612K','camposan70','lugo','sofir@gmail.com','sofia1234',987655555);

insert into BUYS (id_client,ID_PRODUCT,BUY_DATE) values (17,5,'2021-03-25');
insert into BUYS (id_client,ID_PRODUCT,BUY_DATE) values (24,1,'2022-01-22');


alter table clients add image varchar(200);
alter table products add image varchar(200);

ALTER TABLE buys DROP FOREIGN KEY ID_CLIENT;



CREATE TABLE USERS (
        ID_USER int PRIMARY KEY auto_increment,
        USER_NAME VARCHAR(50),
        USER_PASSWORD VARCHAR(50)        
    );
    
insert into users (user_name, user_password) values ('santi','perez');

select * from users;

SELECT * FROM CLIENTS;
SELECT * FROM BUYS;
SELECT * FROM CLIENTS ORDER BY ID_CLIENT DESC;
update products set image = "fotoproducto.jpg" where image is null;

SELECT * FROM clients WHERE FIRSTNAME LIKE "PABLO";
SELECT * FROM clients WHERE FIRSTNAME LIKE "%PABLO%";
SELECT * FROM clients WHERE FIRSTNAME LIKE "%PABLO%" or LASTNAME LIKE "%PABLO%";

SELECT * FROM clients WHERE id_client = 300;