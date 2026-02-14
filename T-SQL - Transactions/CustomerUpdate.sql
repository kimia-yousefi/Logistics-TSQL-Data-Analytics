DECLARE @CustomerId INT = 3;
DECLARE @Number INT = 132;

BEGIN TRAN;


UPDATE Customer
SET Number = @Number
WHERE Id = @CustomerId;


SAVE TRAN CustomerUpdate;


IF NOT EXISTS (
    SELECT 1
    FROM CustomerInfo
    WHERE CustomerId = @CustomerId
)
BEGIN
    PRINT 'CustomerInfo not found!';
    ROLLBACK TRAN;  
END
ELSE
BEGIN
    IF @@ROWCOUNT = 0
    BEGIN
        PRINT 'No update happened!';
        ROLLBACK TRAN CustomerUpdate;  
    END
    ELSE
    BEGIN
        COMMIT;  
    END
END
