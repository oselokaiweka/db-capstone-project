USE LittleLemonDB;

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



