-- ユーザーのサンプルデータ
INSERT INTO
  users (user_name, mail_address)
VALUES
  ('Alice', 'alice@example.com'),
  ('Bob', 'bob@example.com'),
  ('Charlie', 'charlie@example.com');

-- ワークスペースのサンプルデータ
INSERT INTO
  workspaces (workspace_name)
VALUES
  ('Workspace1'),
  ('Workspace2');

-- ワークスペースメンバーのサンプルデータ
INSERT INTO
  workspace_members (workspace_id, user_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 2),
  (2, 3);

-- チャンネルのサンプルデータ
INSERT INTO
  channels (workspace_id, channel_name)
VALUES
  (1, 'General'),
  (1, 'Random'),
  (2, 'General'),
  (2, 'Development');

-- チャンネルメンバーのサンプルデータ
INSERT INTO
  channel_members (channel_id, user_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 1),
  (2, 2),
  (3, 2),
  (3, 3),
  (4, 2),
  (4, 3);

-- メッセージのサンプルデータ
INSERT INTO
  messages (user_id, channel_id, parent_id, content)
VALUES
  (1, 1, NULL, 'こんにちは、みなさん！'),
  (2, 1, 1, 'こんにちは、Alice！'),
  (1, 1, NULL, '今日は何を話しましょうか？'),
  (2, 1, 3, '新しいプロジェクトについて話しましょう。'),
  (1, 2, NULL, 'ランダムな話題を話しましょう。'),
  (2, 2, 5, 'いいですね！'),
  (1, 2, NULL, '最近のニュースはどうですか？'),
  (2, 2, 7, '興味深いニュースがたくさんありますね。'),
  (3, 3, NULL, 'こんにちは、Workspace2の皆さん！'),
  (2, 3, 9, 'こんにちは、Charlie！'),
  (3, 3, NULL, '新しい機能について話しましょう。'),
  (2, 3, 11, '了解です。'),
  (3, 4, NULL, '開発の進捗はどうですか？'),
  (2, 4, 13, '順調です。'),
  (3, 4, 13, '素晴らしいですね！'),
  (2, 4, 13, 'ありがとうございます。'),
  (1, 1, NULL, 'プロジェクトの締め切りはいつですか？'),
  (2, 1, 17, '来週の金曜日です。'),
  (1, 1, 17, '了解しました。'),
  (2, 1, 17, '頑張りましょう！'),
  (3, 3, NULL, '新しいデザインについてどう思いますか？'),
  (2, 3, 21, 'とても良いと思います。'),
  (3, 3, 21, 'ありがとうございます。'),
  (2, 3, 21, 'どういたしまして。'),
  (1, 1, NULL, 'プロジェクトの進捗はどうですか？'),
  (2, 1, 25, '順調です。'),
  (1, 1, 25, '素晴らしいですね！'),
  (2, 1, 25, 'ありがとうございます。'),
  (3, 3, NULL, '新しい機能のテストは終わりましたか？'),
  (2, 3, 29, 'はい、終わりました。'),
  (3, 3, 29, '結果はどうでしたか？'),
  (2, 3, 29, '問題ありませんでした。'),
  (3, 3, 29, '良かったです。'),
  (2, 3, 29, '次のステップに進みましょう。');