-- 1번 dvd 렌탈 업체의 dvd 대여가 있었던 날짜를 확인해주세요.
-- distinct = 중복을 제거한다. 대여가 있었던 날짜가 중복이 나오지 않게 제외 --

SELECT DISTINCT DATE(rental_date) 
FROM rental
