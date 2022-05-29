create temporary table pr_fs
select profession, round(avg(family_size),2) as avg_fs
from general_data
group by profession
order by profession;

drop table pr_fs;

create temporary table pr_sc
select profession, round(avg(Spending_Score_encoded),2) as avg_sc
from general_data
group by profession
order by profession;

select * from pr_sc;
drop table pr_sc;


SELECT prf.profession as profession , prf.avg_fs as avg_fs, prs.avg_sc as avg_sc
FROM pr_fs prf
CROSS JOIN pr_sc prs
on prf.profession = prs.profession
order by avg_fs;
