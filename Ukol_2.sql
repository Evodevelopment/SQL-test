DECLARE @produktID INT
DECLARE @produktnazev VARCHAR(50)
DECLARE @produktskryty BIT
DECLARE @parametrProduktID INT
DECLARE @parametrID INT
DECLARE @parametrnazev VARCHAR(50)

DECLARE produkt_cursor CURSOR FOR
SELECT ProduktID, Produkt_nazev, produkt_skryty
FROM Produkty
WHERE produkt_skryty = 0

OPEN produkt_cursor

FETCH NEXT FROM produkt_cursor INTO @produktID, @produktnazev, @produktskryty

WHILE @@FETCH_STATUS = 0
BEGIN
    SELECT @parametrID = ParametrID, @parametrnazev = Parametr_nazev
    FROM Parametry
    WHERE parametrproduktID = @produktID
    
    IF @@ROWCOUNT = 0
    BEGIN
        INSERT INTO Parametry (ParametrID, Parametr_nazev, parametrproduktID)
        VALUES (100, 'MEGA', @produktID)
    END
    ELSE
    BEGIN
        UPDATE Parametry
        SET Parametr_nazev = '100MEGA'
        WHERE parametrproduktID = @produktID
    END

    FETCH NEXT FROM product_cursor INTO @produktID, @produktnazev, @productskryty
END

CLOSE produkt_cursor
DEALLOCATE produkt_cursor
