CREATE OR REPLACE VIEW `default.api_get_out_of_stock_product` AS
SELECT
    `t1`.`business_date`,
    `t1`.`retailer_id`,
    `t1`.`product_id`,
    `t1`.`barcode`,
    `t2`.`name`,
    `t1`.`daily_sale_30`,
    `t1`.`daily_sale_20`,
    `t1`.`daily_sale_15`,
    `t1`.`daily_sale_10`,
    `t1`.`daily_sale_5`,
    `t1`.`daily_sale_1`,
    `t1`.`quantity_30_days`,
    `t1`.`revenue_30_days`,
    `t1`.`ending_stocks`,
    `t1`.`invoice_from`,
    `t1`.`predict_7`
FROM
    `default`.`kdn_product_suggestion_sale_speed` `t1`
INNER JOIN `default`.`kdn_tmp_products` `t2` ON
    `t1`.`barcode` = `t2`.`barcode`;


CREATE OR REPLACE VIEW `default.api_get_relevant_categories` AS
SELECT
    `t1`.`retailer_id`,
    Cast(`t2`.`recommended_item` AS BIGINT) `recommended_item`,
    Max(`t3`.`avg_quantity`) `avg_quantity`,
    Max(`t3`.`avg_revenue`) `avg_revenue`,
    Max(`t2`.`count_common_users`) `count_common_users`,
    Max(`t2`.`expected_common_users`) `expected_common_users`,
    Max(`t2`.`score`) `score`
FROM
    `default`.`kdn_categories` `t1`
INNER JOIN `default`.`kdn_product_category_suggestion_item_based` `t2` ON
    `t1`.`category_id` = Cast(`t2`.`item` AS BIGINT)
INNER JOIN (
    SELECT
        `kdn_categories`.`category_id`,
        Avg(`kdn_categories`.`quantity`) `avg_quantity`,
        Avg(`kdn_categories`.`revenue`) `avg_revenue`
    FROM
        `default`.`kdn_categories`
    GROUP BY
        `kdn_categories`.`category_id`) `t3` ON
    `t3`.`category_id` = Cast(`t2`.`recommended_item` AS BIGINT)
GROUP BY
    `t1`.`retailer_id`,
    `t2`.`recommended_item`
ORDER BY
    score DESC;


CREATE OR REPLACE VIEW `default.api_get_relevant_products` AS
SELECT
    t1.retailer_id,
    t2.recommended_item,
    `t5`.`name` AS `recommended_item_name`,
    Max(`t3`.`avg_quantity`) AS `avg_quantity`,
    Max(`t3`.`avg_revenue`) AS `avg_revenue`,
    Max(`t2`.`count_common_users`) AS `count_common_users`,
    Max(`t2`.`expected_common_users`) AS `expected_common_users`,
    Max(`t2`.`score`) AS `score`
FROM
    `default`.`kdn_products_30_days` `t1`
INNER JOIN `default`.`kdn_product_suggestion_item_based` `t2` ON
    `t1`.`barcode` = `t2`.`item`
INNER JOIN (
    SELECT
        `kdn_products`.`barcode`,
        Avg(`kdn_products`.`quantity`) `avg_quantity`,
        Avg(`kdn_products`.`revenue`) `avg_revenue`
    FROM
        `default`.`kdn_products`
    WHERE
        `kdn_products`.`revenue` < 15000000000
    GROUP BY
        `kdn_products`.`barcode`) `t3` ON
    `t2`.`recommended_item` = `t3`.`barcode`
INNER JOIN `default`.`kdn_tmp_products` `t4` ON
    `t2`.`item` = `t4`.`barcode`
INNER JOIN `default`.`kdn_tmp_products` `t5` ON
    `t2`.`recommended_item` = `t5`.`barcode`
GROUP BY
    `t1`.`retailer_id`,
    `t2`.`recommended_item`,
    `t5`.`name`;

CREATE OR REPLACE VIEW `default.api_get_relevant_products_by_barcode` AS
SELECT
    `t2`.`item`,
    `t4`.`name`,
    `t2`.`recommended_item`,
    `t5`.`name` AS `recommended_item_name`,
    `t3`.`avg_quantity`,
    `t3`.`avg_revenue`,
    `t2`.`count_common_users`,
    `t2`.`expected_common_users`,
    `t2`.`score`
FROM
    `default`.`kdn_product_suggestion_item_based` `T2`
INNER JOIN (
    SELECT
        `kdn_products_30_days`.`barcode`,
        Avg(`kdn_products_30_days`.`quantity`) `AVG_QUANTITY`,
        Avg(`kdn_products_30_days`.`revenue`) `AVG_REVENUE`
    FROM
        `default`.`kdn_products_30_days`
    WHERE
        `kdn_products_30_days`.`revenue` < 15000000000
    GROUP BY
        `kdn_products_30_days`.`barcode`) `T3` ON
    `t2`.`recommended_item` = `t3`.`barcode`
INNER JOIN `default`.`kdn_tmp_products` `T4` ON
    `t2`.`item` = `t4`.`barcode`
INNER JOIN `default`.`kdn_tmp_products` `T5` ON
    `T2`.`recommended_item` = `t5`.`barcode`;


CREATE OR REPLACE VIEW `default.api_get_top_selling_products` AS
SELECT
    `t1`.`barcode`,
    Max(`t2`.`name`) `name`,
    Avg(`t1`.`quantity`) `avg_quantity`,
    Avg(`t1`.`revenue`) `avg_revenue`
FROM
    `default`.`kdn_products_30_days` `t1`
INNER JOIN `default`.`kdn_tmp_products` `t2` ON
    `t1`.`barcode` = `t2`.`barcode`
WHERE
    `t1`.`revenue` > 10000000
    AND `t1`.`revenue` < 1000000000000
GROUP BY
    `t1`.`barcode`;

