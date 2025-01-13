--IPN Reconciliation tables creation :

-- Create table: IPNReconciliation_ArchivingIPNRowTransactions
CREATE TABLE [UiPath Processes Data].[dbo].[IPNReconciliation_ArchivingIPNRowTransactions] (
    Id INT IDENTITY(1,1) PRIMARY KEY CLUSTERED,
    TransactionId NVARCHAR(36) NOT NULL,
    TransactionType NVARCHAR(32),
    SwitchDate NVARCHAR(10),
    TransactionTimeStamp NVARCHAR(23),
    BankRole NVARCHAR(14),
    -- Transaction Amounts
    TransactionAmount NVARCHAR(18),
    TransactionAmountCurrency NVARCHAR(3),
    -- Fee Information
    PayerPspFeesAmount NVARCHAR(18),
    PayerPspFeesAmountCurrency NVARCHAR(3),
    PayerPspBearFeesAmount NVARCHAR(18),
    PayerPspBearFeesAmountCurrency NVARCHAR(3),
    InterchangeAmount NVARCHAR(18),
    InterchangeAmountAction NVARCHAR(6),
    InterchangeAmountCurrency NVARCHAR(3),
    -- Payer Information
    PayerMobileNumber NVARCHAR(14),
    PayerIpa NVARCHAR(100),
    PayerName NVARCHAR(100),
    PayerAccountUniqueIdentifier NVARCHAR(36),
    PayerIdentificationType NVARCHAR(8),
    PayerIdentificationNumber NVARCHAR(30),
    PayerClearAccountNumber NVARCHAR(50),
    -- Payee Information
    PayeeMobileNumber NVARCHAR(14),
    PayeeIpa NVARCHAR(100),
    PayeeName NVARCHAR(100),
    PayeeAccountUniqueIdentifier NVARCHAR(36),
    PayeeIdentificationType NVARCHAR(8),
    PayeeIdentificationNumber NVARCHAR(30),
    PayeeClearAccountNumber NVARCHAR(50),
    -- Terminal Information
    TerminalLocation NVARCHAR(40),
    TerminalLongitude NVARCHAR(15),
    TerminalLatitude NVARCHAR(15),
    -- Transaction Details
    TransactionRemark NVARCHAR(100),
    InterfaceId NVARCHAR(15),
    InterfaceName NVARCHAR(100),
    GatewayTransactionId NVARCHAR(36),
    AuthorizationNumber NVARCHAR(15),
    IsReversal NVARCHAR(1),
    Result NVARCHAR(15),
    ResponseCode NVARCHAR(5),
    ResponseDescription NVARCHAR(256),
    -- Bank Information
    PayerBankId NVARCHAR(4),
    PayeeBankId NVARCHAR(4),
    DebitPoolAccount NVARCHAR(36),
    CreditPoolAccount NVARCHAR(36),
    -- Additional Fee Information
    BankFeeAmount NVARCHAR(18),
    BankFeeCurrency NVARCHAR(3),
    ConvenienceFeeAmount NVARCHAR(18),
    ConvenienceFeeCurrency NVARCHAR(3),
    TipsFeeAmount NVARCHAR(18),
    TipsFeeCurrency NVARCHAR(3),
    EnteringTime DATETIME DEFAULT GETDATE(),
    SourceFileName NVARCHAR(255)
);
GO

