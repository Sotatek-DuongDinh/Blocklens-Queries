SELECT 
  success,
  count(distinct block_hash) AS "Total transactions",
  count(distinct sender) AS "Total user"
FROM aptos_mainnet.user_transactions 
GROUP BY 1