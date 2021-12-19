-- 문제5번) 영화 카테고리 중에서 ,Sci-Fi  카테고리의  카테고리 번호는 몇번인가요?
-- 카테고리 (category) 카테고리 번호 (category_id) 추출 , Sci-fi 카테고리


select category_id
from category
where name ='Sci-Fi'


-- 문제6번) film 테이블을 활용하여, rating  등급(?) 에 대해서, 몇개의 등급이 있는지 확인해보세요.

select distinct rating
from film

-- 문제7번) 대여 기간이 (회수 - 대여일) 10일 이상이였던 rental 테이블에 대한 모든 정보를 알려주세요.
-- 단 , 대여기간은  대여일자부터 대여기간으로 포함하여 계산합니다.

select *,  date(return_date) - date(rental_date) +1 
					as diff_date
where date(return_date) - date(rental_date) +1 >=10
