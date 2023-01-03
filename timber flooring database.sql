/* Student name: Joshua Lian              
Student username: adcs563             
*/

/* SECTION 1 CREATE TABLE STATEMENTS */
CREATE TABLE adcs563Product(
    product_id integer NOT NULL PRIMARY KEY,
    product_type char(50) NOT NULL ,
    timber_species varchar(50) NOT NULL
);

CREATE TABLE adcs563Customer(
    customer_id integer NOT NULL PRIMARY KEY ,
    cust_first_name char(20) NOT NULL,
    cust_surname char(20) NOT NULL,
    cust_contact_no bigint,
    address varchar(255)
);

CREATE TABLE adcs563Invoice(
    invoice_no integer NOT NULL PRIMARY KEY AUTO_INCREMENT,
    customer_id integer NOT NULL,
    cost decimal(9,2),
    issue_date integer(6),
    FOREIGN KEY (customer_id) REFERENCES adcs563Customer (customer_id)
);

CREATE TABLE adcs563Project(
    project_id integer NOT NULL PRIMARY KEY,
    customer_id integer NOT NULL,
    product_id integer,
    start_date integer(6) NOT NULL,
    end_date integer(6),
    total_area decimal(7,2),
    site_address varchar(255),
    invoice_no integer,
    FOREIGN KEY (customer_id) REFERENCES adcs563Customer (customer_id),
    FOREIGN KEY (product_id) REFERENCES adcs563Product (product_id),
    FOREIGN KEY (invoice_no) REFERENCES adcs563Invoice (invoice_no)
);

CREATE TABLE adcs563Property_develop_project(
    project_id integer NOT NULL PRIMARY KEY,
    unit_quantity integer,
    FOREIGN KEY (project_id) REFERENCES adcs563Project (project_id)
);

CREATE TABLE adcs563Worker(
    worker_id integer NOT NULL PRIMARY KEY,
    worker_first_name char(20) NOT NULL,
    worker_surname char(20) NOT NULL,
    worker_contact_no bigint,
    worker_dob integer(6),
    salary decimal(7,2)
);
CREATE TABLE adcs563Job(
    worker_id integer NOT NULL,
    project_id integer NOT NULL,
    date integer(6) NOT NULL,
    PRIMARY KEY (worker_id, project_id),
    FOREIGN KEY (worker_id) REFERENCES adcs563Worker (worker_id) ON DELETE CASCADE,
    FOREIGN KEY (project_id) REFERENCES adcs563Project (project_id)
);

/* SECTION 2 INSERT STATEMENTS */

INSERT INTO adcs563Product VALUES (001,'Timber Strips', 'Merbau'),
    (002,'Timber Strips',   'American Walnut'),
    (003,'Timber Strips',   'White Oak'),
    (004,'Timber Strips',   'Teak'),
    (005,'Timber Tread',    'Teak'),
    (006,'Timber Tread',    'Merbau'),
    (007,'Timber Skirting', 'Brazilian Oak'),
    (008,'Timber Skirting', 'White Oak'),
    (009,'Timber Skirting', 'American Walnut'),
    (010,'Timber Decking',  'Giam Wood'),
    (011,'Timber Decking',  'Chengal');

INSERT INTO adcs563Customer VALUES 
    (001, 'Noelle',     'Maynard',      1748675316, '9 Heath Parkway'),
    (002, 'Malissia',   'Crowcher',     1145456542, '329 Mcguire Hill'),
    (003, 'Jacinta',    'Garnsey',      3382768819, '0 Mariners Cove Crossing'),
    (004, 'Elton',      'Ketch',        2843582656, '95570 Mcguire Hill'),
    (005, 'Margareta',  'Dane',         6906526197, '7241 Northwestern Street'),
    (006, 'Rebekkah',   'Bolte',        1811900906, '48 Heath Parkway'),
    (007, 'Cullin',     'Shepheard',    7832116559, '316 Mcguire Hill'),
    (008, 'Reade',      'Ackroyd',      9517435674, '6 Fairfield Road'),
    (009, 'Janot',      'Segeswoeth',   4001112207, '9 Ronald Regan Plaza'),
    (010, 'Gard',       'Whitton',      9437701853, '416 Oak Street'),
    (011, 'Ashley',     'Imison',       6795225582, '23 Heath Parkway'),
    (012, 'Sally',      'Pim',          1413066113, '49 Meadow Ridge Avenue'),
    (013, 'Loretta',    'Blinde',       9443381045, '53445 Rigney Wood'),
    (014, 'Mavis',      'Lithcow',      6196641970, '0814 Morningstar Avenue'),
    (015, 'Dosi',       'Lindenbaum',   9761838392, '0447 Heath Parkway'),
    (016, 'Arline',     'Stephen',      7615048900, '40188 Mcguire Hill');

