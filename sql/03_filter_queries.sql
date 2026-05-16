-- ============================================================
-- Filtering with WHERE
-- Practice: restricting rows with conditions (=, AND, OR, >).
-- ============================================================

-- 3. Find reviews with rating 5
SELECT
    review_id,
    review_text,
    rating
FROM reviews
WHERE rating = 5
LIMIT 10;

-- 4. Find negative reviews
SELECT
    review_id,
    review_text,
    rating,
    label_id
FROM reviews
WHERE label_id = 0
LIMIT 10;

-- 5. Find long reviews with more than 100 words
SELECT
    review_id,
    review_text,
    rating,
    word_count
FROM reviews
WHERE word_count > 100
LIMIT 10;

-- 6. Find long positive reviews
SELECT
    review_id,
    review_text,
    rating,
    word_count
FROM reviews
WHERE rating >= 4
  AND word_count > 100
LIMIT 10;

-- 7. Find very negative or very positive reviews
SELECT
    review_id,
    review_text,
    rating
FROM reviews
WHERE rating = 1
   OR rating = 5
LIMIT 10;
