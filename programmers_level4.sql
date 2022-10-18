/* 입양 시각 구하기(2) */
with recursive temp as (
    select 0 as hour
    union all
    select hour+1 from temp
    where hour<23
)
select hour, count(animal_outs.datetime) as count 
from temp
left join animal_outs
on temp.hour=hour(animal_outs.datetime)
group by hour
order by hour;

/* 우유와 요거트가 담긴 장바구니 */
/* 우유와 요거트가 담긴 장바구니 아이디 조회 */
select cart_id
from cart_products
where name in ('yogurt', 'milk')
group by cart_id
having count(distinct(name))=2
order by cart_id;

/* 보호소에서 중성화한 동물 */
/* 보호소에 들어올 땐 중성화 X, 나갈 땐 중성화 O 동물 조회 */
select i.animal_id, i.animal_type, i.name
from animal_ins as i
inner join animal_outs as o
on i.animal_id = o.animal_id
where i.sex_upon_intake like '%intact%' 
and (o.sex_upon_outcome like '%spayed%' 
or o.sex_upon_outcome like '%neutered%')
order by i.animal_id;