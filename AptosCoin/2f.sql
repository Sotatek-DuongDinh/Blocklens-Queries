WITH 
apt AS 
(SELECT 
  date,
  AVG(price) as aptos_price
FROM aptos_mainnet.price_histories 
WHERE token_address = '0x1::aptos_coin::AptosCoin'
GROUP BY 1
),
cake AS 
(SELECT 
  date,
  AVG(price) as cake_price
FROM aptos_mainnet.price_histories 
WHERE token_address = '0x159df6b7689437016108a019fd5bef736bac692b6d4a1f10c941f6fbb9a74ca6::oft::CakeOFT'
GROUP BY 1
),
thala AS 
(SELECT 
  date,
  AVG(price) as thala_price
FROM aptos_mainnet.price_histories 
WHERE token_address = '0x7fd500c11216f0fe3095d0c4b8aa4d64a4e2e04f83758462f2b127255643615::thl_coin::thl'
GROUP BY 1
),
checkdot AS 
(SELECT 
  date,
  AVG(price) as checkdot_price
FROM aptos_mainnet.price_histories 
WHERE token_address = '0xb366c7c4521277846a7fee4f3bcc92c435089537d30390d8854ca31addfbae4f::CdtCoin::CDT'
GROUP BY 1
),
bluemove AS 
(SELECT 
  date,
  AVG(price) as bluemove_price
FROM aptos_mainnet.price_histories 
WHERE token_address = '0x27fafcc4e39daac97556af8a803dbb52bcb03f0821898dc845ac54225b9793eb::move_coin::MoveCoin'
GROUP BY 1
)

SELECT 
  apt.date,
  apt.aptos_price,
  cake.cake_price
FROM apt
JOIN cake
ON apt.date = cake.date
LIMIT 50
