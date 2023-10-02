SELECT COUNT(DISTINCT transaction_version)
FROM  aptos_mainnet.coin_activities 
WHERE coin_type = '0x1::aptos_coin::AptosCoin'
