use DWH_Project;

CREATE PROCEDURE summary_order_status
	@StatusID INT
AS
BEGIN
	SELECT	so.OrderID, 
			c.CustomerName, 
			p.ProductName, 
			so.Quantity, 
			sto.StatusOrder,
			sto.StatusOrderDesc
	FROM FactSalesOrder so
	JOIN DimCustomer c ON c.CustomerID = so.CustomerID
	JOIN DimProduct p ON p.ProductID = so.ProductID
	JOIN DimStatusOrder sto ON sto.StatusID = so.StatusID
	WHERE sto.StatusID = @StatusID;
END;

EXEC summary_order_status @StatusID = 2;