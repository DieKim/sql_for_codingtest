/* 오랜 기간 보호한 동물(1) */
/* 입양을 못 간 동물 중 가장 오래 보호소에 있던 동물 3마리 */
select i.name, i.datetime
from animal_ins as i
left join animal_outs as o
on i.animal_id=o.animal_id
where o.animal_id is null /* 입양을 못 갔다 = 입양 기록에 없다 */
order by datetime
limit 3;

/* 오랜 기간 보호한 동물(2) */
/* 입양을 간 동물 중 보호기간이 가장 길었던 동물 2마리 */
select i.animal_id, i.name
from animal_ins as i
inner join animal_outs as o
on i.animal_id=o.animal_id
order by i.datetime-o.datetime /* 보호기간=입양날짜-입소날짜 */
limit 2;

/* 있었는데요 없었습니다 */
/* 보호시작일보다 입양일이 더 빠른 동물 조회 */
select i.animal_id, i.name
from animal_ins as i
join animal_outs as o
on i.animal_id = o.animal_id
where i.datetime > o.datetime
order by i.datetime;

/* 없어진 기록 찾기 */
/* 입양 간 기록은 있는데 보호소 기록이 없는 동물 조회 */
select o.animal_id, o.name
from animal_outs as o
left join animal_ins as i
on o.animal_id = i.animal_id
where i.animal_id is null
order by o.animal_id;

/* 헤비 유저가 소유한 장소 */
/* 헤비유저가 등록한 공간 아이디 순 조회 */
select id, name, host_id
from places 
where host_id = any(select host_id
                    from places 
                    group by host_id
                    having count(host_id) >= 2
                    )
order by id;