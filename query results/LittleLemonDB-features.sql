USE LittleLemonDB;

delimiter //

-- CREATE VIRTUAL TABLE FOR ORDERS 
-- WITH QUANTITY GREATER THAN 2:
CREATE VIEW `LittleLemonDB`.`OrdersView` AS
    SELECT 
        `LittleLemonDB`.`Orders`.`OrderID` AS `OrderID`,
        `LittleLemonDB`.`Orders`.`ItemQty` AS `ItemQty`,
        `LittleLemonDB`.`Orders`.`TotalCost` AS `TotalCost`
    FROM
        `LittleLemonDB`.`Orders`
    WHERE
        (`LittleLemonDB`.`Orders`.`ItemQty` >= 2);
-- SELECT * FROM OrdersView:
select * from OrdersView;        

 
 
-- USING JOINS TO EXTRACT DATA ON ORDERS 
-- WITH COST OF MORE THAT $150:
SELECT 
    C.CustomerID,
    CONCAT(C.FirstName, ' ', C.LastName) AS FullName,
    O.OrderID, O.TotalCost, D.Drink AS Product
FROM Customers C 
        INNER JOIN Orders O ON C.CustomerID = O.CustomerID
        INNER JOIN Drinks D ON D.DrinkID = O.ItemID
WHERE O.TotalCost >= 150 
UNION 
SELECT 
    C.CustomerID,
    CONCAT(C.FirstName, ' ', C.LastName) AS FullName,
    O.OrderID, O.TotalCost, M.MenuTitle AS Product
FROM Customers C
        INNER JOIN Orders O ON C.CustomerID = O.CustomerID
        INNER JOIN Menu M ON M.MenuID = O.ItemID
WHERE O.TotalCost >= 150;

 
-- USING ANY OPERATOR TO FIND MENU/DRINK ITEMS WITH 
-- ORDER QUANTITY OF MORE THAN 2:
SELECT M.MenuTitle AS Product
FROM Menu M
    INNER JOIN Orders O ON M.MenuID = O.ItemID
WHERE
    M.MenuID = ANY (
        SELECT ItemID
        FROM Orders
        WHERE ItemID LIKE 'ME%' AND ItemQty >= 2) 
UNION 
SELECT D.Drink AS Product
FROM Drinks D
    INNER JOIN Orders O ON D.DrinkID = O.ItemID
WHERE
    D.DrinkID = ANY (
        SELECT ItemID
        FROM Orders
        WHERE ItemID LIKE 'DR%' AND ItemQty >= 2);
            
            
            
-- CREATING STORED PROCEDURE TO DISPLAY 
-- THE MAXIMUM ORDERED QUANTITY IN ORDERS TABLE.
 CREATE PROCEDURE `GetMaxQty`()
SELECT 
    MAX(ItemQty) AS 'Max Quantity in Orders'
FROM
    Orders; 
    
CALL GetMaxQty();
    

-- CREATING PREPARED STATEMENT TO RETRIEVE 
-- ORDER DETAILS BASED ON CUSTOMER ID:

PREPARE GetOrderDetails FROM '
    select OrderID, ItemQty, TotalCost 
    from Orders 
    where CustomerID = ?';
    
SET @C.id = 3;
EXECUTE GetOrderDetails USING @C.id;
 
 
 
 
-- CREATING PROCEDURE THAT LITTLE LEMON CAN USE 
-- TO CANCEL ORDERS BY SPECIFYING THE ORDER ID.
 
CREATE PROCEDURE `CancelOrder`(IN id INT)
BEGIN 
    DELETE FROM Orders
    WHERE OrderID = id;
    SELECT 
        CONCAT('Order ', id, ' is cancelled') AS Confirmation; 
END;

CALL CancelOrder (1);



-- BOOKINGS TABLE ALREADY POPULATED
-- RETRIEVING ALL RECORDS FROM BOOKINGS TABLE:
SELECT * FROM Bookings;


-- CREATE PROCEDURE TO CHECK AVAILABLE BOOKING SLOTS:
drop procedure CheckBooking;
delimiter //
CREATE PROCEDURE CheckBooking(IN new_Date DATE, IN new_tableNo INT) 
BEGIN 
    DECLARE booked_tableNo INT; 
    SET booked_tableNo =(
        SELECT DISTINCT TableNO 
        FROM Bookings 
        WHERE DATE(BookingDate) = new_Date 
        AND TableNo = new_tableNo); 
    IF booked_tableNo is NOT NULL THEN 
        SELECT CONCAT('Table ',new_tableNo,' is already booked for ',new_Date) 
        AS 'Booking status'; 
    ELSE 
        SELECT CONCAT('Table ',new_tableNo,' is available for ', new_Date) 
        AS 'Booking status'; 
    END IF; 
