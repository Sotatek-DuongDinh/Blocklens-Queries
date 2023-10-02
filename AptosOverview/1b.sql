SELECT
  block_time,
  count(*) as transactions,
  sum(count(*)) over ( 
                order by 
                    block_time 
            ) as total_transaction
FROM  aptos_mainnet.user_transactions 
GROUP BY block_time
ORDER BY 1 DESC
LIMIT 100

