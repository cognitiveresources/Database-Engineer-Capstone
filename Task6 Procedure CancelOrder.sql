DROP PROCEDURE CancelOrder;
DELIMITER //
CREATE PROCEDURE CancelOrder (IN id INT)
BEGIN
DELETE FROM Orders WHERE id = OrderID;
SELECT Concat("Confirmation, Order ", id, " is cancelled") AS Confirmation;
END //
DELIMITER ;

CALL CancelOrder(6);