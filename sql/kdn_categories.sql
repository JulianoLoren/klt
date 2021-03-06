DROP TABLE IF EXISTS `default`.KDN_CATEGORIES;
  
CREATE TABLE `default`.KDN_CATEGORIES
(
    RETAILER_ID BIGINT
    ,CATEGORY_ID BIGINT
    ,QUANTITY DECIMAL(18,5)
    ,REVENUE DECIMAL(18,5)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
tblproperties('skip.header.line.count'='1'); 