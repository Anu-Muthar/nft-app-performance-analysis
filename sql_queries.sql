-- 1. Monthly Revenue Trend
SELECT DATE_TRUNC('month', transaction_date) AS month,
       SUM(price) AS total_revenue
FROM nft_transactions
WHERE transaction_type = 'purchase'
GROUP BY month
ORDER BY month;

-- 2. Top NFT Categories
SELECT n.category, COUNT(t.transaction_id) AS sales_count, SUM(t.price) AS revenue
FROM nft_transactions t
JOIN nfts n ON t.nft_id = n.nft_id
WHERE t.transaction_type = 'purchase'
GROUP BY n.category
ORDER BY revenue DESC;

