-- 문제 11 film 테이블을 이용하여,  film의 길이가  100~120 에 해당하거나 또는 rental 대여기간이 3~5일에 해당하는 film 의 모든 정보를 확인해주세요.

select *
from film
where length between 100 and 120
or rental_duration between 3 and 5


-- 문제 12 address 테이블을 이용하여, postal_code 값이 공백('')이거나 35200, 17886 에 해당하는 address에 모든 정보를 확인해주세요.
-- in 을 사용해서 조건을 붙여준다.

select *
from address
where postal_code in (35200, 17886,'')

-- 문제 13 address 테이블을 이용하여, address의 상세주소 (=address2)값이 존재하지 않는 모든 데이터를 확인하여 주세요.
-- not null 을 이용

select *
from address
where address2 is not null

-- 문제 14 staff 테이블을 이용하여, staff 의  picture  사진의 값이 있는  직원의  id, 이름,성을 확인해주세요.  단 이름과 성을  하나의 컬럼으로 이름, 성의형태로  새로운 컬럼 name 컬럼으로 도출해주세요.

select staff_id, first_name || ' ' || last_name as name 
from staff
where picture is not null

-- 문제 15 rental 테이블을 이용하여,  대여는했으나 아직 반납 기록이 없는 대여건의 모든 정보를 확인해주세요.

select *
from rental
where return_date is null
