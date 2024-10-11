USE sakila;
#Write SQL queries to perform the following tasks using the Sakila database:
#List the number of films per category.

SELECT COUNT(title) AS number_of_films, name
FROM film
INNER JOIN film_category
USING (film_id)
INNER JOIN category
USING (category_id)
GROUP BY name
ORDER BY number_of_films DESC;

#Retrieve the store ID, city, and country for each store.
SELECT store_id, city, country
FROM  store
INNER JOIN address
USING (address_id)
INNER JOIN city
USING (city_id)
INNER JOIN country
USING (country_id);

#Calculate the total revenue generated by each store in dollars.
SELECT store_id, SUM(amount) AS total_revenue
FROM payment
INNER JOIN staff
USING (staff_id) 
INNER JOIN store
USING (store_id)
GROUP BY (store_id); 

#Determine the average running time of films for each category.
SELECT AVG(length) AS average_running_time, name
FROM film
INNER JOIN film_category
USING (film_id)
INNER JOIN category
USING (category_id)
GROUP BY name
ORDER BY average_running_time DESC;