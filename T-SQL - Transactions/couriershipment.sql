DECLARE @courierId INT = 3
DECLARE @shipmentId INT = 2

BEGIN TRAN

UPDATE Shipment
SET CourierId = @CourierId
WHERE ShipmentId = @ShipmentId;

save tran upshipment

IF NOT EXISTS(
    SELECT 1 
    FROM Courier 
    WHERE CourierId = @CourierId AND IsActive = 1
)
BEGIN
    PRINT 'Courier is not active'
    ROLLBACK TRAN
END
ELSE
BEGIN
    PRINT 'Shipment not found'
    IF @@ROWCOUNT = 0
    BEGIN
        ROLLBACK TRAN upshipment
    END
    ELSE
    BEGIN
        COMMIT
    END
END