INSERT INTO adcs563Invoice VALUES (001,012,5142.30,201123),
    (002,010,45912.60,  190504),
    (003,005,15263.00,  200113),
    (004,003,2560.00,   181205),
    (005,009,3236.20,   210523),
    (006,014,28790.00,  211019),
    (007,012,13120.00,  210831),
    (008,006,5452.00,   200624),
    (009,001,9456.00,   191218),
    (010,002,36345.10,  200321),
    (011,001,1216.40,   200128),
    (012,004,7860.50,   210326),
    (013,016,29451.60,  211105),
    (014,005,3000.00,   200718),
    (015,008,13152.60,  190423),
    (016,013,9192.60,   190930);
                     
INSERT INTO adcs563Project VALUES 
    (001,010,003,190224,190501, 1387.62,    '48 Londonderry Place', 002),
    (002,005,001,190930,200111, 689.56,     '1070 Mcguire Hill',    003),
    (003,014,008,211226,null,   1451.23,    '512 Springs Avenue',   null),
    (004,009,005,211031,null,   795.20,     '55893 Mendota Drive',  null),
    (005,003,002,180925,181201, 26891.23,   '7135 3rd Hill',        004),
    (006,003,004,180925,181201, 33543.12,   '7135 3rd Hill',        004),
    (007,014,005,210605,211012, 2145.59,    '3943 Badeau Parkway',  006),
    (008,009,007,210227,210520, 1241.60,    '0 West Place',         005),
    (009,002,003,211129,null,   764.00,     '78 Dorton Plaza',      null),
    (010,003,009,220105,null,   3514.62,    '97463 Bunting Trail',  null),
    (011,012,006,210514,210829, 1423.5,     '805 Vidon Street',     007),
    (012,012,001,210514,210829, 378.00,     '805 Vidon Street',     007),
    (013,001,011,190924,1911215,53257.42,   '83 Clarendon Avenue',  009),
    (014,001,004,191113,200125, 41451.63,   '83 Clarendon Avenue',  011),
    (015,013,005,190515,190925, 2455.57,    '923 Mcguire Hill',     016),
    (016,005,004,211231,null,   5643.12,    '11393 4th Crossing',   null),
    (017,007,005,211203,null,   432.15,     '3 Pierstorff Point',   null),
    (018,008,003,190103,190421, 1325.44,    '6 Fairfield Road',     015);

INSERT INTO adcs563Property_develop_project VALUES
    (005,46),
    (006,57),
    (013,135),
    (014,46);

INSERT INTO adcs563Worker VALUES
    (001,'Kaja',        'Westhofer',    5306291234, 630822,5350.00),
    (002,'Cody',        'Bacon',        1406294215, 940225,2150.00),
    (003,'Dode',        'Cove',         3972310081, 970808,2000.00),
    (004,'Laddie',      'Leal',         7373748184, 870521,4300.00),
    (005,'Effie',       'Boss',         7008541527, 740401,12000.00),
    (006,'Neely',       'Bonnick',      8479170672, 780322,13500.00),
    (007,'Robinson',    'Vanyukhin',    7369555886, 960123,2100.00),
    (008,'Manuel',      'Rillstone',    1014936028, 711009,6000.00),
    (009,'Beulah',      'Sheen',        5161929489, 690404,4000.00),
    (010,'Saxe',        'Kirwin',       8022245406, 960501,2500.00),
    (011,'Verla',       'Spraberry',    8649803775, 670514,4500.00),
    (012,'Briano',      'Palser',       3472797175, 860323,7000.00),
    (013,'Katharina',   'Eltune',       4012824827, 900620,5500.00),
    (014,'Adolphus',    'Blacklidge',   1776889037, 951015,2600.00),
    (015,'Ambrosius',   'Keaveney',     3535327610, 760116,3000.00),
    (016,'Gelya',       'Redsull',      7827934492, 990207,2050.00),
    (017,'Melinde',     'McInally',     1591613532, 720926,4600.00);

INSERT INTO adcs563Job VALUES
    (003,012,210529),
    (002,012,210529),
    (011,003,211230),
    (009,001,190330),
    (014,010,220107),
    (015,009,211206),
    (003,002,200105),
    (001,018,190205),
    (004,017,211214),
    (014,011,210612),
    (007,006,181129),
    (015,008,210411),
    (009,008,210411),
    (011,016,220105),
    (016,014,191206);

