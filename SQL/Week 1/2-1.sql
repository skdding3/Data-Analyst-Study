-- 문제 3 직원의 id가 2번인 직원의 id, 이름, 성을 알려주세요

select staff_id , first_name, last_name -- 조건을 충족하는 데이터만 출력
from staff
where staff_id = 2;
