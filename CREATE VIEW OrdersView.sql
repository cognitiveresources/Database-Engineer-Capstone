USE LittleLemonDB;

CREATE OR REPLACE VIEW OrdersView AS
SELECT OrderID, Quantity, TotalCost
FROM Orders
WHERE TotalCost > 2;

Select * from OrdersView;