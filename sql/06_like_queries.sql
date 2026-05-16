-- ============================================================
-- Pattern matching with LIKE
-- Practice: searching text with '% wildcards'.
-- ============================================================

-- 22. Find reviews that contain the word "good"
SELECT
    review_id,
    review_text,
    rating
FROM reviews
WHERE review_text LIKE '%good%'
LIMIT 5;

-- 24. Find reviews with positive keywords
SELECT
    review_id,
    review_text,
    rating
FROM reviews
WHERE review_text LIKE '%good%'
   OR review_text LIKE '%great%'
   OR review_text LIKE '%excellent%'
   OR review_text LIKE '%amazing%'
LIMIT 5;

-- 25. Find reviews with negative keywords
SELECT
    review_id,
    review_text,
    rating
FROM reviews
WHERE review_text LIKE '%bad%'
   OR review_text LIKE '%poor%'
   OR review_text LIKE '%terrible%'
   OR review_text LIKE '%worst%'
LIMIT 5;

-- 26. Find low-rating reviews that contain the word "good"
SELECT
    review_id,
    review_text,
    rating
FROM reviews
WHERE rating <= 2
  AND review_text LIKE '%good%'
LIMIT 5;

-- 27. Find high-rating reviews that contain the word "bad"
SELECT
    review_id,
    review_text,
    rating
FROM reviews
WHERE rating >= 4
  AND review_text LIKE '%bad%'
LIMIT 5;

-- 28. Find summaries that contain the word "excellent"
SELECT
    review_id,
    summary,
    rating
FROM reviews
WHERE summary LIKE '%excellent%'
LIMIT 5;

-- 29. Count reviews that contain the word "good"
SELECT
    COUNT(*) AS reviews_with_good
FROM reviews
WHERE review_text LIKE '%good%';

-- 30. Count reviews with the word "good" by rating
SELECT
    rating,
    COUNT(*) AS reviews_with_good
FROM reviews
WHERE review_text LIKE '%good%'
GROUP BY rating
ORDER BY rating;

-- 31. Count reviews with the word "bad" by rating
SELECT
    rating,
    COUNT(*) AS reviews_with_bad
FROM reviews
WHERE review_text LIKE '%bad%'
GROUP BY rating
ORDER BY rating;
