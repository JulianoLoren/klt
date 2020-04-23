DROP TABLE IF EXISTS `default`.kdn_suggestion_top_sales;
CREATE TABLE `default`.kdn_suggestion_top_sales (
    BUSINESS_DATE            STRING        ,
    barcode                  VARCHAR(50)   ,
    barcode_name             STRING        ,
    level4                   STRING        ,
    product_name             STRING        ,
    LV4                      STRING        ,
    retailer_key             STRING       ,
    product_key              STRING        ,
    ending_stocks            INT            ,
    avg_sale_speed           FLOAT        
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
tblproperties('skip.header.line.count'='1');