DECLARE @orderId int = 2
DECLARE @NStatus int = 22

BEGIN TRAN;

UPDATE orders 
SET status = @NStatus
WHERE orderId = @orderId 

SAVE TRAN changestatus

IF not EXISTS (
    SELECT 1 from customerinfo 
    WHERE customerId = (
        select customerId 
        from orders 
        where orderid = @orderId)
)
BEGIN
    PRINT "customer is not active"
    ROLLBACK TRAN
END
ELSE
BEGIN
    IF @@ROWCOUNT = 0
    BEGIN
    PRINT "order not found"
    ROLLBACK TRAN changestatus
    END
    ELSE
    BEGIN
        COMMIT
    END
END
