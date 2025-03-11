-- 特定のワークスペースで特定のユーザが参加しているチャンネルを取得
SELECT
  cm.channel_id,
  c.channel_name,
  cm.created_at AS joined_at
FROM
  channel_members AS cm
  JOIN channels AS c ON cm.channel_id = c.id
  JOIN workspaces AS w ON c.workspace_id = w.id
WHERE
  cm.user_id = 2
  AND w.id = 1
ORDER BY
  cm.created_at ASC;