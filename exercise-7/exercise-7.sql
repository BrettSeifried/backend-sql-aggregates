-- customer ranking by total film time watched
-- similar to exercise 6

-- customer > rental > inventory > film(length)

SELECT
    email,
    RANK() OVER (ORDER BY SUM(length) DESC)
FROM
    customer
INNER JOIN
    rental
ON
    customer.customer_id = rental.customer_id
INNER JOIN
    inventory
ON
    inventory.inventory_id = rental.inventory_id
INNER JOIN
    film
ON
    film.film_id = inventory.film_id
GROUP by
    email;