-- Create table: IPNReconciliation_StagingIPNTransactions
CREATE TABLE [UiPath Processes Data].[dbo].[IPNReconciliation_StagingIPNTransactions] (
    Id INT IDENTITY(1,1) PRIMARY KEY CLUSTERED,
    TransactionId NVARCHAR(36) NOT NULL,
    TransactionType NVARCHAR(32),
    SwitchDate NVARCHAR(10),
    TransactionTimeStamp NVARCHAR(23),
    BankRole NVARCHAR(14),
    -- Transaction Amounts
    TransactionAmount NVARCHAR(18),
    TransactionAmountCurrency NVARCHAR(3),
    -- Fee Information
    PayerPspFeesAmount NVARCHAR(18),
    PayerPspFeesAmountCurrency NVARCHAR(3),
    PayerPspBearFeesAmount NVARCHAR(18),
    PayerPspBearFeesAmountCurrency NVARCHAR(3),
    InterchangeAmount NVARCHAR(18),
    InterchangeAmountAction NVARCHAR(6),
    InterchangeAmountCurrency NVARCHAR(3),
    -- Payer Information
    PayerMobileNumber NVARCHAR(14),
    PayerIpa NVARCHAR(100),
    PayerName NVARCHAR(100),
    PayerAccountUniqueIdentifier NVARCHAR(36),
    PayerIdentificationType NVARCHAR(8),
    PayerIdentificationNumber NVARCHAR(30),
    PayerClearAccountNumber NVARCHAR(50),
    -- Payee Information
    PayeeMobileNumber NVARCHAR(14),
    PayeeIpa NVARCHAR(100),
    PayeeName NVARCHAR(100),
    PayeeAccountUniqueIdentifier NVARCHAR(36),
    PayeeIdentificationType NVARCHAR(8),
    PayeeIdentificationNumber NVARCHAR(30),
    PayeeClearAccountNumber NVARCHAR(50),
    -- Terminal Information
    TerminalLocation NVARCHAR(40),
    TerminalLongitude NVARCHAR(15),
    TerminalLatitude NVARCHAR(15),
    -- Transaction Details
    TransactionRemark NVARCHAR(100),
    InterfaceId NVARCHAR(15),
    InterfaceName NVARCHAR(100),
    GatewayTransactionId NVARCHAR(36),
    AuthorizationNumber NVARCHAR(15),
    IsReversal NVARCHAR(1),
    Result NVARCHAR(15),
    ResponseCode NVARCHAR(5),
    ResponseDescription NVARCHAR(256),
    -- Bank Information
    PayerBankId NVARCHAR(4),
    PayeeBankId NVARCHAR(4),
    DebitPoolAccount NVARCHAR(36),
    CreditPoolAccount NVARCHAR(36),
    -- Additional Fee Information
    BankFeeAmount NVARCHAR(18),
    BankFeeCurrency NVARCHAR(3),
    ConvenienceFeeAmount NVARCHAR(18),
    ConvenienceFeeCurrency NVARCHAR(3),
    TipsFeeAmount NVARCHAR(18),
    TipsFeeCurrency NVARCHAR(3),
    EnteringTime DATETIME DEFAULT GETDATE(),
    SourceFileName NVARCHAR(255)
);

-- Create indexes for frequently queried columns
CREATE NONCLUSTERED INDEX [IX_IPNReconciliation_ArchivingIPNRowTransactions_TransactionId]
ON [UiPath Processes Data].[dbo].[IPNReconciliation_ArchivingIPNRowTransactions](TransactionId);

CREATE NONCLUSTERED INDEX [IX_IPNReconciliation_ArchivingIPNRowTransactions_SwitchDate]
ON [UiPath Processes Data].[dbo].[IPNReconciliation_ArchivingIPNRowTransactions](SwitchDate);

CREATE NONCLUSTERED INDEX [IX_IPNReconciliation_StagingIPNTransactions_TransactionId]
ON [UiPath Processes Data].[dbo].[IPNReconciliation_StagingIPNTransactions](TransactionId);

CREATE NONCLUSTERED INDEX [IX_IPNReconciliation_StagingIPNTransactions_SwitchDate]
ON [UiPath Processes Data].[dbo].[IPNReconciliation_StagingIPNTransactions](SwitchDate);
GO



-- Create table: IPNReconciliation_ArchivingCoreBankingRowTransactions
CREATE TABLE [UiPath Processes Data].[dbo].[IPNReconciliation_ArchivingCoreBankingRowTransactions] (
    Id INT IDENTITY(1,1) PRIMARY KEY CLUSTERED,
    ProductId NVARCHAR(50),
    RecId NVARCHAR(50),
    PartyType NVARCHAR(50),
    TransactionCurrency NVARCHAR(3),
    DebitAccountNumber NVARCHAR(50),
    CreditAccountNumber NVARCHAR(50),
    StatusCode NVARCHAR(10),
    StatusDescription NVARCHAR(256),
    ValueDate NVARCHAR(10),
    ProcessingDate NVARCHAR(10),
    TransactionAmount NVARCHAR(18),
    AdditionalInfo NVARCHAR(256),
    PaymentId NVARCHAR(36),
    OrderingCustomer NVARCHAR(100),
    DateTime NVARCHAR(23),
    StatusReasonCode NVARCHAR(10),
    EnteringTime DATETIME DEFAULT GETDATE(),
    SourceFileName NVARCHAR(255)
);


