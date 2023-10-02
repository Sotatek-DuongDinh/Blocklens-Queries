WITH 
    new_user AS ( 
        SELECT 
            sender, 
            min(date(block_time)) as first_tx, 
            count(distinct (date(block_time))) as days_active, 
            count(distinct hash) as tx_performed
        FROM 
              aptos_mainnet.user_transactions 
        WHERE 
            block_time > DATE('2022-01-01') 
        GROUP BY 1 
    ),
    daily_user AS(
      SELECT 
        block_time,
        COUNT(DISTINCT sender) as all_user
      FROM aptos_mainnet.user_transactions 
      WHERE 
            block_time > DATE('2022-01-01') 
      GROUP BY 1
    ),
    daily_new_user AS(SELECT 
        first_tx, 
        count(distinct sender) as new_user
    FROM 
        new_user 
    GROUP BY 
        1 )
SELECT 
  block_time as Date,
  new_user,
  all_user - new_user AS old_user, 
  new_user*100.00 / all_user as NewUser,
  (all_user - new_user)*100.00 / all_user AS OldUser
FROM daily_user
JOIN daily_new_user ON daily_user.block_time = daily_new_user.first_tx
ORDER BY 1 DESC
LIMIT 100
