WITH 

holder AS 
(SELECT 
  info.coin_type,
  info.name,
  COUNT(bl.owner_address) as holder
FROM  aptos_mainnet.coin_infos as info
LEFT JOIN  aptos_mainnet.coin_balances bl 
ON info.coin_type = bl.coin_type
GROUP BY 1,2
),
pr AS (
  SELECT 
    token_address,
    AVG(price) as pri 
  FROM aptos_mainnet.prices
  GROUP BY 1
)
SELECT holder.coin_type,holder.name,holder.holder, pr.pri
FROM holder 
LEFT JOIN pr
ON holder.coin_type = pr.token_address
WHERE holder.name != ''
AND pr.pri > 0
ORDER BY 3 DESC 