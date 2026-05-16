-- ============================================================
-- Basic SELECT queries
-- Practice: picking columns and limiting rows with LIMIT.
-- ============================================================

-- 1. Show the first 10 reviews
SELECT *
FROM reviews
LIMIT 10;

-- 2. Show selected columns from the first 10 reviews
SELECT
    review_id,
    review_text,
    rating,
    word_count
FROM reviews
LIMIT 10;