END
//

CALL CheckBooking('2023-03-17',2);


-- CREATE PROCEDURE TO ADD VALID BOOKINGS:
delimiter //
CREATE PROCEDURE AddValidBooking(IN new_DateTime DATETIME, IN new_tableNo INT) 
BEGIN
    DECLARE booked_tableNo INT; 
    START TRANSACTION;
    SET booked_tableNo =(
        SELECT DISTINCT TableNO 
        FROM Bookings 
        WHERE DATE(BookingDate) = DATE(new_DateTime) 
        AND TableNo = new_tableNo); 
    INSERT INTO Bookings (BookingDate, TableNO) VALUES (new_DateTime, new_tableNo);
    IF booked_tableNo is NOT NULL THEN 
        SELECT CONCAT('Table ',new_tableNo,' is already booked for ',DATE(new_DateTime),' - booking cancelled') 
        AS 'Booking status'; 
        ROLLBACK;
    ELSE 
        SELECT CONCAT('Table ',new_tableNo,' is available for ', DATE(new_DateTime),' - booking accepted') 
        AS 'Booking status'; 
        COMMIT;
    END IF; 
END//
CALL AddValidBooking('2023-3-23 16:00:00', 3);


-- CREATE PROCEDURE TO ADD BOOKINGS WITH ALL PARAMETERS 
-- EXCEPT BOOKING ID WHICH IS ON AUTO_INCREMENT:
delimiter //
DROP PROCEDURE IF EXISTS AddBooking;
CREATE PROCEDURE AddBooking(IN new_DateTime DATETIME, IN new_tableNo INT, IN new_NoOfGuests INT, IN new_CustomerID INT) 
BEGIN
    DECLARE booked_tableNo INT; 
    START TRANSACTION;
    SET booked_tableNo =(
        SELECT DISTINCT TableNO 
        FROM Bookings 
        WHERE DATE(BookingDate) = DATE(new_DateTime) 
        AND TableNo = new_tableNo); 
    INSERT INTO Bookings (BookingDate, TableNO, NoOfGuests, CustomerID) VALUES (new_DateTime, new_tableNo, new_NoOfGuests, new_CustomerID);
    IF booked_tableNo is NOT NULL THEN 
        SELECT CONCAT('Table ',new_tableNo,' is already booked for ',DATE(new_DateTime),' - booking cancelled') 
        AS 'Booking status'; 
        ROLLBACK;
    ELSE 
        SELECT 'New booking added' AS 'Booking Confirmation'; 
        COMMIT;
    END IF; 
END//

CALL AddBooking('2023-3-24 16:00:00', 3, 3, 5);


-- CREATE PROCEDURE TO UPDATE BOOKING DATE/DATETIME USING BOOKING ID:
delimiter //
DROP PROCEDURE IF EXISTS UpdateBooking;
CREATE PROCEDURE UpdateBooking(IN InBookingID INT, IN InBookingDate DATETIME)
BEGIN
    START TRANSACTION;
    UPDATE Bookings SET BookingDate = InBookingDate WHERE BookingID = InBookingID;
    IF InBookingID = ANY (SELECT BookingID FROM Bookings) THEN 
        SELECT CONCAT('Booking ID ',InBookingID,' updated') 
        AS 'Booking Confirmation'; 
        COMMIT;
    ELSE 
        SELECT 'Booking ID does not exist' AS 'Booking Confirmation'; 
        ROLLBACK;
    END IF; 
END//

CALL UpdateBooking(10, '2023-03-27 17:00:00');


-- CREATE PROCEDURE TO DELETE BOOKING USING BOOKING ID:
delimiter //
DROP PROCEDURE IF EXISTS CancelBooking;
delimiter //
CREATE PROCEDURE CancelBooking(IN InBookingID INT)
BEGIN
    IF InBookingID IN (SELECT BookingID FROM Bookings) THEN 
        SELECT CONCAT('Booking ID ',InbookingID,' cancelled') 
        AS 'Booking Confirmation'; 
        DELETE FROM Bookings WHERE BookingID = InBookingID;
    ELSE 
        SELECT concat('Booking ID ',InBookingID,' does not exist') 
        AS 'Booking Confirmation'; 
    END IF; 
END//

CALL CancelBooking(10);




