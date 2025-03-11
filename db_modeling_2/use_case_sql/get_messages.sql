-- 特定のチャンネルのスレッドの先頭メッセージの情報を取得
SELECT
  *
FROM
  messages
WHERE
  parent_id IS NULL
  AND channel_id = 1
ORDER BY
  created_at DESC;

-- 特定のメッセージに対する返信を取得
SELECT
  *
FROM
  messages
WHERE
  parent_id = 29
ORDER BY
  created_at ASC;

-- 特定のワークスペースで特定のユーザが参加しているチャンネルのメッセージを横断検索
WITH
  joined_channels AS (
    SELECT
      cm.channel_id
    FROM
      channel_members AS cm
      JOIN channels AS c ON cm.channel_id = c.id
      JOIN workspaces AS w ON c.workspace_id = w.id
    WHERE
      cm.user_id = 2
      AND w.id = 1
  )
SELECT
  *
FROM
  messages AS m
  JOIN joined_channels AS jc ON m.channel_id = jc.channel_id
WHERE
  -- メモ：MeCabにより'こんにちは'が一区切りとして認識されているので、例えば'こんにち'で検索するとヒットしない
  MATCH (content) AGAINST ('こんにちは' IN NATURAL LANGUAGE MODE)
ORDER BY
  created_at DESC;