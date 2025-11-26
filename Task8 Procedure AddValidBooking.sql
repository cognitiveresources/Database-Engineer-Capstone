DROP PROCEDURE AddValidBooking;
DELIMITER //
CREATE PROCEDURE AddValidBooking(IN BDate DATETIME, IN TabNo INT, IN CID INT, OUT reserveStatus VARCHAR(100))
BEGIN
DECLARE result INT;
SELECT COUNT(TableNumber) INTO result FROM Bookings WHERE BDate = BookingDate AND TabNo = TableNumber;
START TRANSACTION;
IF result > 0 THEN
	SET reserveStatus = Concat('Booking cancelled. Table number', TabNo, ' is already booked.');
    ROLLBACK;
ELSE 
	SET reserveStatus = Concat('Table number', TabNo, ' is now reserved.');
    INSERT INTO Bookings (BookingsID, TableNumber, BookingDate, CustomerID) values(BookingsID, TabNo, BDate, CID );
    COMMIT;
END IF;
END //
DELIMITER ;
CALL AddValidBooking('2022-07-12', 3, 1, @output);
SELECT @output;