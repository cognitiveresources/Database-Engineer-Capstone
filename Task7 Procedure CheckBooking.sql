DROP PROCEDURE CheckBooking;
DELIMITER //
CREATE PROCEDURE CheckBooking(IN BDate DATETIME, IN TabNo INT, OUT BookingStatus VARCHAR(100))
BEGIN
DECLARE result INT;
SELECT COUNT(TableNumber) INTO result FROM Bookings WHERE BDate = BookingDate AND TabNo = TableNumber;
CASE
WHEN result > 0 THEN
	SET BookingStatus = Concat('Table number', TabNo, ' is already booked.');
ELSE 
	SET BookingStatus = Concat('Table number', TabNo, ' is free.');
END CASE;
END //
DELIMITER ;
CALL CheckBooking('2022-11-12',3, @output);
SELECT @output;