-- 문제1번) 대여점(store)별 영화 재고(inventory) 수량과 전체 영화 재고 수량은? (grouping set)

SELECT store_id, count(*)
  FROM inventory i 
 GROUP BY  
 GROUPING SETS(
	(store_id), ()
    )
    
    
-- 문제2번) 대여점(store)별 영화 재고(inventory) 수량과 전체 영화 재고 수량은? (rollup)

select store_id, count(*)
from inventory i
group by store_id with rollup

mysql은 포스트그리와 차이가 있다. grouping sets를 지원하지않고  rollup은 with rollup 형식으로 작성해서 완성한다.

