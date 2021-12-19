-- 문제8번) 고객의 id 가  50,100,150 ..등 50번의 배수에 해당하는 고객들에 대해서, 회원 가입 감사 이벤트를 진행하려고합니다.
-- 고객 아이디가 50번 배수인 아이디와, 고객의 이름 (성, 이름)과 이메일에 대해서 확인해주세요.
-- (성, 이름) last_name, first_name as full name , 배수 50 mod는 나머지

select customer_id
   	 ,last_name ||', '|| first_name as fullname
   	 ,email
   	 ,mod(customer_id, 50) as mod_50
from custmoer
where mod(customer_id, 50) = 0;



-- 문제9번) 영화 제목의 길이가 8글자인, 영화 제목 리스트를 나열해주세요.
-- 제목 길이 8글자 char_length(title) 제목 글자 셀때 함수

select title
from film
where char_length(title) = 8

-- 문제 10번) city 테이블의 city 갯수는 몇개인가요?
select count{distinct(city ||', '|| country_id)}
from city;

-- 문제 11번) 영화배우의 이름 (이름+' '+성) 에 대해서,  대문자로 이름을 보여주세요.  단 고객의 이름이 동일한 사람이 있다면,  중복 제거하고, 알려주세요.
-- 대문자를 유의한다.

select distinct upper(first_name ||' '|| last_name)
from actor

-- 문제 12번 ) 고객 중에서,  active 상태가 0 인 즉 현재 사용하지 않고 있는 고객의 수를 알려주세요.

select count(*)
from customer c
where c.active =0;
