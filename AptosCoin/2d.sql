SELECT 
  price,
  price * 237499242 as mkc
FROM  aptos_mainnet.prices 
WHERE token_address = '0x1::aptos_coin::AptosCoin'
ORDER BY timestamp DESC
LIMIT 1