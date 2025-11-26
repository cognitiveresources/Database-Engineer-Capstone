DROP PROCEDURE CancelBooking;
DELIMITER //
CREATE PROCEDURE CancelBooking(IN BooID INT, OUT statusBook VARCHAR(100))
BEGIN
DELETE FROM Bookings WHERE BookingsID = BooID;
SET statusBook = Concat('Booking ', BooID, ' cancelled.'); 
END //
DELIMITER ;
CALL CancelBooking(6, @output);
SELECT @output;