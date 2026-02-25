



-- creates the DDL for the silver layer

CREATE TABLE silver.crm_cust_info (
	cst_id int4 NULL,
	cst_key varchar(50) NULL,
	cst_firstname varchar(50) NULL,
	cst_lastname varchar(50) NULL,
	cst_marital_status varchar(50) NULL,
	cst_gndr varchar(50) NULL,
	cst_create_date date NULL
);






CREATE TABLE silver.crm_prd_info (
	prd_id int4 NULL,
	prd_key varchar(50) NULL,
	prd_name varchar(50) NULL,
	prd_cost int4 NULL,
	prd_line varchar(50) NULL,
	prd_start_dt date NULL,
	prd_end_dt date NULL
);







CREATE TABLE silver.crm_sales_details (
	sls_ord_num varchar(50) NULL,
	sls_prd_key varchar(50) NULL,
	sls_cust_id int4 NULL,
	sls_order_dt text NULL,
	sls_ship_dt date NULL,
	sls_due_dt date NULL,
	sls_sales int4 NULL,
	sls_quantity int4 NULL,
	sls_price text NULL
);




CREATE TABLE silver.erp_cust_az12 (
	cid varchar(50) NULL,
	bdate date NULL,
	gen varchar(50) NULL
);




CREATE TABLE silver.erp_loc_a101 (
	cid varchar(50) NULL,
	cntry varchar(50) NULL
);



CREATE TABLE silver.erp_px_cat_g1v2 (
	id varchar(50) NULL,
	cat varchar(50) NULL,
	subcat varchar(50) NULL,
	maintenance varchar(50) NULL
);




