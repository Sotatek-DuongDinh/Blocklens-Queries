WITH 
    NEW_SENDERS AS ( 
        SELECT 
            sender, 
            min(date(block_time)) as first_tx, 
            count(distinct (date(block_time))) as days_active, 
            count(distinct hash) as tx_performed
        FROM 
             aptos_mainnet.transactions
        WHERE 
            block_time > DATE('2022-01-01') 
        GROUP BY 
            1 
    ), 
    TOTAL_NEW_USERS AS ( 
        SELECT 
            first_tx, 
            count(distinct sender) as new_user,
            sum(count(distinct sender)) over ( 
                order by 
                    first_tx 
            ) as total_new 
        FROM 
            NEW_SENDERS 
        GROUP BY 
            1 
    ) 
SELECT 
    *
FROM TOTAL_NEW_USERS 
ORDER BY 
    1 DESC
LIMIT 100