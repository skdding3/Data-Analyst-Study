-- 문제1번) 고객의 기본 정보인, 고객 id, 이름, 성, 이메일과 함께 고객의 주소 address, district, postal_code, phone 번호를 함께 보여주세요.

 select customer_id, first_name, last_name, email,address,district,postal_code,phone
 from customer
 join address on customer.address_id = address.address_id


-- 문제 2) 고객의  기본 정보인, 고객 id, 이름, 성, 이메일과 함께 고객의 주소 address, district, postal_code, phone , city 를 함께 알려주세요. 		

 select customer_id, first_name, last_name, email,address,district,postal_code,phone,city
 from customer
 join address on customer.address_id = address.address_id
 join city on address.city_id = city.city_id
 
-- 문제 3)Lima City에 사는 고객의 이름과, 성, 이메일, phonenumber에 대해서 알려주세요. 	

select customer_id, first_name, last_name, email, phone, city
from customer
join address on customer.address_id = address.address_id
join city on  address.city_id = city.city_id
where city.city ='Lima'
