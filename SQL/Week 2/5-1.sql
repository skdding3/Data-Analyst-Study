-- 문제7번) 배우가 출연하지 않는 영화의 film_id, title, release_year, rental_rate, length 를 알려주세요.

select fi.film_id, fi.title, fi.release_year, fi.rental_rate, fi.length 
  from film fi
  left join film_actor fa
    on fi.film_id = fa.film_id
 where fa.film_id is null ;
 
 -- 문제8번) store 상점 id별 주소 (address, address2, distict) 와 해당 상점이 위치한 city 주소를 알려주세요.
 
 select store_id, address, address2, district, city
 from store
 left outer join address on store.address_id = address.address_id
 left outer join city on address.city_id = city.city_id
 
 -- 문제9번) 고객의 id 별로 고객의 이름 (first_name, last_name), 이메일, 고객의 주소 (address, district), phone번호, city, country 를 알려주세요.

select customer.first_name, customer.last_name, customer.email, address.phone, country.country, city.city
from customer
join address on customer.address_id = address.address_id
join city on address.city_id = city.city_id
join country on city.country_id = country.country_id
where country.country not in ('China')

-- 문제10번) country 가 china 가 아닌 지역에 사는, 고객의 이름(first_name, last_name)과 , email, phonenumber, country, city 를 알려주세요

select c.first_name || ' ' || c.last_name as 이름, c.email, a.phone, cn.country, ct.city 
  from customer c 
 inner join address a
    on c.address_id = a.address_id
 inner join city ct
 	on a.city_id = ct.city_id
 inner join country cn
 	on ct.country_id = cn.country_id
 where cn.country != 'china';

