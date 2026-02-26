CREATE DATABASE online_retail;
USE online_retail;
CREATE TABLE customer (
    cust_id INT AUTO_INCREMENT PRIMARY KEY,
    cust_name   VARCHAR(100),
    cust_address VARCHAR(255),
    cust_email   VARCHAR(100)
);
CREATE TABLE reg_customer (
    cust_id INT PRIMARY KEY,
    user_id VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
        ON DELETE CASCADE
);
CREATE TABLE bank_account (
    numb VARCHAR(30) PRIMARY KEY,
    name  VARCHAR(100) NOT NULL
);
CREATE TABLE provide (
    cust_id INT NOT NULL,
    number  VARCHAR(30) NOT NULL,
    PRIMARY KEY (cust_id, number),
    FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
        ON DELETE CASCADE,
    FOREIGN KEY (number) REFERENCES bank_account(numb)
        ON DELETE CASCADE
);
CREATE TABLE item_class (
    item_class_number INT PRIMARY KEY,
    item_class_name   VARCHAR(100)
);
CREATE TABLE item (
    stock INT PRIMARY KEY,      
    quantity INT NOT NULL,      
    price DECIMAL(10,2) NOT NULL,  
    item_class_number INT,      

    FOREIGN KEY (item_class_number)
        REFERENCES item_class(item_class_number)
);
CREATE TABLE purchase (
    cust_id INT NOT NULL,
    stock   INT NOT NULL,
    PRIMARY KEY (cust_id, stock),
    FOREIGN KEY (cust_id) REFERENCES reg_customer(cust_id)
        ON DELETE CASCADE,
    FOREIGN KEY (stock)   REFERENCES item(stock)
        ON DELETE CASCADE
);
INSERT INTO customer (cust_name, cust_address, cust_email)
VALUES
('Nihad Isgandarli', 'Lugano, Switzerland', 'nihad@example.com'),
('Alice Rossi', 'Milano, Italy', 'alice@example.com'),
('Bob Smith', 'Zurich, Switzerland', 'bob@example.com'),
('Marco Bianchi', 'Roma, Italy', 'marco@example.com'),
('Laura Conti', 'Torino, Italy', 'laura@example.com'),
('David Müller', 'Bern, Switzerland', 'david@example.com'),
('Sara Keller', 'Basel, Switzerland', 'sara@example.com'),
('John Weber', 'Munich, Germany', 'john@example.com'),
('Elena Romano', 'Napoli, Italy', 'elena@example.com'),
('Mert Yilmaz', 'Istanbul, Turkey', 'mert@example.com'),
('Sofia Costa', 'Lisbon, Portugal', 'sofia@example.com');
INSERT INTO reg_customer (cust_id, user_id, password)
VALUES
(1, 'nihad01', '20030103'),
(2, 'alice99', 'password'),
(3, 'bob77', 'bob2522'),

INSERT INTO reg_customer (cust_id, user_id, password)
VALUES
(4, 'marco_b', 'roma123'),
(5, 'laura_c', 'torino456'),
(6, 'david_m', 'bern789'),
(7, 'sara_k', 'basel000');


INSERT INTO bank_account (number, name)
VALUES
('CH11-0001', 'UBS'),
('CH22-0002', 'Suisse'),
('CH33-0003', 'Lugano bank'),
('CH44-0004', 'Deutsche Bank');

INSERT INTO bank_account (number, name)
VALUES
('CH55-0005', 'Raiffeisen'),
('CH66-0006', 'ZKB'),
('IT11-1001', 'UniCredit'),
('DE11-2001', 'Commerzbank');

INSERT INTO provide (cust_id, number)
VALUES
(1, 'CH11-0001'),
(1, 'CH22-0002'),
(2, 'CH33-0003'),
(3, 'CH44-0004');

INSERT INTO provide (cust_id, number)
VALUES
(2, 'CH55-0005'),
(3, 'CH66-0006'),
(4, 'IT11-1001'),
(5, 'CH11-0001'),
(6, 'CH22-0002'),
(7, 'DE11-2001');
INSERT INTO item_class (item_class_number, item_class_name)
VALUES
(1, 'bad'),
(2, 'Standard'),
(3, 'good');

DROP TABLE IF EXISTS provide;
DROP TABLE IF EXISTS bank_account;


CREATE TABLE bank_account (
    number VARCHAR(30) PRIMARY KEY,
    name   VARCHAR(100) NOT NULL
);



