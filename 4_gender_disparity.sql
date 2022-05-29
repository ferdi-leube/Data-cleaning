create database if not exists project_3_newmarkets;
use project_3_newmarkets;
select * from general_data;

# gender disparity in different professions

create temporary table gender_disparity(
select Profession, gender, count(ID) as count
from general_data
group by profession, gender
order by profession)
;
select * from gender_disparity;

# go profession by profession
# all professions -->

create temporary table profession_selected (
select * from gender_disparity
where Profession = 'Homemaker');

select * from profession_selected;
drop table profession_selected;

# in percentage
select profession 
from gender_disparity;

SELECT profession, gender, count, 
 count*100 / (SELECT sum(count) from gender_disparity where profession = 'Homemaker') AS pct 
 FROM profession_selected
 GROUP BY profession, gender
 ORDER BY profession;


