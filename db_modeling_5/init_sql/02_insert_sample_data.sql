-- Active: 1741416930689@@127.0.0.1@3307@blogdb
-- usersテーブルにデータを挿入
INSERT INTO
  users (name)
VALUES
  ('Alice'),
  ('Bob');

-- documentsテーブルにデータを挿入
INSERT INTO
  documents (created_by)
VALUES
  (1),
  (2);

-- document_historiesテーブルにデータを挿入
INSERT INTO
  document_histories (document_id, title, main_text)
VALUES
  (
    1,
    'First Article from Alice!',
    'This is main text.'
  ),
  (
    2,
    'First Article from Bob!',
    'This is main text.'
  ),
  (
    2,
    'Revised Article from Bob!',
    'This is revised main text.'
  );