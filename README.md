# Amazon reviews — SQLite practice project

This is a small beginner-friendly project. You load **Amazon product reviews** from a CSV file into an **SQLite** database, then run **SQL queries** to explore the data.

If you have never used Git, Python virtual environments, or SQLite before: follow the steps in order and use copy-paste for the terminal commands.

---

## What I practiced

In this project, I practiced basic SQL commands:

- `SELECT` and `FROM`
- `WHERE`
- `ORDER BY` and `LIMIT`
- `LIKE`
- `COUNT`, `AVG`, `MIN`, `MAX`
- `GROUP BY`
- `CASE` … `WHEN`
- Basic `JOIN`

All examples live in **`sql/02_analysis_queries.sql`** once the database is loaded.

---

## Why this is related to NLP

NLP studies **human language** in text. Here the “documents” are **reviews** (`review_text`, `summary`), with numeric **ratings**, **sentiment-style labels**, and simple **counts/length** — typical alongside bigger NLP tasks (classification, embeddings, etc.). SQL lets you organize and summarize that mixed text + numeric data (`LIKE` for rough keyword checks, joins for labels), even though queries alone are **not** a language model.

---

## Example questions answered with SQL

These map to numbered queries in **`sql/02_analysis_queries.sql`**:

| Question (in plain words) | What SQL ideas it uses |
|---------------------------|-----------------------|
| Show the first 10 reviews | `SELECT` … `LIMIT` |
| List only 5‑star reviews | `WHERE rating = …` |
| Which reviews count as negative? | `WHERE label_id = …` |
| Reviews longer than 100 words | `WHERE` + `word_count` |
| Long reviews that still have high ratings | `WHERE` combining rating and word count |
| Longest vs shortest reviews by words | `ORDER BY` … `LIMIT`, `MIN` / `MAX` |
| Reviews that rank high on helpful votes | `ORDER BY helpful_yes` |
| Roughly **newer** vs **older** rows using `day_diff` | `ORDER BY day_diff` |
| How many reviews are there overall? How long are they on average? | `COUNT(*)`, `AVG(word_count)`, `GROUP BY rating` |
| Break down counts or averages **by rating** or **by label** | `GROUP BY`, aggregates |
| Find reviews mentioning “good”, “great”, “bad”, etc. | `LIKE '%word%'` (simple text search) |
| Build sentiment text from numeric rating in the query | `CASE WHEN` |
| Bucket reviews into short / medium / long | `CASE WHEN` + `GROUP BY` |
| Show each review’s human-readable label (negative / neutral / positive) | `JOIN` reviews ↔ labels |
| Combine labels, length buckets, keywords (e.g. “easy”) | `JOIN` + `CASE` + `LIKE` |

After you load **`database/amazon.db`**, open it with **`sqlite3`** and use **`.read sql/02_analysis_queries.sql`** (or paste single queries from the file) — that prints each result set, or lets you study questions one by one.

---

## What you need installed

- **Python 3** (version 3.10 or newer works well).
- **`sqlite3`** on your computer so you can open the database in the terminal (macOS and most Linux setups already have this).

---

## Project layout (simple map)

| Folder / file | What it is for |
|----------------|----------------|
| `data/amazon_review.csv` | Raw reviews (comma-separated values). |
| `sql/01_create_tables.sql` | Creates tables `labels` and `reviews` and inserts the basic label list. |
| `sql/02_analysis_queries.sql` | Example `SELECT` questions to explore the data. |
| `scripts/import_data.py` | Reads the CSV and fills the database. |
| `database/amazon.db` | The SQLite database file (created when you run the import script). |
| `requirements.txt` | Python packages needed for this project (here: **pandas**). |

---

## Step 1 — Open the terminal in this project folder

Go to the folder that contains `scripts`, `data`, `sql`, and `database`.

If your folder name has spaces, always put it in quotes, for example:

```bash
cd "/path/to/sql project"
```

---

## Step 2 — Create a virtual environment (recommended)

This keeps your Python packages for this project separate from everything else.

**macOS / Linux:**

```bash
python3 -m venv venv
source venv/bin/activate
```

You should see `(venv)` at the start of your terminal line when it worked.

---

## Step 3 — Install Python packages

```bash
pip install -r requirements.txt
```

---

## Step 4 — Build the database and load the data

Running the script does two important things:

1. It runs `sql/01_create_tables.sql` (creates empty tables plus the starter rows in `labels`).
2. It reads `data/amazon_review.csv` and inserts the reviews into `reviews`.

```bash
python scripts/import_data.py
```

When it succeeds, you should see a short message including how many rows were imported.

**About the CSV file:** the very first line of `amazon_review.csv` has a typo on it (extra text before the real column names). The script skips that broken line and uses its own column names so the import still works.

---

## Step 5 — Run example SQL queries

Open the SQLite program on your database file:

```bash
sqlite3 database/amazon.db
```

Inside SQLite, dot-commands must start with a **dot**. To run the whole examples file:

```sql
.read sql/02_analysis_queries.sql
```

**Common mistake:** typing `read` without the dot. SQLite then thinks you started a SQL statement and shows `...>` until you cancel (for example with **Ctrl+C**) and try again with `.read`.

To leave SQLite:

```sql
.quit
```

**One-shot from the terminal (without entering interactive mode):**

```bash
sqlite3 database/amazon.db ".read sql/02_analysis_queries.sql"
```

---

## How the sentiment labels work

Rows in `reviews` have a **`label_id`** that points to **`labels`**:

| label_id | Meaning (based on star rating on the CSV) |
|----------|--------------------------------------------|
| 0 | Negative (rating 1 or 2) |
| 1 | Neutral (rating 3) |
| 2 | Positive (rating 4 or 5) |

The import script computes `label_id` from the **`rating`** column. It also adds **`text_length`** and **`word_count`** for each review.

---

## If something goes wrong

- **Import errors:** Make sure `data/amazon_review.csv` exists and your terminal’s current folder is the project root (the same place as `requirements.txt`).
- **`sqlite3: command not found`:** Install or update your system tools so the `sqlite3` command is available, or install SQLite manually for your OS.
- **Wrong folder:** Paths like `database/amazon.db` and `sql/...` assume you run commands **from** the project root.

---

## License / data note

Review text and metadata come from a public-style Amazon reviews dataset slice used here for learning SQL. Keep that in mind if you republish anything.
