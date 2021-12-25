-- 문제4번) rental 정보에 추가로, 고객의 이름과, 직원의 이름을 함께 보여주세요.
-- 고객의 이름, 직원 이름은 이름과 성을 fullname 컬럼으로만들어서 직원이름/고객이름 2개의 컬럼으로 확인해주세요.

select rental.*,customer.first_name,customer.last_name,staff.first_name,staff.last_name
from rental
join customer on rental.customer_id = customer.customer_id
join staff on rental.staff_id = staff.staff_id

-- 문제5번) seth.hannon@sakilacustomer.org 이메일 주소를 가진 고객의  주소 address, address2, postal_code, phone, city 주소를 알려주세요.

select address.address, address.address2, address.postal_code, address.phone, city.city
from customer
join address on customer.address_id = address.address_id
join city on address.city_id = city.city_id
where customer.email = 'seth.hannon@sakilacustomer.org'

-- 문제6번) Jon Stephens 직원을 통해 dvd대여를 한 payment 기록 정보를  확인하려고 합니다.
-- payment_id,  고객 이름 과 성,  rental_id, amount, staff 이름과 성을 알려주세요.

select payment_id,
customer.first_name, customer.last_name ,
payment.rental_id,  payment.amount,

  staff.first_name, staff.last_name

from payment
join customer  on payment.customer_id = customer.customer_id
join staff     on payment.staff_id = staff.staff_id
where staff.first_name ='Jon'
and staff.last_name ='Stephens'

