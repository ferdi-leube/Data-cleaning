use project_3_newmarkets;

# spending score of a certain profession based on family size 

create temporary table spending_score (
select  family_size, spending_score, count(id) as number_of_people
from general_data
where profession = 'Artist'
group by  family_size, spending_score
order by family_size)
;


select * from spending_score;

# profession by profession

create temporary table family_sizeselec (
select * from spending_score
where family_size = 1 );

select * from family_sizeselec;

# in percentage

SELECT family_size, spending_score, number_of_people,
 number_of_people*100 / (SELECT sum(number_of_people) from spending_score where family_size = 1) AS pct 
 FROM  family_sizeselec
 GROUP BY family_size, spending_score
 ORDER BY family_size;