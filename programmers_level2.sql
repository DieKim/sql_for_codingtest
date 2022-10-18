/* 최소값 구하기 */
select min(datetime) as 시간
from animal_ins;

/* 동물 수 구하기 */
select count(*)
from animal_ins;

/* 중복 제거하기 */
select count(distinct(name))
from animal_ins
where name is not null;

/* 동명 동물 수 찾기 */
select name, count(name) as COUNT
from animal_ins
group by name
having count(name) >= 2
order by name;

/* 고양이와 개는 몇 마리 있을까 */
select animal_type, count(animal_type)
from animal_ins
group by animal_type
order by animal_type asc;

/* 이름에 el이 들어가는 동물 찾기 */
select animal_id, name
from animal_ins
where animal_type='dog' and name like '%el%'
order by name;

/* 루시와 엘라 찾기 */
select animal_id, name, sex_upon_intake
from animal_ins
where name in ('lucy', 'ella', 'pickle', 'rogan', 'sabrina', 'mitty')
order by animal_id;

/* 입양 시각 구하기(1) */
select hour(datetime) as hour, count(*)
from animal_outs
group by hour(datetime)
having hour>=9 and hour<=19
order by hour;

/* 중성화 여부 파악하기 */
select animal_id, name, 
			 if(sex_upon_intake like '%neutered%' 
       or sex_upon_intake like '%spayed%', 'O','X') as 중성화
from animal_ins
order by animal_id;

/* NULL 처리하기 */
select animal_type, 
       ifnull(name, 'No name'), 
       sex_upon_intake
from animal_ins;

/* DATETIME에서 DATE로 형 변환 */
select animal_id, name, date_format(datetime, '%Y-%m-%d') as 날짜
from animal_ins
order by animal_id;