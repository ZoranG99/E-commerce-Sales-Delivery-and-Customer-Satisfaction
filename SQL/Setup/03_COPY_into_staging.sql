COPY staging.customers
FROM 'D:\Data_Science\Projects\Portfolio_Projects\E-commerce-Sales-Delivery-and-Customer-Satisfaction\Dataset\Processed\olist_customers_cleaned.csv'
DELIMITER ','
CSV HEADER;

COPY staging.geolocation
FROM 'D:\Data_Science\Projects\Portfolio_Projects\E-commerce-Sales-Delivery-and-Customer-Satisfaction\Dataset\Processed\olist_geolocation_cleaned.csv'
DELIMITER ','
CSV HEADER;

COPY staging.order_items
FROM 'D:\Data_Science\Projects\Portfolio_Projects\E-commerce-Sales-Delivery-and-Customer-Satisfaction\Dataset\Processed\olist_order_items_cleaned.csv'
DELIMITER ','
CSV HEADER;

COPY staging.order_payments
FROM 'D:\Data_Science\Projects\Portfolio_Projects\E-commerce-Sales-Delivery-and-Customer-Satisfaction\Dataset\Processed\olist_order_payments_cleaned.csv'
DELIMITER ','
CSV HEADER;

COPY staging.order_reviews
FROM 'D:\Data_Science\Projects\Portfolio_Projects\E-commerce-Sales-Delivery-and-Customer-Satisfaction\Dataset\Processed\olist_order_reviews_cleaned.csv'
DELIMITER ','
CSV HEADER;

COPY staging.orders
FROM 'D:\Data_Science\Projects\Portfolio_Projects\E-commerce-Sales-Delivery-and-Customer-Satisfaction\Dataset\Processed\olist_orders_cleaned.csv'
DELIMITER ','
CSV HEADER;

COPY staging.products
FROM 'D:\Data_Science\Projects\Portfolio_Projects\E-commerce-Sales-Delivery-and-Customer-Satisfaction\Dataset\Processed\olist_products_cleaned.csv'
DELIMITER ','
CSV HEADER;

COPY staging.sellers
FROM 'D:\Data_Science\Projects\Portfolio_Projects\E-commerce-Sales-Delivery-and-Customer-Satisfaction\Dataset\Processed\olist_sellers_cleaned.csv'
DELIMITER ','
CSV HEADER;

COPY staging.category_translation
FROM 'D:\Data_Science\Projects\Portfolio_Projects\E-commerce-Sales-Delivery-and-Customer-Satisfaction\Dataset\Processed\product_category_name_translation_cleaned.csv'
DELIMITER ','
CSV HEADER;