DROP TABLE IF EXISTS `default`.kdn_product_suggestion;
CREATE TABLE `default`.kdn_product_suggestion (
    business_date               STRING        ,
    retailer_key                VARCHAR(50)   ,
    product_key                 STRING        ,
    code                        STRING        ,
    name                        STRING        ,
    daily_sale_30               DOUBLE        ,
    daily_sale_20               DOUBLE        ,
    daily_sale_15               DOUBLE        ,
    daily_sale_10               DOUBLE        ,
    daily_sale_5                DOUBLE        ,
    daily_sale_1                DOUBLE        ,
    quantity_30_days            DOUBLE        ,
    revenue_30_days             DOUBLE        ,
    ending_stocks               DOUBLE        ,
    invoice_from             DOUBLE        ,
    predict_7                   DOUBLE        
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
tblproperties('skip.header.line.count'='1');