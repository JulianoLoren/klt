import subprocess

subprocess.call(["hive", "-f","/tmp/klt/sql/{}.sql".format('kdn_categories')])
subprocess.call(["hive", "-f","/tmp/klt/sql/{}.sql".format('kdn_product_suggestion_sale_speed')])
subprocess.call(["hive", "-f","/tmp/klt/sql/{}.sql".format('kdn_products')])
subprocess.call(["hive", "-f","/tmp/klt/sql/{}.sql".format('kdn_products_30_days')])
subprocess.call(["hive", "-f","/tmp/klt/sql/{}.sql".format('kdn_retailer_industry')])
subprocess.call(["hive", "-f","/tmp/klt/sql/{}.sql".format('kdn_suggestion_top_sales')])
subprocess.call(["hive", "-f","/tmp/klt/sql/{}.sql".format('kdn_tmp_products')])
subprocess.call(["hive", "-f","/tmp/klt/sql/{}.sql".format('kdn_product_category_suggestion_item_based')])
subprocess.call(["hive", "-f","/tmp/klt/sql/{}.sql".format('kdn_product_suggestion')])
subprocess.call(["hive", "-f","/tmp/klt/sql/{}.sql".format('kdn_product_suggestion_item_based')])

subprocess.call(["hive", "-f","/tmp/klt/sql/view.sql"])
