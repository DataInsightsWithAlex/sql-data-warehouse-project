/*

===================================================================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===================================================================================================================
Script Purpose:
	This stored procedure loads data into the 'bronze' schema from external CSV files.
	It performs the following actions:
	- Truncates the bronze table before loading the data.
	- Uses the 'BULK INSERT' command to load the data from csv Files to bronze tables
Parameters:
	None.
	This stored procedure does not accept any parameters or return any values

Usage example:
	EXEC bronze.load_bronze;
====================================================================================================================

*/



CREATE or ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @start_time_total DATETIME, @end_time_total DATETIME;
	BEGIN TRY
		SET @start_time_total = GETDATE();
		PRINT '===========================================================================================';
		PRINT 'Loading Bronze Layer';
		PRINT '===========================================================================================';
	
		PRINT '-------------------------------------------------------------------------------------------';
		PRINT 'Loagin CRM Tables';
		PRINT '-------------------------------------------------------------------------------------------';
		
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;

		PRINT '>> Insert Data Into Table: bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\Alexandru\Downloads\sql\dwh_project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration:' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -----------------------------';

		----------------------------------------------------------------------------------------------------

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;

		PRINT '>> Insert Data Into Table: bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\Alexandru\Downloads\sql\dwh_project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration:' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -----------------------------';

		----------------------------------------------------------------------------------------------------
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;

		PRINT '>> Insert Data Into Table: bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\Alexandru\Downloads\sql\dwh_project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration:' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -----------------------------';

		----------------------------------------------------------------------------------------------------

		PRINT '-------------------------------------------------------------------------------------------';
		PRINT 'Loagin ERP Tables';
		PRINT '-------------------------------------------------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12;

		PRINT '>> Insert Data Into Table: bronze.erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\Alexandru\Downloads\sql\dwh_project\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration:' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -----------------------------';

		------------------------------------------------------------------------------------

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101;

		PRINT '>> Insert Data Into Table: bronze.erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\Alexandru\Downloads\sql\dwh_project\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration:' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -----------------------------';

		--------------------------------------------------------------------

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		PRINT '>> Insert Data Into Table: bronze.erp_px_cat_g1v2';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\Alexandru\Downloads\sql\dwh_project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration:' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -----------------------------';
		SET @end_time_total = GETDATE();
		PRINT '===================================================';
		PRINT 'Loading of the Bronze Layer is Completed';
		PRINT '>> Total Load Duration:' + CAST(DATEDIFF(second, @start_time_total, @end_time_total) AS NVARCHAR) + ' seconds';
		PRINT '===================================================';
	END TRY
	BEGIN CATCH
		PRINT '=================================================';
		PRINT 'ERROR OCCURED DURING LOADING OF THE BRONZE LAYER';
		PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
		PRINT 'ERROR NUMBER' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'ERROR STATE' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=================================================';
	END CATCH
END
