
select 
  exchange_name,
  SUM(CASE
    WHEN from_token_address = '0x1::aptos_coin::AptosCoin' THEN quantity_in
    WHEN to_token_address = '0x1::aptos_coin::AptosCoin'THEN quantity_out
  END)/pow(10,8) AS APT
from  aptos_mainnet.dex_swaps 
group by 1 