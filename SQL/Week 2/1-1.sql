-- 문제 1 film 테이블을 활용하여, film 테이블의 100개의 row만 확인해보세요.

select *
from film
limit 100

-- 문제 2 actor의 성(last_name)이 Jo로 시작하는 사람의 id 값이 가장 낮은 한사람에 대하여, 사람의 id 값과 이름,성을 알려주세요.

select actor_id, first_name, last_name
from actor
where last_name like 'Jo%'
order by actor_id
limit 1

-- 문제 3 film 테이블을 이용하여, film 테이블의 아이디값이 1~10 사이에 있는 모든 칼럼을 확인

select *
from country 
where country like 'a%'

-- 문제 4 country 테이블을 이용하여, country 이름이 A로 시작하는 country를 확인해주세요.

select *
from country 
where country like 'a%'

-- 문제 5 country 테이블을 이용하여, country 이름이 s로 끝나는 country를 확인해주세요.

select *
from country
where country like '%s'

-- 문제 6 address 테이블을 이용하여, 우편번호(postal_code)값이  77로 시작하는 주소에 대하여, address_id,address,district,postal_code 칼럼을 확인해주세요.

select address_id,address,district,postal_code
from address
where postal_code like '77%'

-- 문제 7 address 테이블을 이용하여, 우편번호(postal_code)값이 두번째글자가 1인 우편번호의 address_id,address,district,postal_code 칼럼을 확인해주세요.
-- SUBSTRING('문자열', '시작지점', '길이')

select address_id,address,district,postal_code
from address
where substr(postal_code,2,1) = '1'

-- 문제 8 payment 테이블을 이용하여, 고객번호가 341에 해당 하는 사람이 결제를 2005년 6월 15~16일 사이에 한 모든 결제내역을 확인해주세요.

select *
from payment
where customer_id = 341
and date(payment_date) between '2005-06-15' and '2005-06-16'

-- 문제 9 payment 테이블을 이용하여, 고객번호가 355에 해당하는 사람의 결제 금액이 1~3원 사이에 해당하는 모든 결제 내역을 확인해주세요.

select *
from payment
where customer_id = '355'
and amount between '1' and '3'

-- 문제 10 customer 테이블을 이용하여, 고객의 이름이 Maria, Lisa, Mike에 해당하는 사람의 id,이름,성을 확인해주세요.
-- Maria, Lisa, Mike = first_name

select customer_id,first_name,last_name
from customer
where first_name in ('Maria','Lisa','Mike')


