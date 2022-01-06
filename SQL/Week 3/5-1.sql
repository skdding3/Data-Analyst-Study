-- 문제4번) 국가(country)별 도시(city)별 매출액, 국가(country)매출액 소계 그리고 전체 매출액을 구하세요. (rollup)

select country , city, sum(amount)
from payment p
inner join customer c on p.customer_id = c.customer_id
inner join address a on c.address_id = a.address_id
inner join city on city.city_id = a.city_id
inner join country on city.country_id = country.country_id
group by country,city with rollup
order by country,city


-- 문제5번) 영화배우별로  출연한 영화 count 수 와,   모든 배우의 전체 출연 영화 수를 합산 해서 함께 보여주세요.

select actor_id, count(*)
from film_actor
group by actor_id with rollup

-- 문제6번) 국가 (Country)별, 도시(City)별  고객의 수와 ,  전체 국가별 고객의 수를 함께 보여주세요. (grouping sets)

select country.country , city.city, count(distinct customer_id) count
from customer
inner join address on customer.address_id = address.address_id
inner join city on address.city_id = city.city_id
inner join country on city.country_id = country.country_id
group by country,city,country

-- 문제7번) 영화에서 사용한 언어와  영화 개봉 연도 에 대한 영화  갯수와  , 영화 개봉 연도에 대한 영화 갯수를 함께 보여주세요.

select language_id, release_year, count(film_id)
from film
group by language_id, release_year,release_year with rollup

-- ROLLUP 함수 : 소그룹 간의 소계를 계산함
