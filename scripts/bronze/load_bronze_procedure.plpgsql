

/*
======================================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
======================================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.
    It Performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses th 'BULK INSERT' command to load data from CSV Files to bronze tables.

Parameters:
    None.
  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
======================================================================================
*/


CREATE OR REPLACE PROCEDURE bronze.load_bronze()
 LANGUAGE plpgsql
AS $procedure$
	BEGIN
		begin 
			raise notice '===============================================';
			raise notice 'Loading bronze layer';
			raise notice '===============================================';
	
			raise notice '-----------------------------------------------';
			raise notice 'Loading CRM Table';
			raise notice '-----------------------------------------------';
	

-- Bulk loading the data for (bronze.crm)
	
	
	
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

