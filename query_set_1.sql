SELECT
  f.title AS "film_title",
  COUNT(rental_id) AS "number of rentals ",
  f.rental_rate AS "rental prices",
  COUNT(r.rental_id) * f.rental_rate AS revenue
FROM film f,
     inventory i,
     rental r
WHERE f.film_id = i.film_id
AND i.inventory_id = r.inventory_id
GROUP BY 1
ORDER BY 4 DESC;

SELECT
  p.customer_id,
  SUM(p.amount)
FROM payment p
GROUP BY 1
ORDER BY 2 DESC;

SELECT
  c.first_name,
  c.last_name,
  c.customer_id,
  SUM(p.amount)
FROM payment p,
     customer c
WHERE p.customer_Id = c.customer_id
GROUP BY 1,
         2,
         3
ORDER BY 4 DESC;


SELECT
  i.store_id,
  SUM(p.amount)
FROM payment p,
     inventory i,
     rental r
WHERE r.inventory_id = i.inventory_id
AND r.rental_id = p.rental_id
GROUP BY 1
ORDER BY 2 DESC;

SELECT
  LEFT(r.rental_date, 7),
  COUNT(r.rental_id)
FROM rental r
GROUP BY 1
ORDER BY 2;

SELECT
  f.title,
  MAX(r.rental_date),
  MIN(r.rental_date)
FROM film f,
     rental r,
     inventory i
WHERE f.film_id = i.film_id
AND r.inventory_id = i.inventory_id
GROUP BY 1;


SELECT
  concat(c.first_name, " ", c.last_name),
  c.email,
  MAX(r.rental_date)
FROM rental r,
     customer c
WHERE c.customer_id = r.customer_id
GROUP BY c.customer_id;



SELECT
  LEFT(p.payment_date, 7),
  SUM(p.amount)
FROM payment p
GROUP BY 1;


SELECT
  LEFT(r.rental_date, 7),
  COUNT(DISTINCT i.film_id),
  COUNT(r.rental_id),
  COUNT(r.rental_id) / COUNT(DISTINCT i.film_id)
FROM inventory i,
     rental r
WHERE r.inventory_id = i.inventory_id
GROUP BY 1;


SELECT
  c.name,
  COUNT(r.rental_id)
FROM rental r,
     inventory i,
     film f,
     category c,
     film_category fc
WHERE r.inventory_id = i.inventory_id
AND f.film_id = i.film_id
AND fc.category_id = c.category_id
AND c.name IN ("family", "sports", "comedy")
GROUP BY 1;

SELECT
  r.customer_id,
  COUNT(r.rental_id)
FROM rental r
GROUP BY 1
HAVING COUNT(r.rental_id) >= 3;



SELECT
  concat(a.first_name, " ", a.last_name),
  COUNT(r.rental_id),
  SUM(p.amount),
  COUNT(fa.film_id)
FROM actor a,
     film_actor fa,
     inventory i,
     rental r,
     payment p
WHERE a.actor_id = fa.actor_id
AND fa.film_id = i.film_id
AND i.inventory_id = r.inventory_id
AND r.rental_id = p.rental_id
GROUP BY 1
ORDER BY 3 DESC;


SELECT
  f.film_id,
  COUNT(r.rental_id) * f.rental_rate AS revanue
FROM rental r,
     inventory i,
     film f
WHERE r.inventory_id = i.inventory_id
AND i.film_id = f.film_id
GROUP BY 1;

SELECT
  a.actor_id,
  concat(a.first_name, "", a.last_name),
  SUM(fr.revanue)
FROM actor a,
     film_actor fc,
     film_rev fr
WHERE a.actor_id = fc.actor_id
AND fc.film_id = fr.film_id
GROUP BY 1;