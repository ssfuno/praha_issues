-- usersテーブルにデータを挿入
INSERT INTO
  users (user_name)
VALUES
  ('Alice'),
  ('Bob');

-- directoriesテーブルにデータを挿入
INSERT INTO
  directories (directory_name, parent_id, user_id)
VALUES
  ('Root', NULL, 1),
  ('Projects', 1, 1),
  ('Reports', 1, 1),
  ('Reports 2024', 3, 1),
  ('Reports 2025', 3, 2);

-- documentsテーブルにデータを挿入
INSERT INTO
  documents (directory_id, position)
VALUES
  (2, 1),
  (4, 1),
  (2, 2);

-- document_historiesテーブルにデータを挿入
INSERT INTO
  document_histories (document_id, user_id, title, content)
VALUES
  (
    1,
    1,
    'Project Plan',
    'This is the special project plan.'
  ),
  (
    2,
    2,
    'Annual Report 2024',
    'This is the annual report.'
  ),
  (
    2,
    1,
    'Revised Annual Report 2024',
    'This is the final annual report 2024.'
  ),
  (
    3,
    2,
    'Hyper Project Plan',
    'This is the hyper project plan.'
  );