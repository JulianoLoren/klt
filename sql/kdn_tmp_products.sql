DROP TABLE IF EXISTS `default`.KDN_TMP_PRODUCTS;
  
CREATE TABLE `default`.KDN_TMP_PRODUCTS
(
    BARCODE STRING
    ,NAME STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = "\""
)
STORED AS TEXTFILE 
tblproperties('skip.header.line.count'='1'); 