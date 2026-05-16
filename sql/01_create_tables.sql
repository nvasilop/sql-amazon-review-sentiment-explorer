
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS labels;

CREATE TABLE labels (
    label_id INTEGER PRIMARY KEY,
    label_name TEXT NOT NULL,
    label_description TEXT
);

CREATE TABLE reviews (
    review_id INTEGER PRIMARY KEY,
    reviewer_id TEXT,
    product_id TEXT,
    reviewer_name TEXT,
    review_text TEXT,
    rating REAL,
    summary TEXT,
    review_date TEXT,
    day_diff INTEGER,
    helpful_yes INTEGER,
    total_vote INTEGER,
    text_length INTEGER,
    word_count INTEGER,
    label_id INTEGER,
    FOREIGN KEY (label_id) REFERENCES labels(label_id)
);

INSERT INTO labels (label_id, label_name, label_description)
VALUES
    (0, 'negative', 'Review with rating 1 or 2'),
    (1, 'neutral', 'Review with rating 3'),
    (2, 'positive', 'Review with rating 4 or 5'); 
    