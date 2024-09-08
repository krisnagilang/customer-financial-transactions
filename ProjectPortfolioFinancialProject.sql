SELECT *
FROM financial_transactions;

-- Total Transaksi per Kategori
SELECT 
	Category,
	ROUND(SUM(TransactionAmount), 2) AS TotalAmount
FROM financial_transactions
GROUP BY Category
ORDER BY TotalAmount DESC;

-- Jumlah Transaksi per Kategori
SELECT 
	Category,
	SUM(TransactionAmount) AS TotalAmount
FROM financial_transactions
GROUP BY Category;

-- Jumlah Transaksi berdasarkan metode pembayaran
SELECT
	PaymentMethod,
    COUNT(*) AS TotalPaymentMethod
FROM financial_transactions
GROUP BY PaymentMethod;

-- Rata-rata jumlah Transaksi per Kategori
SELECT
	Category, 
    ROUND(AVG(TransactionAmount), 2) AS AverageAmount
FROM financial_transactions
GROUP BY Category
ORDER BY AverageAmount;

-- Total Transaksi per Merchant dan Jumlah Transaksi per Merchant
SELECT
	Merchant,
    COUNT(TransactionAmount) AS NumberOfTransactions,
    ROUND(SUM(TransactionAmount), 2) AS TotalAmount
FROM financial_transactions
GROUP BY Merchant;

-- Rata-rata Jumlah Transaksi Berdasarkan Usia Pelanggan
SELECT
	CustomerAge,
    ROUND(AVG(TransactionAmount), 2) AS AverageAmount
FROM financial_transactions
GROUP BY CustomerAge
ORDER BY CustomerAge ASC;

-- Jumlah Transaksi Berdasarkan Jenis Kelamin Pelanggan
WITH GenderTransactions AS (
	SELECT 
		CustomerGender,
		COUNT(*) AS NumberOfTransactions
	FROM financial_transactions
	GROUP BY CustomerGender
), TotalGenderTransactions AS (
	SELECT
		SUM(NumberOfTransactions) AS TotalTransactions
	FROM GenderTransactions
)
SELECT
	gt.CustomerGender,
    gt.NumberOftransactions,
    ROUND(100.0 * 
		(CAST(gt.NumberOftransactions AS FLOAT) / gtg.TotalTransactions)
	, 2) AS PercentageNumberOfTransactions
FROM 
	GenderTransactions gt,
    TotalGenderTransactions gtg;
    
-- Transaksi Terbesar per Pelanggan
SELECT
	CustomerID,
    CustomerGender,
    MAX(TransactionAmount) AS MaxTransaction
FROM financial_transactions
GROUP BY CustomerID, CustomerGender;

-- Pendapatan Rata-rata Pelanggan Berdasarkan Kategori Transaksi
SELECT
	Category,
    AVG(CustomerIncome) AS AverageIncome
FROM financial_transactions
GROUP BY Category;

-- Transaksi Berdasarkan Tanggal
SELECT
	TransactionDate,
    SUM(TransactionAmount) AS TotalAmount
FROM financial_transactions
GROUP BY TransactionDate
ORDER BY TransactionDate ASC;

-- Total Transaksi per tahun
SELECT
	EXTRACT(YEAR FROM TransactionDate) AS Year,
    SUM(TransactionAmount) AS TotalAmount
FROm financial_transactions
GROUP BY EXTRACT(YEAR FROM transactionDate)
ORDER BY Year ASC;

--  Jumlah Transaksi Berdasarkan Usia dan Jenis Kelamin Pelanggan
SELECT
	CustomerAge,
    CustomerGender,
    COUNT(*) AS NumberOfTransactions
FROM financial_transactions
GROUP BY CustomerAge, CustomerGender
ORDER BY CustomerAge;























