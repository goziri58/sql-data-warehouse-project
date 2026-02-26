

/*creating ddl for bronze schema


*/

CREATE TABLE bronze.crm_cust_info (
	cst_id int4 NULL,
	cst_key varchar(50) NULL,
	cst_firstname varchar(50) NULL,
	cst_lastname varchar(50) NULL,
	cst_marital_status varchar(50) NULL,
	cst_gndr varchar(50) NULL,
	cst_create_date date NULL
);





CREATE TABLE bronze.crm_prd_info (
	prd_id int4 NULL,
	prd_key varchar(50) NULL,
	prd_name varchar(50) NULL,
	prd_cost int4 NULL,
	prd_line varchar(50) NULL,
	prd_start_dt date NULL,
	prd_end_dt date NULL
);




CREATE TABLE bronze.crm_sales_details (
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




CREATE TABLE bronze.erp_cust_az12 (
	cid varchar(50) NULL,
	bdate date NULL,
	gen varchar(50) NULL
);




CREATE TABLE bronze.erp_loc_a101 (
	cid varchar(50) NULL,
	cntry varchar(50) NULL
);





CREATE TABLE bronze.erp_px_cat_g1v2 (
	id varchar(50) NULL,
	cat varchar(50) NULL,
	subcat varchar(50) NULL,
	maintenance varchar(50) NULL
);



























	
	
			raise notice '>> Truncating Table: bronze.crm_cust_info';
			-- wipe table clean
			truncate table bronze.crm_cust_info;
			
	
			raise notice '>> Inserting Data into Table: bronze.crm_cust_info';
			-- load fresh data
			copy bronze.crm_cust_info
			from '/Users/Shared/project_portfolio_stack/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
			with(
				FORMAT CSV, 
			    HEADER, 
			    DELIMITER ',', 
			    ENCODING 'UTF8'
			);
			
			raise notice '>> Truncating Table: bronze.crm_prd_info';
			-- wipe table clean
			truncate table bronze.crm_prd_info;
			
	
			raise notice '>> Inserting Data Into Table: bronze.crm_prd_info';
			-- load fresh data
			copy bronze.crm_prd_info
			from '/Users/Shared/project_portfolio_stack/sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
			with(
				FORMAT CSV, 
			    HEADER, 
			    DELIMITER ',', 
			    ENCODING 'UTF8'
			);
			
			raise notice '>> Truncating Table: bronze.crm_sales_details';
			-- wipe table clean
			truncate table bronze.crm_sales_details;
			
	
			raise notice '>> Inserting Data Into Table: bronze.crm_sales_details';
			-- load fresh data
			copy bronze.crm_sales_details
			from '/Users/Shared/project_portfolio_stack/sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
			with(
				FORMAT CSV, 
			    HEADER, 
			    DELIMITER ',', 
			    ENCODING 'UTF8'
			);
			
			
			raise notice '-----------------------------------------------';
			raise notice 'Loading ERP Table';	
			raise notice '-----------------------------------------------';
	

-- Bulk loading the data for (bronze.erp)
			
	
			raise notice '>> Truncating Table: bronze.erp_cust_az12';
			-- wipe table clean
			truncate table bronze.erp_cust_az12;
			
	
			raise notice '>> Inserting Data Into Table: bronze.erp_cust_az12';
			-- load fresh data
			copy bronze.erp_cust_az12
			from '/Users/Shared/project_portfolio_stack/sql-data-warehouse-project/datasets/source_erp/CUST_AZ12.csv'
			with(
				FORMAT CSV, 
			    HEADER, 
			    DELIMITER ',', 
			    ENCODING 'UTF8'
			);
			
			raise notice 'Truncating Table: bronze.erp_loc_a101';
			-- 1. Wipe the table clean
			TRUNCATE TABLE bronze.erp_loc_a101;
			
	
			raise notice '>> Inserting Data Into Table: bronze.erp_loc_a101';
			-- 2. Load fresh data
			copy bronze.erp_loc_a101
			from '/Users/Shared/project_portfolio_stack/sql-data-warehouse-project/datasets/source_erp/LOC_A101.csv'
			with(
				FORMAT CSV, 
			    HEADER, 
			    DELIMITER ',', 
			    ENCODING 'UTF8'
			);
			
			
			raise notice 'Truncating Table: bronze.erp_px_cat_g1v2';
			-- 1. Wipe the table clean
			TRUNCATE TABLE bronze.erp_px_cat_g1v2;
			
	
			raise notice '>> Inserting Data Into Table: bronze.erp_px_cat_g1v2';
			-- 2. Load fresh data
			copy bronze.erp_px_cat_g1v2
			from '/Users/Shared/project_portfolio_stack/sql-data-warehouse-project/datasets/source_erp/PX_CAT_G1V2.csv'
			with(
				FORMAT CSV, 
			    HEADER, 
			    DELIMITER ',', 
			    ENCODING 'UTF8'
			);
		exception
			when others then
				raise notice 'something went worng! ERROR %', SQLERRM;
		END;
	END;
$procedure$
;
