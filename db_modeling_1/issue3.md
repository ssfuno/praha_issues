# 課題
「データベースモデリング1」の課題3

# 目的
物理設計やクエリのレビューをお願いしたい

# 内容と考えたこと
## テーブルのDDL
```./mysql/initial_data/created_tables.sql```
- MySQLではbooleanがtinyint(1)として解釈されるので、0か1の値だけ許容されるようにCHECK制約を追加した

## サンプルデータを投入するDML
```./mysql/initial_data/insert_sample_data.sql```

## ユースケースを想定したクエリ
```./queries/monthly_sushi_sales.sql```
- 処理を軽くするため、先に今月の注文で絞り込むようにした

## （参考）ER図
[注文票 ER図](https://miro.com/app/board/uXjVLyG5gQE=/?share_link_id=416247123414)下部のフレーム

## （参考）データの確認方法
```./README.md```

# 疑問・確認
- MySQLの設定やクエリの書き方などについても、お気づきの点ありましたらコメントいただけると嬉しいです！