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

drop table pr_sc;

select * from pr_fs
left join pr_sc
on pr_fs.profession = pr_sc.profession
group by pr_fs.profession
order by pr_fs.avg_fs, pr_sc.avg_sc;