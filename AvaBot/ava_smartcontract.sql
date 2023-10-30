/ * https://dune.com/queries/3149959 */
SELECT * FROM
  unnest(
    ARRAY[
    0x112dc295470aa6b5517023fdb6d7a31d34371570,
    0xe0c1941165001fafe9a771c484def2eddd042806,
    0x5ff137d4b0fdcd49dca30c7cf57e578a026d2789,
    0x6f6de0e3bd8ad5357897b8efd87d91759c9111d0,
    0x424a1245181564b2907476e317486c73dd4caaf2,
    0x05f792a441011a54ed6986c7b8721788cd74c81f,
    0xea846a724c3af8b013297755e46dca12cd04f1bc,
    0xcad89305ac247794442c505421c09decfeb651e2
    ],
    ARRAY[
    'account_creation',
    'router', 
    'entrypoint',
    'payfee', 
    'payfee', 
    'payfee',
    'payfee',
    'payfee'
    ]
  ) AS data(address,name);