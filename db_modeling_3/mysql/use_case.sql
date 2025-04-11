USE documentdb;

-- ドキュメント作成
START TRANSACTION;

INSERT INTO
  documents (directory_id)
VALUES
  (5);

SET
  @document_id = LAST_INSERT_ID();

INSERT INTO
  document_histories (document_id, user_id, title, content)
VALUES
  (
    @document_id,
    1,
    'Annual Report 2025',
    'This is the annual report 2025.'
  );

COMMIT;

-- 最新バージョンのドキュメント取得
SELECT
  *
FROM
  document_histories
WHERE
  document_id = 2
ORDER BY
  created_at DESC
LIMIT
  1;

-- ディレクトリ移動
UPDATE directories
SET
  parent_id = 2
WHERE
  id = 3;

-- 最上位ディレクトリ一覧取得
SELECT
  *
FROM
  directories
WHERE
  parent_id IS NULL;

-- 特定のディレクトリの直下のディレクトリ一覧取得
SELECT
  *
FROM
  directories
WHERE
  parent_id = 3;

-- 特定のディレクトリの先祖のディレクトリ一覧取得
WITH RECURSIVE
  ancestor_directories AS (
    SELECT
      *
    FROM
      directories
    WHERE
      id = 5
    UNION ALL
    SELECT
      d.*
    FROM
      directories AS d
      JOIN ancestor_directories AS ad ON d.id = ad.parent_id
  )
SELECT
  *
FROM
  ancestor_directories
ORDER BY
  id;

-- ドキュメントの並び替え
START TRANSACTION;

UPDATE documents
SET
  position = 2
WHERE
  id = 1;

UPDATE documents
SET
  position = 1
WHERE
  id = 3;

COMMIT;