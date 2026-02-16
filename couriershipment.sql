DECLARE @courierId INT = 3
DECLARE @shipmentId INT = 2

BEGIN TRAN

UPDATE Shipment
SET CourierId = @CourierId
WHERE ShipmentId = @ShipmentId;

save tran upshipment

IF not exists(
    select 1 from courier where isactive = 1
)
BEGIN
    ROLLBACK TRAN
END
ELSE
BEGIN
    IF @@ROWCOUNT = 0
    BEGIN
        ROLLBACK TRAN upshipment
    END
    ELSE
    BEGIN
        COMMIT
    END
END