/* SECTION 3 UPDATE STATEMENTS */
UPDATE adcs563Worker SET salary = 2200 WHERE worker_id = 016;


/* SECTION 4 SINGLE TABLE QUERIES */


/* 
1) List the largest paycheck who is born after 1990.
*/
SELECT MAX(salary) FROM adcs563Worker WHERE worker_dob>900000;


/* 
2) List the times of the product being chosen for all projects.
*/
SELECT  product_id,COUNT(product_id) FROM adcs563Project GROUP BY product_id ;


/* 
3) List out all of the product type. List each product type only once.
*/
SELECT DISTINCT(product_type) FROM adcs563Product;


/* 
4) List the name and contact number of customer who lives in Mcguire Hill. 

*/
SELECT cust_first_name AS 'First Name',
cust_surname AS 'Surname', 
cust_contact_no AS 'Contact No' 
FROM adcs563Customer 
WHERE address LIKE '%Mcguire Hill';



/* 
5) List the site address and total area(sqft) of all projects which have not finished.

*/
SELECT site_address, total_area FROM adcs563Project WHERE end_date IS NULL;


/* 
6) How much money did the company should have earned in 2021, name it as '2021 Income' .

*/
SELECT SUM(cost) AS '2021 Income' FROM adcs563Invoice WHERE issue_date>210000 AND issue_date<220000;


/* SECTION 5 MULTIPLE TABLE QUERIES */


/* 
1) List the customer details whose project starts in 2019.

*/
SELECT customer_id,cust_first_name AS 'First Name' , cust_surname AS 'Surname',
        cust_contact_no AS 'Contact No', address
FROM adcs563Customer
WHERE customer_id IN(
    SELECT customer_id FROM adcs563Project
    WHERE start_date>190000 AND start_date<200000);


/* 
2)  Which product has been chosen more than 3 times?

*/
SELECT DISTINCT(T1.product_id), product_type, timber_species 
FROM adcs563Product T1
INNER JOIN adcs563Project T2
ON T1.product_id = T2.product_id
WHERE T2.product_id IN (
    SELECT product_id FROM adcs563Project 
    GROUP BY product_id 
    HAVING COUNT(product_id)>=3);


/* 
3)  List the customer id and name whose site address contains "Hill".

*/
SELECT customer_id, cust_first_name AS 'First Name', cust_surname AS 'Surname'
FROM adcs563Customer 
WHERE customer_id IN (
    SELECT customer_id
    FROM adcs563Project
    WHERE site_address LIKE('%Hill'));

 

/* 
4)  For each property develop project, list out the average area for one unit.

*/
SELECT P.project_id, total_area/unit_quantity AS 'One Unit Area'
FROM adcs563Project P
INNER JOIN adcs563Property_develop_project C
ON P.project_id = C.project_id;


/* 
5)  Which customer's site is over 2000sqft but not a property develop project?

*/
SELECT C.customer_id,cust_first_name AS 'First Name' , cust_surname AS 'Surname', P.total_area
FROM adcs563Customer C
INNER JOIN adcs563Project P
ON C.customer_id = P.customer_id
WHERE P.total_area >2000
AND P.project_id NOT IN (
    SELECT project_id FROM adcs563Property_develop_project)
ORDER BY total_area DESC;


/* 
6)  A customer call 'Sally Pim' complimented the job, which worker is involved in the project?
    Order it by the worker's first name in ascending.   
*/
SELECT W.worker_id,worker_first_name,worker_surname 
FROM adcs563Worker W INNER JOIN adcs563Job J 
ON W.worker_id = J.worker_id
INNER JOIN adcs563Project P
ON J.project_id = P.project_id
INNER JOIN adcs563Customer C
ON P.customer_id = C.customer_id
WHERE C.cust_first_name = 'Sally'
AND C.cust_surname = 'Pim'
ORDER BY worker_first_name ASC;


/* SECTION 6 DELETE ROWS (make sure the SQL is commented out in this section)

DELETE FROM adcs563Worker 
WHERE worker_first_name = 'Cody'
AND worker_surname = 'Bacon';

*/

 /*SECTION 6 DROP TABLES (make sure the SQL is commented out in this section)
DROP TABLE adcs563Job;
DROP TABLE adcs563Worker;
DROP TABLE adcs563Property_develop_project;
DROP TABLE adcs563Project;
DROP TABLE adcs563Invoice;
DROP TABLE adcs563Customer;
DROP TABLE adcs563Product;
*/

