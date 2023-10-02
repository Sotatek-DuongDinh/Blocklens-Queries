 SELECT 
  block_time,
  count(*) as Holder
 FROM aptos_mainnet.coin_balance_histories 
 WHERE coin_type = '0x1::aptos_coin::AptosCoin'
 GROUP BY 1
 ORDER BY 1 DESC 
 LIMIT 50