/*
1. Drop column picture from staff.
2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. 
Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. 
For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
Use similar method to get inventory_id, film_id, and staff_id.

4. Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:

Check if there are any non-active users
Create a table backup table as suggested
Insert the non active users in the table backup table
Delete the non active users from the table customer
*/

USE sakila;
-- 1
ALTER TABLE staff
DROP COLUMN picture;

-- 2
select * from sakila.staff;
SELECT * FROM sakila.customer
WHERE first_name = 'Tammy';
INSERT INTO sakila.staff 
VALUES (3, 'TAMMY', 'SANDERS',79,'Tammy.Sanders@sakilastaff.com',2,1,'Tammy',null,CURRENT_TIMESTAMP);
SELECT * FROM sakila.staff;

-- 3
SELECT * FROM sakila.customer
WHERE first_name = 'Charlotte' AND last_name ='Hunter';
SELECT film_id FROM sakila.film
WHERE title = 'Academy Dinosaur';
SELECT inventory_id FROM sakila.inventory
WHERE film_id = 10 AND 99;

SELECT * FROM sakila.rental
ORDER BY rental_id DESC;

INSERT INTO sakila.rental
VALUES (16052,Current_timestamp,1,130, null,1,CURRENT_TIMESTAMP);

SELECT * FROM sakila.rental
ORDER BY rental_id DESC;

-- 4
DROP TABLE deleted_users;
SELECT DISTINCT ACTIVE FROM sakila.customer;
CREATE TABLE sakila.deleted_users
AS (SELECT first_name, last_name, customer_id , email, create_date, last_update, ACTIVE FROM sakila.customer WHERE ACTIVE=0);

SELECT * FROM sakila.deleted_users;


SET foreign_key_checks = 0;
DELETE FROM sakila.customer
WHERE ACTIVE = 0;
SET foreign_key_checks = 1;

SELECT DISTINCT ACTIVE FROM sakila.customer;