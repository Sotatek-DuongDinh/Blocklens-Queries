WITH coin as 
(SELECT 
  block_time,
  count(*)
FROM aptos_mainnet.coin_activities 
GROUP BY 1),
nft as (
SELECT 
  block_time,
  count(*)
FROM aptos_mainnet.token_activities  
GROUP BY 1)

SELECT *
FROM coin 
LEFT JOIN nft ON coin.block_time = nft.block_time
ORDER BY 1 DESC
LIMIT 20
