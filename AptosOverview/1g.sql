with a as 
(select
sender,
count(DISTINCT HASH) as transactions 
FROM aptos_mainnet.user_transactions 
WHERE block_time > DATE('2022-01-01')
group by 1
order by 2)
select 
count(DISTINCT sender) as total_addresses,
case when transactions between 1 and 2 then '1-2'
 when transactions between 2 and 10 then '2-10'
 when transactions >10 then 'more than 10' end as number 
from a
group by 2 order by 1 desc