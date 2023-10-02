select 
  block_time,
  sum(amount)/100000000.00 as APT
from  aptos_mainnet.coin_activities 
where coin_type = '0x1::aptos_coin::AptosCoin'
group by 1 
order by 1 DESC
limit 20