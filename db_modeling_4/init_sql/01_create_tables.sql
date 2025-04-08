CREATE TABLE users (
  id VARCHAR(100) PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE workspaces (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  access_token TEXT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tasks (
  id INT PRIMARY KEY AUTO_INCREMENT,
  workspace_id INT NOT NULL,
  created_by VARCHAR(100) NOT NULL,
  channel_id INT NOT NULL,
  content TEXT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (workspace_id) REFERENCES workspaces (id),
  FOREIGN KEY (created_by) REFERENCES users (id)
);

CREATE TABLE reminders (
  id INT PRIMARY KEY AUTO_INCREMENT,
  task_id INT NOT NULL,
  assignee VARCHAR(100) NOT NULL,
  is_completd BOOLEAN NOT NULL CHECK (is_completd IN (0, 1)),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (task_id) REFERENCES tasks (id),
  FOREIGN KEY (assignee) REFERENCES users (id)
);

CREATE TABLE reminder_schedules (
  id INT PRIMARY KEY AUTO_INCREMENT,
  task_id INT NOT NULL,
  interval_days INT,
  cron_expression TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (task_id) REFERENCES tasks (id)
);