-- ============================================================
-- Conditional logic with CASE WHEN
-- Practice: bucketing values and grouping by derived categories.
-- ============================================================

-- 32. Create sentiment labels from rating using CASE WHEN
SELECT
    review_id,
    rating,
    CASE
        WHEN rating <= 2 THEN 'negative'
        WHEN rating = 3 THEN 'neutral'
        ELSE 'positive'
    END AS sentiment
FROM reviews
LIMIT 20;


-- 33. Create helpful vote categories
SELECT
    review_id,
    helpful_yes,
    total_vote,
    CASE
        WHEN helpful_yes = 0 THEN 'no helpful votes'
        WHEN helpful_yes BETWEEN 1 AND 5 THEN 'some helpful votes'
        ELSE 'many helpful votes'
    END AS helpful_category
FROM reviews
LIMIT 20;


-- 34. Count reviews by length category
SELECT
    CASE
        WHEN word_count < 50 THEN 'short'
        WHEN word_count BETWEEN 50 AND 150 THEN 'medium'
        ELSE 'long'
    END AS length_category,
    COUNT(*) AS total_reviews
FROM reviews
GROUP BY length_category
ORDER BY total_reviews DESC;


-- 35. Average rating by length category
SELECT
    CASE
        WHEN word_count < 50 THEN 'short'
        WHEN word_count BETWEEN 50 AND 150 THEN 'medium'
        ELSE 'long'
    END AS length_category,
    COUNT(*) AS total_reviews,
    AVG(rating) AS average_rating
FROM reviews
GROUP BY length_category
ORDER BY average_rating DESC;


-- 36. Count sentiment labels by review length category
SELECT
    label_id,
    CASE
        WHEN word_count < 50 THEN 'short'
        WHEN word_count BETWEEN 50 AND 150 THEN 'medium'
        ELSE 'long'
    END AS length_category,
    COUNT(*) AS total_reviews
FROM reviews
GROUP BY label_id, length_category
ORDER BY label_id, total_reviews DESC;
