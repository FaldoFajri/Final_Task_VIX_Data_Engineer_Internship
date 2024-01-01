use DWH_Project;

create table DimCustomer(
	CustomerID INT NOT NULL PRIMARY KEY,
	FirstName varchar (50) NOT NULL,
	LastName varchar (50) NOT NULL,
	Age INT NOT NULL,
	Gender varchar (50) NOT NULL,
	City varchar (50) NOT NULL,
	NoHp varchar (50) NOT NULL
);

create table DimProduct(
	ProductID INT NOT NULL PRIMARY KEY,
	ProductName varchar (255) NOT NULL,
	ProductCategory varchar (255) NOT NULL,
	ProductUnitPrice INT
);

create table DimStatusOrder(
	StatusID INT NOT NULL PRIMARY KEY,
	StatusOrder varchar (50) NOT NULL,
	StatusOrderDesc varchar (50) NOT NULL
);

create table FactSalesOrder(
	OrderID INT NOT NULL PRIMARY KEY,
	CustomerID INT NOT NULL FOREIGN KEY REFERENCES DimCustomer(CustomerID),
	ProductID INT NOT NULL FOREIGN KEY REFERENCES DimProduct(ProductID),
	Quantity INT NOT NULL,
	Amount INT NOT NULL,
	StatusID INT NOT NULL FOREIGN KEY REFERENCES DimStatusOrder(StatusID),
	OrderDate DATE NOT NULL
);