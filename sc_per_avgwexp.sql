# corolation between spending score and avg working experience in certain profession
select Spending_Score, round(avg(Work_Experience),2) as avg_we, Spending_Score_encoded
from general_data
where profession = 'Lawyer'
group by Spending_Score
order by Spending_Score_encoded;