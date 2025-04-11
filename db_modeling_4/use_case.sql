USE penpendb;

-- 特定のユーザ宛のタスク一覧
SELECT
  tasks.id,
  content
FROM
  tasks
  JOIN reminders ON tasks.id = reminders.id
WHERE
  assignee = 'A12345';

-- 特定のユーザが設定したタスク一覧
SELECT
  id,
  content
FROM
  tasks
WHERE
  created_by = 'C12345';