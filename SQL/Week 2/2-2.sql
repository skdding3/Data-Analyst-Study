-- 문제16번) address 테이블을 이용하여, postal_code 값이  빈 값(NULL) 이거나 35200, 17886 에 해당하는 address 에 모든 정보를 확인해주세요.

select *
from address
where postal_code is null or postal_code in ('35200','17886')

-- 문제17번) 고객의 성에 John 이라는 단어가 들어가는, 고객의 이름과 성을 모두 찾아주세요.

select first_name, last_name
from customer
where last_name like '%John%'

-- 문제18번) 주소 테이블에서, address2 값이 null 값인 row 전체를 확인해볼까요?

select *
from address
where address2 is null
