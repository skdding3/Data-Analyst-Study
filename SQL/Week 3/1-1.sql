-- 문제 ) 영화 배우가,  영화 180분 이상의 길이 의 영화에 출연하거나, 영화의 rating 이 R 인 등급에 해당하는 영화에 출연한  영화 배우에 대해서,  영화 배우 ID 와 (180분이상 / R등급영화)에 대한 Flag 컬럼을 알려주세요.

select distinct a.actor_id, 'over_180' as flag
from actor a
	join film_actor fa on a.actor_id = fa.actor_id
    join film f on fa.film_id = f.film_id
where f.length >= 180

union

select distinct a.actor_id, 'R' as flag
from actor a
	join film_actor fa on a.actor_id = fa.actor_id
    join film f on fa.film_id = f.film_id
where f.rating = 'R'

-- 문제13번) 고객 등급별 고객 수를 구하세요. (대여 금액 혹은 매출액  에 따라 고객 등급을 나누고 조건은 아래와 같습니다.)
/*
A 등급은 151 이상
B 등급은 101 이상 150 이하
C 등급은   51 이상 100 이하
D 등급은   50 이하

- 대여 금액의 소수점은 반올림 하세요.

HINT
반올림 하는 함수는 ROUND 입니다.	
*/

select c1.rating, count(c1.customer_id)
from (
	select customer_id, sum(amount),
    case when round(sum(amount)) >= 151 then 'A'
         when round(sum(amount)) between 101 and 150 then 'B'
         when round(sum(amount)) between 51 and 100 then 'C'
         else 'D' end as rating
         from payment
         group by customer_id) as c1
group by c1.rating
