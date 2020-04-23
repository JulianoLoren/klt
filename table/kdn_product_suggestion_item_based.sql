DROP TABLE IF EXISTS `default`.KDN_PRODUCT_SUGGESTION_ITEM_BASED;
  
CREATE TABLE `default`.KDN_PRODUCT_SUGGESTION_ITEM_BASED
(
    ITEM STRING
    ,RECOMMENDED_ITEM STRING
    ,COUNT_COMMON_USERS BIGINT
    ,EXPECTED_COMMON_USERS DECIMAL(18,5)
    ,SCORE DECIMAL(18,5)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE 
tblproperties('skip.header.line.count'='1'); 