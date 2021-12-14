-- 2번 영화길이가 120분 이상이면서, 대여기간이 4일 이상이 가능한, 영화제목을 알려주세요.
-- 영화길이 (length) 대여기간 (rental_duration)은 4일이상 제목이 결과 값이므로 title을 select로 뽑는다.
-- length 와 rental_duration은 film 테이블에 있으니 from film으로 가져와준다.

select title
from film
where length >=120 and rental_duration >= 4

