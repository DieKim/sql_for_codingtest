/* 모든 레코드 조회하기 */
select *
from animal_ins
order by animal_id;

/* 최대값 구하기 */
/* 내 풀이 */
select datetime
from animal_ins
order by datetime desc
limit 1;
/* 문제 의도 */
select max(datetime)
from animal_ins;

/* 역순 정렬하기 */
select name, datetime
from animal_ins
order by animal_id desc;










