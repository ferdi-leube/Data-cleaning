
# graduat status of perfession

create temporary table grad_stat (
select profession, graduated, count(ID) as number_of_people
from general_data
group by profession, graduated
order by profession, graduated)
;

select * from grad_stat;


# profession by profession

create temporary table profession_sel (
select * from grad_stat
where Profession = 'Artist');

select * from profession_sel;

# in percentage

SELECT profession, Graduated, number_of_people, 
 number_of_people*100 / (SELECT sum(number_of_people) from grad_stat where profession = 'Artist') AS pct 
 FROM profession_sel 
 GROUP BY profession, graduated
 ORDER BY profession;