-- Create table: IPNReconciliation_StagingCoreBankingTransactions
CREATE TABLE [UiPath Processes Data].[dbo].[IPNReconciliation_StagingCoreBankingTransactions] (
    Id INT IDENTITY(1,1) PRIMARY KEY CLUSTERED,
    ProductId NVARCHAR(50),
    RecId NVARCHAR(50),
    PartyType NVARCHAR(50),
    TransactionCurrency NVARCHAR(3),
    DebitAccountNumber NVARCHAR(50),
    CreditAccountNumber NVARCHAR(50),
    StatusCode NVARCHAR(10),
    StatusDescription NVARCHAR(256),
    ValueDate NVARCHAR(10),
    ProcessingDate NVARCHAR(10),
    TransactionAmount NVARCHAR(18),
    AdditionalInfo NVARCHAR(256),
    PaymentId NVARCHAR(36),
    OrderingCustomer NVARCHAR(100),
    DateTime NVARCHAR(23), 
    StatusReasonCode NVARCHAR(10),
    EnteringTime DATETIME DEFAULT GETDATE(),
    SourceFileName NVARCHAR(255)
);

-- Add index for IPNReconciliation_ArchivingCoreBankingRowTransactions
CREATE NONCLUSTERED INDEX [IX_IPNReconciliation_ArchivingCoreBankingRowTransactions_AdditionalInfo]
ON [UiPath Processes Data].[dbo].[IPNReconciliation_ArchivingCoreBankingRowTransactions](AdditionalInfo);
GO

-- Add index for IPNReconciliation_StagingCoreBankingTransactions
CREATE NONCLUSTERED INDEX [IX_IPNReconciliation_StagingCoreBankingTransactions_AdditionalInfo]
ON [UiPath Processes Data].[dbo].[IPNReconciliation_StagingCoreBankingTransactions](AdditionalInfo);
GO


/*
CREATE VIEW [dbo].[IPNReconciliation_ReconciliationView] AS
SELECT 
    ipn.TransactionId AS IPNTransactionId,
	ipn.InterchangeAmountAction As IPNInterchangeAmountAction,
	cb.PartyType AS CoreBankingPartyType,
    cb.StatusCode AS CoreBankingStatusCode,
    ipn.Result AS IPNResult,
    cb.TransactionAmount AS CoreBankingTransactionAmount,
    ipn.TransactionAmount AS IPNTransactionAmount,
    cb.ValueDate AS CoreBankingValueDate,
    ipn.SwitchDate AS IPNSwitchDate,
    ipn.TransactionTimeStamp AS IPNTransactionTimeStamp


FROM 
    [UiPath Processes Data].[dbo].[IPNReconciliation_StagingCoreBankingTransactions] cb
LEFT JOIN 
    [UiPath Processes Data].[dbo].[IPNReconciliation_StagingIPNTransactions] ipn
ON 
    cb.AdditionalInfo = ipn.TransactionId;

*/

CREATE VIEW [dbo].[IPNReconciliation_ReconciliationView] AS
WITH RankedTransactions AS (
    SELECT 
        ipn.TransactionId AS IPNTransactionId,
        ipn.InterchangeAmountAction AS IPNInterchangeAmountAction,
        cb.PartyType AS CoreBankingPartyType,
		cb.StatusDescription AS CoreBankingStatusDescription,
        cb.StatusCode AS CoreBankingStatusCode,
        ipn.Result AS IPNResult,
		ipn.ResponseCode AS IPNResponseCode,
        cb.TransactionAmount AS CoreBankingTransactionAmount,
        ipn.TransactionAmount AS IPNTransactionAmount,
        cb.DateTime AS CoreBankingValueDateTime,
        ipn.SwitchDate AS IPNSwitchDate,
		ipn.SourceFileName AS IPNSourceFileName,
		cb.SourceFileName AS CoreBankingSourceFileName,
        ipn.TransactionTimeStamp AS IPNTransactionTimeStamp,
        ROW_NUMBER() OVER (
            PARTITION BY ipn.TransactionId
            ORDER BY cb.DateTime DESC
        ) AS RowNum
    FROM 
        [UiPath Processes Data].[dbo].[IPNReconciliation_StagingCoreBankingTransactions] cb
    LEFT JOIN 
        [UiPath Processes Data].[dbo].[IPNReconciliation_StagingIPNTransactions] ipn
    ON 
        cb.AdditionalInfo = ipn.TransactionId
)
SELECT 
    IPNTransactionId,
    IPNInterchangeAmountAction,
    CoreBankingPartyType,
    CoreBankingStatusCode,
	CoreBankingStatusDescription,
    IPNResult,
	IPNResponseCode,
    CoreBankingTransactionAmount,
    IPNTransactionAmount,
    CoreBankingValueDateTime,
    IPNSwitchDate,
	IPNSourceFileName,
	CoreBankingSourceFileName,
    IPNTransactionTimeStamp
