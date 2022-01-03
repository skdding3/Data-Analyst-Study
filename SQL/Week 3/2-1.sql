-- 문제 1 매출을 가장 많이 올린 dvd 고객 이름은? (subquery 활용)

select first_name, last_name
from customer c
join (select customer_id, sum(amount) as sum_amount,
		     row_number() over(order by sum(amount) desc) as rnum
             from payment
             group by customer_id) as t1
on c.customer_id = t1.customer_id
where rnum = 1

-- 문제 2 대여가 한번도이라도 된 영화 카테 고리 이름을 알려주세요. (쿼리는, Exists조건을 이용하여 풀어봅시다)

select c.category_id, c.name
from category c
where exists(
	select 1
	from rental r , inventory i , film_category fc
    where r.inventory_id = i.inventory_id
    and i.film_id = fc.film_id
    and fc.category_id = c.category_id
    )
    
-- 문제 3 대여가 한번도이라도 된 영화 카테 고리 이름을 알려주세요. (쿼리는, Any 조건을 이용하여 풀어봅시다)

select c.category_id, c.name
from category c
where c.category_id = any(
	select fc.category_id
    from rental r , inventory i, film_category fc
    where r.inventory_id = i.inventory_id
    and i.film_id = fc.film_id
    and fc.category_id = c.category_id
    )
