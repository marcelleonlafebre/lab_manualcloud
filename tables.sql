--table inventory
create external table inventory
(
 inv_date_sk int , 
  inv_item_sk int ,
  inv_warehouse_sk int ,
  inv_quantity_on_hand int )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES ('field.delim' = '|')
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION 's3://redshift-downloads/TPC-DS/2.13/1TB/inventory/'
TBLPROPERTIES ( 'classification' = 'csv', 'write.compression' = 'GZIP'
)

--table date_dim
create external table date_dim
( d_date_sk int , d_date_id char(16) , d_date date, d_month_seq int , d_week_seq int , d_quarter_seq int , d_year int , d_dow int , d_moy int , d_dom int , d_qoy int , d_fy_year int , d_fy_quarter_seq int , d_fy_week_seq int , d_day_name char(9) , d_quarter_name char(6) , d_holiday char(1) , d_weekend char(1) , d_following_holiday char(1) , d_first_dom int , d_last_dom int , d_same_day_ly int , d_same_day_lq int , d_current_day char(1) , d_current_week char(1) , d_current_month char(1) , d_current_quarter char(1) , d_current_year char(1))
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES ('field.delim' = '|')
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION 's3://redshift-downloads/TPC-DS/2.13/1TB/date_dim/'
TBLPROPERTIES ( 'classification' = 'csv', 'write.compression' = 'GZIP'
)

--table item
create external table item
(
i_item_sk int , i_rec_start_date date, i_rec_end_date date, i_item_desc varchar(200) , i_current_price decimal(7,2), i_wholesale_cost decimal(7,2), i_brand_id int, i_brand char(50) , i_class_id int, i_class char(50) , i_category_id int, i_category char(50) , i_manufact_id int, i_manufact char(50) , i_size char(20) , i_formulation char(20) , i_color char(20) , i_units char(10), i_container char(10), i_manager_id int, i_product_name char(50) )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES ('field.delim' = '|')
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION 's3://redshift-downloads/TPC-DS/2.13/1TB/item/'
TBLPROPERTIES ( 'classification' = 'csv', 'write.compression' = 'GZIP'
)

--table warehouse
create external table warehouse
( w_warehouse_sk int, w_warehouse_id char(16) , w_warehouse_name varchar(20) , w_warehouse_sq_ft int , w_street_number char(10) , w_street_name varchar(60) , w_street_type char(15) , w_suite_number char(10) , w_city varchar(60) , w_county varchar(30) , w_state char(2) , w_zip char(10) , w_country varchar(20) , w_gmt_offset decimal(5,2) )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES ('field.delim' = '|')
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION 's3://redshift-downloads/TPC-DS/2.13/1TB/warehouse/'
TBLPROPERTIES ( 'classification' = 'csv', 'write.compression' = 'GZIP'
)
