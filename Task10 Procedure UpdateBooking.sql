DROP PROCEDURE UpdateBooking;
DELIMITER //
CREATE PROCEDURE UpdateBooking(IN BooID INT, IN BDate DATETIME, OUT statusBook VARCHAR(100))
BEGIN
UPDATE Bookings SET BookingDate = BDate WHERE BookingsID = BooID;
SET statusBook = Concat('Booking ', BooID, ' updated.'); 
END //
DELIMITER ;
CALL UpdateBooking(6, '2022-12-29', @output);
SELECT @output;