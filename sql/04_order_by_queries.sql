-- ============================================================
-- Sorting with ORDER BY
-- Practice: ASC / DESC and combining with WHERE when needed.
-- ============================================================

-- 8. Find the longest reviews by word count
SELECT
    review_id,
    review_text,
    rating,
    word_count
FROM reviews
ORDER BY word_count DESC
LIMIT 5;

-- 9. Find the shortest reviews by word count
SELECT
    review_id,
    review_text,
    rating,
    word_count
FROM reviews
ORDER BY word_count ASC
LIMIT 5;

-- 10. Find the most helpful reviews
SELECT
    review_id,
    review_text,
    rating,
    helpful_yes,
    total_vote
FROM reviews
ORDER BY helpful_yes DESC
LIMIT 5;

-- 11. Find the most recent reviews using day_diff
SELECT
    review_id,
    review_text,
    rating,
    review_date,
    day_diff
FROM reviews
ORDER BY day_diff ASC
LIMIT 10;

-- 12. Find the oldest reviews using day_diff
SELECT
    review_id,
    review_text,
    rating,
    review_date,
    day_diff
FROM reviews
ORDER BY day_diff DESC
LIMIT 10;

-- 13. Find the longest positive reviews
SELECT
    review_id,
    review_text,
    rating,
    word_count
FROM reviews
WHERE label_id = 2
ORDER BY word_count DESC
LIMIT 5;
