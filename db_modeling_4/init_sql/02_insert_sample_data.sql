-- usersテーブルにデータを挿入
INSERT INTO
  users (id, user_name)
VALUES
  ('A12345', 'Alice'),
  ('B12345', 'Bob'),
  ('C12345', 'Charlie');

-- workspacesテーブルにデータを挿入
INSERT INTO
  workspaces (id, workspace_name, access_token)
VALUES
  (1, 'Workspace Alpha', 'token_alpha'),
  (2, 'Workspace Beta', 'token_beta');

-- tasksテーブルにデータを挿入
INSERT INTO
  tasks (id, workspace_id, created_by, channel_id, content)
VALUES
  (
    1,
    1,
    'C12345',
    101,
    '@Alice 例のお仕事、お願いしますね！ every Sunday'
  ),
  (
    2,
    1,
    'C12345',
    102,
    '@Alice @Bob 例のお仕事、お願いしますね！ every 2 days'
  );

-- remindersテーブルにデータを挿入
INSERT INTO
  reminders (id, task_id, assignee, is_completd)
VALUES
  (1, 1, 'A12345', FALSE),
  (2, 2, 'A12345', FALSE),
  (3, 2, 'B12345', FALSE);

-- reminder_schedulesテーブルにデータを挿入
INSERT INTO
  reminder_schedules (id, task_id, interval_days, cron_expression)
VALUES
  (1, 1, NULL, '0 7 * * SUN'),
  (2, 2, 2, NULL);