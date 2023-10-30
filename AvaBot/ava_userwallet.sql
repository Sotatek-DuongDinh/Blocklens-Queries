/* Test*/
 select  bytearray_substring(topic1,13,20) as wallet
 from goerli.logs 
 where 
    block_date > date('2023-10-22')
 and contract_address = 0x112dc295470aa6b5517023fdb6d7a31d34371570 
 and topic0 = 0x8967dcaa00d8fcb9bb2b5beff4aaf8c020063512cf08fbe11fec37a1e3a150f2