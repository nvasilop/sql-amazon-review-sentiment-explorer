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