-- ============================================================
-- Combining tables with JOIN
-- Practice: linking reviews to the labels lookup table.
-- ============================================================

-- 37. Join reviews with sentiment labels
SELECT
    r.review_id,
    r.review_text,
    r.rating,
    r.label_id,
    l.label_name
FROM reviews r
JOIN labels l
ON r.label_id = l.label_id
LIMIT 5;

-- 38. Count reviews by sentiment label name
SELECT
    l.label_name,
    COUNT(*) AS total_reviews
FROM reviews r
JOIN labels l
ON r.label_id = l.label_id
GROUP BY l.label_name
ORDER BY total_reviews DESC;

-- 39. Average word count by sentiment label
SELECT
    l.label_name,
    COUNT(*) AS total_reviews,
    AVG(r.word_count) AS average_word_count
FROM reviews r
JOIN labels l
ON r.label_id = l.label_id
GROUP BY l.label_name
ORDER BY average_word_count DESC;

-- 40. Text statistics by sentiment label
SELECT
    l.label_name,
    COUNT(*) AS total_reviews,
    AVG(r.word_count) AS average_word_count,
    MIN(r.word_count) AS shortest_review,
    MAX(r.word_count) AS longest_review
FROM reviews r
JOIN labels l
ON r.label_id = l.label_id
GROUP BY l.label_name
ORDER BY total_reviews DESC;

-- 41. Count review length categories by sentiment label
SELECT
    l.label_name,
    CASE
        WHEN r.word_count < 50 THEN 'short'
        WHEN r.word_count BETWEEN 50 AND 150 THEN 'medium'
        ELSE 'long'
    END AS length_category,
    COUNT(*) AS total_reviews
FROM reviews r
JOIN labels l
ON r.label_id = l.label_id
GROUP BY l.label_name, length_category
ORDER BY l.label_name, total_reviews DESC;

-- 42. Positive reviews that contain the word "easy"
SELECT
    r.review_id,
    r.review_text,
    r.rating,
    l.label_name
FROM reviews r
JOIN labels l
ON r.label_id = l.label_id
WHERE l.label_name = 'positive'
  AND r.review_text LIKE '%easy%'
LIMIT 5;
