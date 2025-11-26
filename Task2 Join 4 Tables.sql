SELECT Customers.CustomerID, Customers.FullName, Orders.OrderID, Orders.TotalCost, Menu.MenuName,
CourseName
FROM Customers 
RIGHT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
LEFT JOIN Menu
ON Orders.MenuID = Menu.MenuID
LEFT JOIN MenuItems
ON Menu.MenuItemsID = MenuItems.MenuItemsID;
