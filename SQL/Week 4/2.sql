-- 문제6번 도시별 dvd 대여 매출 순위를 구하세요.

SELECT c.city, ROW_NUMBER() OVER (ORDER BY SUM(p.amount) desc), sum(p.amount)
  FROM city c 
 INNER JOIN address a ON c.city_id = a.city_id 
 INNER JOIN customer c2 ON a.address_id = c2.address_id 
 INNER JOIN rental r ON c2.customer_id = r.customer_id 
 INNER JOIN payment p ON r.rental_id = p.rental_id 
GROUP BY c.city ;

-- 문제7번) 대여점별 매출 순위를 구하세요.

SELECT s.store_id , ROW_NUMBER() OVER (ORDER BY sum(p.amount) DESC) , sum(p.amount)
  FROM staff s 
 INNER JOIN rental r ON s.staff_id = r.staff_id 
 INNER JOIN payment p ON r.rental_id = p.rental_id 
 GROUP BY s.store_id 
 
 
 -- 문제8번) 
 
SELECT country, RPC, first_name, last_name 
  FROM (
	SELECT max(c3.country) AS country
		 , ROW_NUMBER() over(PARTITION BY max(c3.country) ORDER BY sum(p.amount) DESC) AS RPC
		 , c.first_name, c.last_name 
		 , sum(p.amount)
	  FROM customer c
	 INNER JOIN address a ON c.address_id = a.address_id 
	 INNER JOIN city c2 ON a.city_id = c2.city_id 
	 INNER JOIN country c3 ON c2.country_id = c3.country_id 
	 INNER JOIN rental r ON c.customer_id = r.customer_id 
	 INNER JOIN payment p ON r.rental_id = p.rental_id 
	 GROUP BY c.customer_id
	 ) db
WHERE RPC <= 5;
