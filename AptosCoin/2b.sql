SELECT count(distinct owner_address) AS aptosholder
FROM  aptos_mainnet.coin_balances 
WHERE coin_type = '0x1::aptos_coin::AptosCoin'
AND amount > 0
