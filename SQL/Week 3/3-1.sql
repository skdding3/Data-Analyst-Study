-- 문제4번) 대여가 가장 많이 진행된 카테고리는 무엇인가요? (Any, All 조건 중 하나를 사용하여 풀어봅시다)

SELECT "name"
  FROM category c 
 INNER JOIN (SELECT fc.category_id, count(*) AS cn
			   FROM rental r
			  INNER JOIN inventory i ON i.inventory_id = r.inventory_id
			  INNER JOIN film f ON f.film_id = i.film_id
			  INNER JOIN film_category fc ON fc.film_id = f.film_id
			  GROUP BY fc.category_id
			 ) A ON c.category_id = A.category_id
 WHERE A.cn >= ALL(SELECT count(*)						
					  FROM rental r
					 INNER JOIN inventory i ON i.inventory_id = r.inventory_id
					 INNER JOIN film f ON f.film_id = i.film_id
					 INNER JOIN film_category fc ON fc.film_id = f.film_id
 					 GROUP BY fc.category_id)
    
-- 문제5번) dvd 대여를 제일 많이한 고객 이름은? (subquery 활용)

SELECT c.first_name, c.last_name 
  FROM customer c 
 WHERE c.customer_id =(SELECT r.customer_id
					     FROM rental r
					    GROUP BY customer_id
					    ORDER BY count(*) desc 
					    LIMIT 1) 
             
-- 문제6번) 영화 카테고리값이 존재하지 않는 영화가 있나요?

SELECT f.title 
  FROM film f
 WHERE NOT EXISTS (
 		SELECT 1
 		  FROM film_category fc 
 		 WHERE f.film_id = fc.film_id 
 )
