-- 문제1번) dvd 대여를 제일 많이한 고객 이름은?   (with 문 활용)

with mc as(
select r.customer_id
from rental r
group by customer_id
order by count(*) desc
limit 1
)
select c.first_name, c.last_name
from customer c, mc
where c.customer_id = mc.customer_id


-- 문제2번) 영화 시간 유형 (length_type)에 대한 영화 수를 구하세요.
영화 상영 시간 유형의 정의는 다음과 같습니다.
영화 길이 (length) 은 60분 이하 short , 61분 이상 120분 이하 middle , 121 분이상 long 으로 한다.

with flt as (
    select(CASE
        when f.length <= 60 then 'short'
        when f.length <= 61 and f.length <= 120 then 'middle'
        when f.length <= 121 then 'long'
        end) fl
    from film f 
)
select fl, count(*)
from flt
GROUP BY fl;
