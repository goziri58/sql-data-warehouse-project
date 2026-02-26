

/*
======================================================================================
Stored Procedure: Load Silver Layer (Source -> bronze)
======================================================================================
Script Purpose:
    This stored procedure loads data into the 'silver' schema from external CSV files.
    It Performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the 'BULK INSERT' command to load data from CSV Files to silver tables.

Parameters:
    None.
  This stored procedure does not accept any parameters or return any values.

Usage Example:
    call silver.load_silver();
======================================================================================
*/
-- DROP PROCEDURE silver.load_silver();

CREATE OR REPLACE PROCEDURE silver.load_silver()
 LANGUAGE plpgsql
AS $procedure$
	BEGIN
		DO $$
		declare
			batch_start timestamp := clock_timestamp();
			table_start timestamp;
		begin 
			raise notice '===============================================';
			raise notice 'Loading silver layer';
			raise notice '===============================================';
	
			raise notice '-----------------------------------------------';
			raise notice 'Loading CRM Table';
			raise notice '-----------------------------------------------';
	-- Bulk loading the data for (silver.crm)
	

--silver.crm_cust_info	

			table_start := clock_timestamp();
			raise notice '>> Truncating Table: silver.crm_cust_info';
			-- wipe table clean
			truncate table silver.crm_cust_info;
			
	
			raise notice '>> Inserting Data into Table: silver.crm_cust_info';
			-- load fresh data
			-- Specify columns from CSV; PostgreSQL will auto-fill dwh_create_date with DEFAULT
			copy silver.crm_cust_info (cst_id, cst_key, cst_firstname, cst_lastname, cst_marital_status, cst_gndr, cst_create_date)
			from '/Users/Shared/project_portfolio_stack/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
			with(
				FORMAT CSV, 
			    HEADER, 
			    DELIMITER ',', 
			    ENCODING 'UTF8'
			);


			RAISE NOTICE '>> Load Duration: %', clock_timestamp() - table_start;

--silver.crm_prd_info
			

			table_start := clock_timestamp();
			raise notice '>> Truncating Table: silver.crm_prd_info';
			-- wipe table clean
			truncate table silver.crm_prd_info;
			
	
			raise notice '>> Inserting Data Into Table: silver.crm_prd_info';
			-- load fresh data
			copy silver.crm_prd_info (prd_id, prd_key, prd_name, prd_cost, prd_line, prd_start_dt, prd_end_dt)
			from '/Users/Shared/project_portfolio_stack/sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
			with(
				FORMAT CSV, 
			    HEADER, 
			    DELIMITER ',', 
			    ENCODING 'UTF8'
			);
			
			RAISE NOTICE '>> Load Duration: %', clock_timestamp() - table_start;


--silver.crm_sales_details


			table_start := clock_timestamp();
			raise notice '>> Truncating Table: silver.crm_sales_details';
			-- wipe table clean
			truncate table silver.crm_sales_details;
			
	
			raise notice '>> Inserting Data Into Table: silver.crm_sales_details';
			-- load fresh data
			copy silver.crm_sales_details (sls_ord_num, sls_prd_key, sls_cust_id, sls_order_dt, sls_ship_dt, sls_due_dt, sls_sales, sls_quantity, sls_price)
			from '/Users/Shared/project_portfolio_stack/sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
			with(
				FORMAT CSV, 
			    HEADER, 
			    DELIMITER ',', 
			    ENCODING 'UTF8'
			);
			
			RAISE NOTICE '>> Load Duration: %', clock_timestamp() - table_start;


			
			raise notice '-----------------------------------------------';
			raise notice 'Loading ERP Table';	
			raise notice '-----------------------------------------------';
	-- Bulk loading the data for (silver.erp)
			
	
--silver.erp_cust_az12
		
			table_start := clock_timestamp();
			raise notice '>> Truncating Table: silver.erp_cust_az12';
			-- wipe table clean
			truncate table silver.erp_cust_az12;
			
	
			raise notice '>> Inserting Data Into Table: silver.erp_cust_az12';
			-- load fresh data
			copy silver.erp_cust_az12 (cid, bdate, gen)
			from '/Users/Shared/project_portfolio_stack/sql-data-warehouse-project/datasets/source_erp/CUST_AZ12.csv'
			with(
				FORMAT CSV, 
			    HEADER, 
			    DELIMITER ',', 
			    ENCODING 'UTF8'
			);

			RAISE NOTICE '>> Load Duration: %', clock_timestamp() - table_start;

			


--silver.erp_loc_a101



			table_start := clock_timestamp();
			raise notice 'Truncating Table: silver.erp_loc_a101';
			-- 1. Wipe the table clean
			TRUNCATE TABLE silver.erp_loc_a101;
			
	
			raise notice '>> Inserting Data Into Table: silver.erp_loc_a101';
			-- 2. Load fresh data
			copy silver.erp_loc_a101 (cid, cntry)
			from '/Users/Shared/project_portfolio_stack/sql-data-warehouse-project/datasets/source_erp/LOC_A101.csv'
			with(
				FORMAT CSV, 
			    HEADER, 
			    DELIMITER ',', 
			    ENCODING 'UTF8'
			);
			

			RAISE NOTICE '>> Load Duration: %', clock_timestamp() - table_start;


--silver.erp_px_cat_g1v2
			

			table_start := clock_timestamp();
			raise notice 'Truncating Table: silver.erp_px_cat_g1v2';
			-- 1. Wipe the table clean
			TRUNCATE TABLE silver.erp_px_cat_g1v2;
			
	
			raise notice '>> Inserting Data Into Table: silver.erp_px_cat_g1v2';
			-- 2. Load fresh data
			copy silver.erp_px_cat_g1v2 (id, cat, subcat, maintenance)
			from '/Users/Shared/project_portfolio_stack/sql-data-warehouse-project/datasets/source_erp/PX_CAT_G1V2.csv'
			with(
				FORMAT CSV, 
			    HEADER, 
			    DELIMITER ',', 
			    ENCODING 'UTF8'
			);

			RAISE NOTICE '>> Load Duration: %', clock_timestamp() - table_start;


-- Final Batch Summary
    		RAISE NOTICE '===============================================';
    		RAISE NOTICE 'Total Batch Duration: %', clock_timestamp() - batch_start;
    		RAISE NOTICE '===============================================';


		exception
			when others then
				raise notice 'something went worng! ERROR %', SQLERRM;
		END $$;
		
	END;
$procedure$
;
