-- 문제 11번) Horror 카테고리 장르에 해당하는 영화의 이름과 description 에 대해서 알려주세요

select title,description
from film
join film_category on film.film_id = film_category.film_id
join category on film_category.category_id = category.category_id
where category.name = 'Horror';

-- 문제12번) Music 장르이면서, 영화길이가 60~180분 사이에 해당하는 영화의 title, description, length 를 알려주세요.

-- 영화 길이가 짧은 순으로 정렬해서 알려주세요.

select title,description,length
from film
join film_category on film.film_id = film_category.film_id
join category on film_category.category_id = category.category_id
where category.name = 'Music'
and film.length between 60 and 180
order by film.length;

-- 문제13번) actor 테이블을 이용하여,  배우의 ID, 이름, 성 컬럼에 추가로    'Angels Life' 영화에 나온 영화 배우 여부를 Y , N 으로 컬럼을 추가 표기해주세요.  해당 컬럼은 angelslife_flag로 만들어주세요.

SELECT a.actor_id, a.first_name, a.last_name,
	CASE WHEN a.actor_id = feat_actor.actor_id THEN 'Y'
		ELSE 'N' 
	END AS angelslife_flag
FROM actor a
LEFT JOIN (
	SELECT f.film_id, f.title, fa.actor_id 
	FROM film_actor fa
	JOIN film f ON fa.film_id = f.film_id
	WHERE f.title = 'Angels Life'
	) AS feat_actor ON a.actor_id = feat_actor.actor_id;
  
