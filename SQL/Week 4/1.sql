analytic function

분석함수 참조 : http://www.gurubee.net/lecture/2671


-- 문제1번) dvd 대여를 제일 많이한 고객 이름은? (analytic funtion 활용)

SELECT c.first_name
     , c.last_name
     , r.customer_id
     , ROW_NUMBER () OVER (ORDER BY count(*)DESC) AS RENTAL_RANK
  FROM rental r
 INNER JOIN customer c ON r.customer_id = c.customer_id 
 GROUP BY r.customer_id 
 ORDER BY RENTAL_RANK
 LIMIT 1;
 
 -- 문제2번) 매출을 가장 많이 올린 dvd 고객 이름은? (analytic funtion 활용)

SELECT c.first_name
     , c.last_name
     , r.customer_id
     , ROW_NUMBER () OVER (ORDER BY sum(p.amount)DESC) AS pay_rank
  FROM customer c
 INNER JOIN rental r ON c.customer_id = r.customer_id 
 INNER JOIN payment p ON r.rental_id = p.rental_id
 GROUP BY c.customer_id
 LIMIT 1;
 
-- 문제3번) dvd 대여가 가장 적은 도시는? (analytic funtion)

SELECT city.city, ROW_NUMBER() OVER (ORDER BY count(*)), count(*)
FROM rental r
INNER JOIN customer c ON r.customer_id = c.customer_id
INNER JOIN address a ON c.address_id = a.address_id
INNER JOIN city ON a.city_id = city.city_id
GROUP BY city.city
LIMIT 1;

-- 문제4번) 매출이 가장 안나오는 도시는? (analytic funtion)

select c.city,row_number() over(order by sum(p.amount)), sum(p.amount)
from city c
inner join address a on c.city_id = a.city_id
inner join customer c2 on a.address_id = c2.address_id
inner join rental r on c2.customer_id = r.customer_id
inner join payment p on r.rental_id = p.payment_id 
group by c.city
limit 1;


-- 문제 5번) 월별 매출액을 구하고 이전 월보다 매출액이 줄어든 월을 구하세요. (일자는 payment_date 기준)

select *
from(
	select coalesce(lag(sum(amount), 1) over(order by extract(month from date(payment_date))), 0) as pre_mon_amount,
		extract(year from date(payment_date)) as yr,
		extract(month from date(payment_date)) as mon,
        sum(amount),
        sum(amount) - coalesce(lag(sum(amount), 1) over(order by extract(month from date(payment_date))), 0) as gap
	    from payment
		group by extract(year from date(payment_date)),
		extract(month from date(payment_date))) as t1
where t1.gap < 0;


-- mysql은 coalesce를 select앞에 붙여줘서 풀어줬다.
