CREATE OR ALTER PROCEDURE dbo.Products_Transform
AS
BEGIN;
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    TRUNCATE TABLE dbo.Products_Preload;

    DECLARE @StartDate DATE = GETDATE();
    DECLARE @EndDate DATE = DATEADD(dd,-1,GETDATE());

    BEGIN TRANSACTION;

    -- Add updated records
    INSERT INTO dbo.Products_Preload /* Column list excluded for brevity */
    SELECT NEXT VALUE FOR dbo.ProductKey AS ProductKey,
           pr.StockItemName,
		   pr.ColorName,
		   pr.Brand,
		   pr.Size,
           @StartDate,
           NULL
    FROM dbo.Products_Stage pr
    JOIN dbo.DimProducts dpr
        ON pr.StockItemName = dpr.ProductName
        AND dpr.EndDate IS NULL
    WHERE pr.Brand <> dpr.ProductBrand
          OR pr.ColorName <> dpr.ProductColour
          OR pr.Size <> dpr.ProductSize;

    -- Add existing records, and expire as necessary
    INSERT INTO dbo.Products_Preload /* Column list excluded for brevity */
    SELECT dpr.ProductName,
           dpr.ProductColour,
           dpr.ProductBrand,
           dpr.ProductSize,
           dpr.StartDate,
		   dpr.EndDate,
           CASE 
               WHEN pr.ProductName IS NULL THEN NULL
               ELSE @EndDate
           END AS EndDate
    FROM dbo.DimProducts dpr
    LEFT JOIN dbo.Products_Preload pr
        ON dpr.ProductName = pr.ProductName
        AND dpr.EndDate IS NULL;
    
    -- Create new records
    INSERT INTO dbo.Products_Preload /* Column list excluded for brevity */
    SELECT NEXT VALUE FOR dbo.ProductKey AS ProductKey,
           pr.StockItemName,
		   pr.ColorName,
		   pr.Brand,
		   pr.Size,
           @StartDate,
           NULL
    FROM dbo.Products_Stage pr
    WHERE NOT EXISTS ( SELECT 1 FROM dbo.DimProducts dpr WHERE pr.StockItemName = dpr.ProductName );

    -- Expire missing records
    INSERT INTO dbo.Products_Preload /* Column list excluded for brevity */
    SELECT NEXT VALUE FOR dbo.ProductKey AS ProductKey,
			dpr.ProductName,
           dpr.ProductColour,
           dpr.ProductBrand,
           dpr.ProductSize,
           dpr.StartDate,
		   dpr.EndDate
    FROM dbo.DimProducts dpr
    WHERE NOT EXISTS ( SELECT 1 FROM dbo.Products_Stage pr WHERE pr.StockItemName = dpr.ProductName )
          AND dpr.EndDate IS NULL;

    COMMIT TRANSACTION;
END;