FROM 
    RankedTransactions
WHERE 
    RowNum = 1;


CREATE TABLE [UiPath Processes Data].[dbo].[IPNReconciliation_ReconciliationResultsTransactions]
(
    Id INT IDENTITY(1,1),
    IPNTransactionId NVARCHAR(36) NOT NULL,
    IPNInterchangeAmountAction NVARCHAR(6),
	CoreBankingPartyType NVARCHAR(10),
	CoreBankingStatusDescription NVARCHAR(100),
    CoreBankingStatusCode NVARCHAR(10),
    IPNResult NVARCHAR(15),
	IPNResponseCode NVARCHAR(10),
    CoreBankingTransactionAmount NVARCHAR(18),
    IPNTransactionAmount NVARCHAR(18),
    CoreBankingValueDate NVARCHAR(10),
    IPNSwitchDate NVARCHAR(10),
	IPNTransactionTimeStamp NVARCHAR(40),
    ReconciliationStatus NVARCHAR(15),
    ReconciliationResult NVARCHAR(100),
    ReconciliationNote NVARCHAR(256),
    ReconciliationDate DATETIME DEFAULT GETDATE(),
	IPNSourceFileName NVARCHAR(255),
	CoreBankingSourceFileName  NVARCHAR(255)
    CONSTRAINT [PK_IPNReconciliation_ReconciliationResultsTransactions] PRIMARY KEY CLUSTERED (Id ASC)
);

CREATE NONCLUSTERED INDEX [IX_IPNReconciliation_ReconciliationResultsTransactions_IPNTransactionId] 
ON [UiPath Processes Data].[dbo].[IPNReconciliation_ReconciliationResultsTransactions] (IPNTransactionId);

CREATE NONCLUSTERED INDEX [IX_IPNReconciliation_ReconciliationResultsTransactions_ReconciliationStatus] 
ON [UiPath Processes Data].[dbo].[IPNReconciliation_ReconciliationResultsTransactions] (ReconciliationStatus);

CREATE NONCLUSTERED INDEX [IX_IPNReconciliation_ReconciliationResultsTransactions_ReconciliationDate] 
ON [UiPath Processes Data].[dbo].[IPNReconciliation_ReconciliationResultsTransactions] (ReconciliationDate);






/*

-- Count rows in IPNReconciliation_StagingIPNTransactions
SELECT COUNT(*) AS IPNStaging
FROM [UiPath Processes Data].[dbo].[IPNReconciliation_StagingIPNTransactions];

-- Count rows in IPNReconciliation_ArchivingIPNRowTransactions
SELECT COUNT(*) AS IPNArchiving
FROM [UiPath Processes Data].[dbo].[IPNReconciliation_ArchivingIPNRowTransactions];

-- Count rows in IPNReconciliation_StagingCoreBankingTransactions
SELECT COUNT(*) AS CoreStaging
FROM [UiPath Processes Data].[dbo].[IPNReconciliation_StagingCoreBankingTransactions];

-- Count rows in IPNReconciliation_ArchivingCoreBankingRowTransactions
SELECT COUNT(*) AS CoreArchiving
FROM [UiPath Processes Data].[dbo].[IPNReconciliation_ArchivingCoreBankingRowTransactions];

-- Count rows in IPNReconciliation_ReconciliationResultsTransactions
SELECT COUNT(*) AS Reconciled
FROM [UiPath Processes Data].[dbo].[IPNReconciliation_ReconciliationResultsTransactions];

*/
/*

--  rows in IPNReconciliation_StagingIPNTransactions
SELECT * 
FROM [UiPath Processes Data].[dbo].[IPNReconciliation_StagingIPNTransactions];

--  rows in IPNReconciliation_StagingCoreBankingTransactions
SELECT * 
FROM [UiPath Processes Data].[dbo].[IPNReconciliation_StagingCoreBankingTransactions];

--  rows in IPNReconciliation_ArchivingIPNRowTransactions
SELECT * 
FROM [UiPath Processes Data].[dbo].[IPNReconciliation_ArchivingIPNRowTransactions];

--  rows in IPNReconciliation_ArchivingCoreBankingRowTransactions
SELECT * 
FROM [UiPath Processes Data].[dbo].[IPNReconciliation_ArchivingCoreBankingRowTransactions];

-- rows in IPNReconciliation_ReconciliationResultsTransactions
SELECT *
FROM [UiPath Processes Data].[dbo].[IPNReconciliation_ReconciliationResultsTransactions];

*/

