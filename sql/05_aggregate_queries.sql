-- ============================================================
-- Aggregates and GROUP BY
-- Practice: COUNT, AVG, MIN, MAX and grouping rows.
-- ============================================================

-- 14. Count all reviews
SELECT
    COUNT(*) AS total_reviews
FROM reviews;

-- 15. Find the average word count of all reviews
SELECT
    AVG(word_count) AS average_word_count
FROM reviews;

-- 16. Find the shortest and longest review by word count
SELECT
    MIN(word_count) AS shortest_review,
    MAX(word_count) AS longest_review
FROM reviews;

-- 17. Count reviews by rating
SELECT
    rating,
    COUNT(*) AS total_reviews
FROM reviews
GROUP BY rating
ORDER BY rating;

-- 18. Count reviews by sentiment label id
SELECT
    label_id,
    COUNT(*) AS total_reviews
FROM reviews
GROUP BY label_id
ORDER BY label_id;

-- 19. Average word count by rating
SELECT
    rating,
    AVG(word_count) AS average_word_count
FROM reviews
GROUP BY rating
ORDER BY rating;

-- 20. Text statistics by rating
SELECT
    rating,
    COUNT(*) AS total_reviews,
    AVG(word_count) AS average_word_count,
    MIN(word_count) AS shortest_review,
    MAX(word_count) AS longest_review
FROM reviews
GROUP BY rating
ORDER BY rating;

-- 21. Average helpful votes by rating
SELECT
    rating,
    COUNT(*) AS total_reviews,
    AVG(helpful_yes) AS average_helpful_votes,
    MAX(helpful_yes) AS max_helpful_votes
FROM reviews
GROUP BY rating
ORDER BY average_helpful_votes DESC;
