
DECLARE @IPNSourceFileName NVARCHAR(255);
SET @IPNSourceFileName = 'Transaction-20250112A.txt';

------------------------------------------------------------------------------------------------------------
CREATE TABLE #DeletedIPNTransactionIds (
    TransactionId NVARCHAR(36)
);

-- Delete from IPNReconciliation_ReconciliationResultsTransactions and capture TransactionIds
INSERT INTO #DeletedIPNTransactionIds (TransactionId)
SELECT IPNTransactionId
FROM [UiPath Processes Data].[dbo].[IPNReconciliation_ReconciliationResultsTransactions]
WHERE IPNSourceFileName = @IPNSourceFileName;

DELETE FROM [UiPath Processes Data].[dbo].[IPNReconciliation_ReconciliationResultsTransactions]
WHERE IPNSourceFileName = @IPNSourceFileName;
-------------------------------------------------------------------------------------------------------------
DELETE FROM [UiPath Processes Data].[dbo].[IPNReconciliation_ArchivingIPNRowTransactions]
WHERE SourceFileName = @IPNSourceFileName;

DELETE FROM [UiPath Processes Data].[dbo].[IPNReconciliation_StagingIPNTransactions]
WHERE SourceFileName = @IPNSourceFileName;

-- Copy matching rows from Core Banking Archiving to Core Banking Staging
INSERT INTO [UiPath Processes Data].[dbo].[IPNReconciliation_StagingCoreBankingTransactions] (
    ProductId, RecId, PartyType, TransactionCurrency, DebitAccountNumber, CreditAccountNumber, 
    StatusCode, StatusDescription, ValueDate, ProcessingDate, TransactionAmount, AdditionalInfo, 
    PaymentId, OrderingCustomer, DateTime, StatusReasonCode, EnteringTime, SourceFileName
)
SELECT 
    cb.ProductId, cb.RecId, cb.PartyType, cb.TransactionCurrency, cb.DebitAccountNumber, 
    cb.CreditAccountNumber, cb.StatusCode, cb.StatusDescription, cb.ValueDate, cb.ProcessingDate, 
    cb.TransactionAmount, cb.AdditionalInfo, cb.PaymentId, cb.OrderingCustomer, cb.DateTime, 
    cb.StatusReasonCode, cb.EnteringTime, cb.SourceFileName
FROM [UiPath Processes Data].[dbo].[IPNReconciliation_ArchivingCoreBankingRowTransactions] cb
JOIN #DeletedIPNTransactionIds ipn ON cb.AdditionalInfo = ipn.TransactionId;

-- Drop the temporary table
DROP TABLE #DeletedIPNTransactionIds;


------------------------------------------------------------------------------------------
/*
DECLARE @IPNSourceFileName NVARCHAR(255);
SET @IPNSourceFileName = 'Transaction-20250112A.txt';

-- Delete from IPNReconciliation_ArchivingIPNRowTransactions
DELETE FROM [UiPath Processes Data].[dbo].[IPNReconciliation_ArchivingIPNRowTransactions]
WHERE SourceFileName = @IPNSourceFileName;

-- Delete from IPNReconciliation_StagingIPNTransactions
DELETE FROM [UiPath Processes Data].[dbo].[IPNReconciliation_StagingIPNTransactions]
WHERE SourceFileName = @IPNSourceFileName;

-- Copy matching rows from Core Banking Archiving to Core Banking Staging
INSERT INTO [UiPath Processes Data].[dbo].[IPNReconciliation_StagingCoreBankingTransactions] (
    ProductId, RecId, PartyType, TransactionCurrency, DebitAccountNumber, CreditAccountNumber, 
    StatusCode, StatusDescription, ValueDate, ProcessingDate, TransactionAmount, AdditionalInfo, 
    PaymentId, OrderingCustomer, DateTime, StatusReasonCode, EnteringTime, SourceFileName
)
SELECT 
    cb.ProductId, cb.RecId, cb.PartyType, cb.TransactionCurrency, cb.DebitAccountNumber, 
    cb.CreditAccountNumber, cb.StatusCode, cb.StatusDescription, cb.ValueDate, cb.ProcessingDate, 
    cb.TransactionAmount, cb.AdditionalInfo, cb.PaymentId, cb.OrderingCustomer, cb.DateTime, 
    cb.StatusReasonCode, cb.EnteringTime, cb.SourceFileName
FROM [UiPath Processes Data].[dbo].[IPNReconciliation_ArchivingCoreBankingRowTransactions] cb
JOIN [UiPath Processes Data].[dbo].[IPNReconciliation_ReconciliationResultsTransactions] ipn
ON cb.AdditionalInfo = ipn.IPNTransactionId
WHERE ipn.IPNSourceFileName = @IPNSourceFileName;


DELETE FROM [UiPath Processes Data].[dbo].[IPNReconciliation_ReconciliationResultsTransactions]
WHERE SourceFileName = @IPNSourceFileName;


DECLARE @IPNSourceFileName NVARCHAR(255);
SET @IPNSourceFileName = 'Transaction-20250112A.txt';

SELECT 
    cb.ProductId, cb.RecId, cb.PartyType, cb.TransactionCurrency, cb.DebitAccountNumber, 
    cb.CreditAccountNumber, cb.StatusCode, cb.StatusDescription, cb.ValueDate, cb.ProcessingDate, 
    cb.TransactionAmount, cb.AdditionalInfo, cb.PaymentId, cb.OrderingCustomer, cb.DateTime, 
    cb.StatusReasonCode, cb.EnteringTime, cb.SourceFileName
FROM [UiPath Processes Data].[dbo].[IPNReconciliation_ArchivingCoreBankingRowTransactions] cb
JOIN [UiPath Processes Data].[dbo].[IPNReconciliation_ReconciliationResultsTransactions] ipn
ON cb.AdditionalInfo = ipn.IPNTransactionId
WHERE ipn.IPNSourceFileName = @IPNSourceFileName;
*/