CREATE TABLE provide (
    cust_id INT NOT NULL,
    number  VARCHAR(30) NOT NULL,
    PRIMARY KEY (cust_id, number),
    FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
        ON DELETE CASCADE,
    FOREIGN KEY (number) REFERENCES bank_account(number)
        ON DELETE CASCADE
);
INSERT INTO item (stock, quantity, price, item_class_number)
VALUES
(100, 50, 5, 1),
(200, 20, 40, 1),
(300, 70, 56, 2),
(400,  100, 78, 3);

INSERT INTO item (stock, quantity, price, item_class_number)
VALUES
(500, 30, 120.00, 3),
(600, 15, 250.00, 3),
(700, 80, 15.00, 1),
(800, 60, 35.00, 2),
(900, 25, 60.00, 2),
(1000, 10, 500.00, 3),
(1100, 100, 8.50, 1),
(1200, 45, 42.00, 2);

INSERT INTO purchase (cust_id, stock)
VALUES
(1, 100),
(1, 300),
(2, 200),
(3, 400),
(1, 200),
(1, 400),
(2, 300),
(3, 100),
(4, 500),
(5, 700),
(5, 800),
(2, 600);

INSERT INTO purchase (cust_id, stock)
VALUES
(1, 200),
(1, 400),
(1, 500),
(1, 700),
(2, 300),
(2, 600),
(2, 900),
(3, 100),
(3, 800),
(3, 1100),
(4, 1200),
(4, 1000),
(5, 700),
(5, 800),
(5, 900),
(6, 1100),
(6, 500),
(7, 600);



SELECT c.cust_id, c.cust_name,r.user_id
FROM customer AS c
JOIN reg_customer AS r ON c.cust_id = r.cust_id;

SELECT c.cust_name, b.number AS account_number, b.name   AS bank_name
FROM customer AS c
JOIN provide AS p ON c.cust_id = p.cust_id
JOIN bank_account AS b ON p.number = b.number
ORDER BY c.cust_name;

SELECT c.cust_name, COUNT(p.number) AS num_accounts
FROM customer AS c
LEFT JOIN provide AS p ON c.cust_id = p.cust_id
GROUP BY c.cust_name;

SELECT i.stock, i.quantity, i.price, ic.item_class_name
FROM item AS i
LEFT JOIN item_class AS ic ON i.item_class_number = ic.item_class_number;

SELECT c.cust_id, c.cust_name
FROM customer AS c
WHERE EXISTS (
    SELECT 1
    FROM purchase AS p
    WHERE p.cust_id = c.cust_id
);

SELECT c.cust_name,i.stock,i.price,ic.item_class_name
FROM purchase AS p
JOIN customer AS c ON p.cust_id = c.cust_id
JOIN item AS i ON p.stock = i.stock
LEFT JOIN item_class AS ic ON i.item_class_number = ic.item_class_number
ORDER BY c.cust_name;

SELECT i.stock,i.price
FROM item AS i
WHERE i.price = (
    SELECT MAX(i2.price) 
    FROM item AS i2
);
SELECT c.cust_name
FROM customer AS c
WHERE c.cust_id NOT IN (
    SELECT p.cust_id
    FROM purchase AS p
);

SELECT i.stock, i.price
FROM item AS i
WHERE i.price > (
    SELECT AVG(i2.price)
    FROM item AS i2
);


SELECT c.cust_name, COUNT(p.stock) AS num_items_bought
FROM customer AS c
LEFT JOIN purchase AS p ON c.cust_id = p.cust_id
GROUP BY c.cust_name;

SELECT DISTINCT c.cust_name
FROM customer AS c
WHERE c.cust_id IN (
    SELECT p.cust_id
    FROM purchase AS p
    WHERE p.stock IN (
        SELECT i.stock
        FROM item AS i
        WHERE i.item_class_number = 3
    )
);

SELECT ic.item_class_name, SUM(i.quantity) AS total_quantity_in_stock
FROM item_class AS ic
JOIN item AS i ON ic.item_class_number = i.item_class_number
GROUP BY ic.item_class_name;

INSERT INTO reg_customer (cust_id, user_id, password) VALUES (1, 'nihad01', '20030103'), (2, 'alice99', 'password'), (3, 'bob77', 'bob2522'), (4, 'marco_b', 'roma123'), (5, 'laura_c', 'torino456'), (6, 'david_m', 'bern789'), (7, 'sara_k', 'basel000')

