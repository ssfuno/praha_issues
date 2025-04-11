USE blogdb;

-- 記事作成
START TRANSACTION;

INSERT INTO
  documents (created_by)
VALUES
  (1);

SET
  @document_id = LAST_INSERT_ID();

INSERT INTO
  document_histories (document_id, title, main_text)
VALUES
  (
    @document_id,
    'Second Article from Alice!',
    'This is main text.'
  );

COMMIT;

-- 最新バージョンの記事取得
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