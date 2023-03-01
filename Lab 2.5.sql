USE sakila;

-- Select all the actors with the first name ‘Scarlett’.
SELECT * 
FROM sakila.actor 
WHERE first_name = 'Scarlett';

-- How many films (movies) are available for rent?  

SELECT COUNT(inventory_id)
FROM sakila.rental;

-- how many films have been rented?

SELECT COUNT(return_date)
FROM sakila.rental;

-- What are the shortest movie duration? 

SELECT title, length  AS 'min duration'
FROM sakila.film
ORDER BY length ASC
LIMIT 1;

-- What are the longest movie duration? 
SELECT title, length AS 'max duration'
FROM sakila.film
ORDER BY length DESC
LIMIT 1;

-- What's the average movie duration expressed in format (hours, minutes)?

SELECT SEC_TO_TIME(AVG(length*60)) 
FROM sakila.film;

-- How many distinct (different) actors' last names are there?

SELECT COUNT(DISTINCT (last_name))
FROM sakila.actor;

-- Since how many days has the company been operating (check DATEDIFF() function)?

SELECT DATEDIFF(max(return_date),min(rental_date)) AS 'Operating days' 
FROM sakila.rental;

-- Show rental info with additional columns month and weekday. Get 20 results.

SELECT rental_id,date_format(rental_date, '%M') AS month, DATE_FORMAT(rental_date, '%W') AS weekday
FROM sakila.rental
LIMIT 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT rental_id, rental_date,
       CASE DAYOFWEEK(rental_date)
           WHEN 1 THEN 'weekend'
           WHEN 7 THEN 'weekend'
           ELSE 'workday'
       END AS day_type
FROM sakila.rental
LIMIT 20;

-- Get release years.

SELECT release_year , title
FROM sakila.film;

-- Get all films with ARMAGEDDON in the title.

SELECT title
FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%';

-- Get all films which title ends with APOLLO.
SELECT title
FROM sakila.film
WHERE title LIKE '%APOLLO';

-- Get 10 the longest films.

SELECT title, length AS 'max duration'
FROM sakila.film
ORDER BY length DESC
LIMIT 10;

-- How many films include Behind the Scenes content?

SELECT COUNT(DISTINCT(title))
FROM sakila.film
WHERE special_features LIKE '%Behind the Scenes%';


