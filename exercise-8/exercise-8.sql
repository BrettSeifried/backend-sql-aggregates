-- rank of film category by times rented
-- include the name, count, and rank

--category(name) > film_category > film > inventory > rental(rental_id)

SELECT  
    name,
    COUNT(rental_id) AS count,
    RANK() OVER (ORDER BY COUNT(rental_id) DESC)
FROM
    category
INNER JOIN
    film_category
ON
    film_category.category_id = category.category_id
INNER JOIN
    film
ON
    film.film_id = film_category.film_id
INNER JOIN
    inventory
ON
    inventory.film_id = film.film_id
INNER JOIN
    rental
ON
    rental.inventory_id = inventory.inventory_id
GROUP BY
    name;