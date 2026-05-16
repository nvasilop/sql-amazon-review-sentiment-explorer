import sqlite3
from pathlib import Path

import pandas as pd

BASE_DIR = Path(__file__).resolve().parent.parent

CSV_PATH = BASE_DIR / "data" / "amazon_review.csv"
DB_PATH = BASE_DIR / "database" / "amazon.db"
SQL_PATH = BASE_DIR / "sql" / "01_create_tables.sql"

# Η 1η γραμμή του CSV έχει κατά λάθος κείμενο πριν το reviewerID — παραλείπεται και δίνουμε ονόματα εμείς.
CSV_COLUMNS = [
    "reviewerID",
    "asin",
    "reviewerName",
    "helpful",
    "reviewText",
    "overall",
    "summary",
    "unixReviewTime",
    "reviewTime",
    "day_diff",
    "helpful_yes",
    "total_vote",
]


def create_sentiment_label(rating):
    if rating <= 2:
        return 0  # negative
    elif rating == 3:
        return 1  # neutral
    else:
        return 2  # positive

def count_words(text):
        text = str(text)
        words = text.split()
        return len(words)

def main():
    DB_PATH.parent.mkdir(exist_ok=True)

    conn = sqlite3.connect(DB_PATH)

    with open(SQL_PATH, "r", encoding="utf-8") as file:
        sql_script = file.read()

    conn.executescript(sql_script)

    df = pd.read_csv(
        CSV_PATH,
        skiprows=[0],
        names=CSV_COLUMNS,
        encoding="utf-8",
    )

    df = df.rename(columns={
        "reviewerID": "reviewer_id",
        "asin": "product_id",
        "reviewerName": "reviewer_name",
        "reviewText": "review_text",
        "overall": "rating",
        "reviewTime": "review_date"
    })

    df["review_text"] = df["review_text"].fillna("")
    df["summary"] = df["summary"].fillna("")
    df["reviewer_name"] = df["reviewer_name"].fillna("Unknown")

    df["text_length"] = df["review_text"].apply(len)
    df["word_count"] = df["review_text"].apply(count_words)
    df["label_id"] = df["rating"].apply(create_sentiment_label) 

    final_df = df[
        [
            "reviewer_id",
            "product_id",
            "reviewer_name",
            "review_text",
            "rating",
            "summary",
            "review_date",
            "day_diff",
            "helpful_yes",
            "total_vote",
            "text_length",
            "word_count",
            "label_id"
        ]
    ]
    final_df.to_sql("reviews", conn, if_exists="append", index=False)
    conn.close()
    print("Data imported successfully")
    print(f"Rows imported: {len(final_df)}")
    print(f"Database path: {DB_PATH}")

if __name__ == "__main__":
    main()