DROP DATABASE IF EXISTS StockPortfolioDB;
CREATE DATABASE StockPortfolioDB;
USE StockPortfolioDB;

CREATE TABLE Investor (
    InvestorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

CREATE TABLE BrokerageAccount (
    AccountID INT AUTO_INCREMENT PRIMARY KEY,
    AccountType VARCHAR(50),
    BrokerName VARCHAR(100),
    Balance DECIMAL(10,2),
    InvestorID INT
);

CREATE TABLE Company (
    CompanyID INT AUTO_INCREMENT PRIMARY KEY,
    CompanyName VARCHAR(100),
    Industry VARCHAR(100),
    Headquarters VARCHAR(100),
    FoundedYear INT
);

CREATE TABLE Stock (
    StockID INT AUTO_INCREMENT PRIMARY KEY,
    TickerSymbol VARCHAR(20),
    ExchangeName VARCHAR(50),
    CurrentPrice DECIMAL(10,2),
    CompanyID INT
);

CREATE TABLE TradeTransaction (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    TradeDate DATE,
    TradeType VARCHAR(10),
    Quantity INT,
    PricePerShare DECIMAL(10,2),
    AccountID INT,
    StockID INT
);

ALTER TABLE BrokerageAccount
ADD CONSTRAINT FK_Investor
FOREIGN KEY (InvestorID)
REFERENCES Investor(InvestorID);

ALTER TABLE Stock
ADD CONSTRAINT FK_Company
FOREIGN KEY (CompanyID)
REFERENCES Company(CompanyID);

ALTER TABLE TradeTransaction
ADD CONSTRAINT FK_Account
FOREIGN KEY (AccountID)
REFERENCES BrokerageAccount(AccountID);

ALTER TABLE TradeTransaction
ADD CONSTRAINT FK_Stock
FOREIGN KEY (StockID)
REFERENCES Stock(StockID);

INSERT INTO Investor (FirstName, LastName, Email, Phone)
VALUES
('John', 'Smith', 'john@email.com', '1111111111'),
('Jane', 'Doe', 'jane@email.com', '2222222222'),
('Mike', 'Johnson', 'mike@email.com', '3333333333');

INSERT INTO Company (CompanyName, Industry, Headquarters, FoundedYear)
VALUES
('Apple', 'Technology', 'California', 1976),
('Microsoft', 'Technology', 'Washington', 1975),
('Tesla', 'Automotive', 'Texas', 2003);

INSERT INTO Stock (TickerSymbol, ExchangeName, CurrentPrice, CompanyID)
VALUES
('AAPL', 'NASDAQ', 195.50, 1),
('MSFT', 'NASDAQ', 420.25, 2),
('TSLA', 'NASDAQ', 180.75, 3);

INSERT INTO BrokerageAccount (AccountType, BrokerName, Balance, InvestorID)
VALUES
('Individual', 'Fidelity', 10000.00, 1),
('Retirement', 'Charles Schwab', 15000.00, 2),
('Individual', 'Robinhood', 8000.00, 3);

INSERT INTO TradeTransaction
(TradeDate, TradeType, Quantity, PricePerShare, AccountID, StockID)
VALUES
('2026-01-01', 'BUY', 10, 195.50, 1, 1),
('2026-01-05', 'BUY', 5, 420.25, 2, 2),
('2026-01-10', 'SELL', 3, 180.75, 3, 3),
('2026-01-15', 'BUY', 20, 195.50, 1, 1),
('2026-01-20', 'SELL', 2, 420.25, 2, 2);