/*

-- Truncate IPNReconciliation_StagingIPNTransactions
TRUNCATE TABLE [UiPath Processes Data].[dbo].[IPNReconciliation_StagingIPNTransactions];

-- Truncate IPNReconciliation_ArchivingIPNRowTransactions
TRUNCATE TABLE [UiPath Processes Data].[dbo].[IPNReconciliation_ArchivingIPNRowTransactions];

-- Truncate IPNReconciliation_StagingCoreBankingTransactions
TRUNCATE TABLE [UiPath Processes Data].[dbo].[IPNReconciliation_StagingCoreBankingTransactions];

-- Truncate IPNReconciliation_ArchivingCoreBankingRowTransactions
TRUNCATE TABLE [UiPath Processes Data].[dbo].[IPNReconciliation_ArchivingCoreBankingRowTransactions];

-- Truncate IPNReconciliation_ReconciliationResultsTransactions
TRUNCATE TABLE [UiPath Processes Data].[dbo].[IPNReconciliation_ReconciliationResultsTransactions];

*/


SELECT * FROM [UiPath Processes Data].[dbo].[IPNReconciliation_ReconciliationView]

SELECT 
    ipn.TransactionId AS IPNTransactionId,
    ipn.InterchangeAmountAction AS IPNInterchangeAmountAction,
    cb.PartyType AS CoreBankingPartyType,
    cb.StatusCode AS CoreBankingStatusCode,
    ipn.Result AS IPNResult,
    cb.TransactionAmount AS CoreBankingTransactionAmount,
    ipn.TransactionAmount AS IPNTransactionAmount,
    cb.DateTime AS CoreBankingValueDateTime,
    ipn.SwitchDate AS IPNSwitchDate,
    ipn.TransactionTimeStamp AS IPNTransactionTimeStamp
FROM 
    [UiPath Processes Data].[dbo].[IPNReconciliation_StagingCoreBankingTransactions] cb
LEFT JOIN 
    [UiPath Processes Data].[dbo].[IPNReconciliation_StagingIPNTransactions] ipn
ON 
    cb.AdditionalInfo = ipn.TransactionId;



WITH RankedTransactions AS (
    SELECT 
        ipn.TransactionId AS IPNTransactionId,
        ipn.InterchangeAmountAction AS IPNInterchangeAmountAction,
        cb.PartyType AS CoreBankingPartyType,
        cb.StatusCode AS CoreBankingStatusCode,
        ipn.Result AS IPNResult,
        cb.TransactionAmount AS CoreBankingTransactionAmount,
        ipn.TransactionAmount AS IPNTransactionAmount,
        cb.DateTime AS CoreBankingValueDateTime,
        ipn.SwitchDate AS IPNSwitchDate,
        ipn.TransactionTimeStamp AS IPNTransactionTimeStamp,
        ROW_NUMBER() OVER (
            PARTITION BY ipn.TransactionId
            ORDER BY cb.DateTime DESC
        ) AS RowNum
    FROM 
        [UiPath Processes Data].[dbo].[IPNReconciliation_StagingCoreBankingTransactions] cb
    LEFT JOIN 
        [UiPath Processes Data].[dbo].[IPNReconciliation_StagingIPNTransactions] ipn
    ON 
        cb.AdditionalInfo = ipn.TransactionId
)
SELECT 
    IPNTransactionId,
    IPNInterchangeAmountAction,
    CoreBankingPartyType,
    CoreBankingStatusCode,
    IPNResult,
    CoreBankingTransactionAmount,
    IPNTransactionAmount,
    CoreBankingValueDateTime,
    IPNSwitchDate,
    IPNTransactionTimeStamp
FROM 
    RankedTransactions
WHERE 
    RowNum = 1;


