-- 特定のワークスペースのメンバー一覧を取得
SELECT
  u.id,
  u.user_name,
  u.mail_address,
  wm.created_at AS joined_at
FROM
  workspace_members AS wm
  JOIN users AS u ON wm.user_id = u.id
WHERE
  wm.workspace_id = 1
ORDER BY
  wm.created_at ASC;