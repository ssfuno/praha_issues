# 課題
「データベースモデリング1」の課題2

# 目的
下記の要件が追加された場合のテーブル設計のレビューをお願いしたい
1. シャリの大小を選択できる（課題2-1）
2. セット商品とは別に、寿司ネタが毎月何個売れているのか知る必要が生じた場合（課題2-2）
3. 平日の16時まで限定で注文可能なセットメニューが追加される（課題2-3）
4. お好みすしの中で、「白身」「赤身」「軍艦」「巻物」のカテゴリー分けで表示ができる（課題2-3）
5. お好み寿司のみ18:00以降10%オフ（課題2-3）

# 内容
```mermaid
---
title: お持ち帰りメニュー ご注文票
---

erDiagram
    orders ||--|{ order_items : ""
    order_items ||--|| menus : ""
    order_items  ||--||  order_options: ""
    menus |o--||  menu_categories : ""
    menus ||--o| menu_sale_conditions : ""

    menus ||--|{ menus_history : "履歴"
    menu_categories ||--|{ menu_categories_history : "履歴"
    menu_sale_conditions ||--|{ menu_sale_conditions_history : "履歴"

    orders {
        int id PK "注文ID"
        string customer_name "顧客名"
        string phone_number "連絡先電話番号"
        boolean is_paid "支払い済みかどうか"
        string additional_request "その他要望"
        datetime created_at "作成日時"
        datetime updated_at "更新日時"
    }

    order_items {
        int id PK "注文詳細ID"
        int order_id FK "注文ID"
        int menu_id FK "メニューID"
        int order_option_id FK "注文詳細オプションID"
        int quantity "数量"
        datetime created_at "作成日時"
        datetime updated_at "更新日時"
    }

    order_options {
        int id PK "注文オプションID"
        boolean has_wasabi "ワサビ有りかどうか"
        string rice_size "シャリの大きさ"
        datetime created_at "作成日時"
        datetime updated_at "更新日時"
    }

    menus {
        int id PK "メニューID"
        int menu_category_id FK "メニューカテゴリーID"
        string menu_name "メニュー名"
        int price_without_tax "税抜き価格"
        boolean is_set_menu "セットメニューかどうか"
        boolean is_takeout_menu "テイクアウトメニューかどうか"
        datetime created_at "作成日時"
        datetime updated_at "更新日時"
    }

    menus_history {
        int id PK "メニュー履歴ID"
        int menu_id FK "メニューID"
        int menu_category_id FK "メニューカテゴリーID"
        string menu_name "メニュー名"
        int price_without_tax "税抜き価格"
        boolean is_set_menu "セットメニューかどうか"
        boolean is_takeout_menu "テイクアウトメニューかどうか"
        datetime created_at "作成日時"
        datetime updated_at "更新日時"
        string operation_type "操作タイプ"
    }

    menu_sale_conditions {
        int id PK "販売条件ID"
        int menu_id FK "メニューID"
        boolean is_weekday_only "平日限定かどうか"
        time available_time_from "開始時間"
        time available_time_until "終了時間"
        int discount_percentage "割引率"
        datetime created_at "作成日時"
        datetime updated_at "更新日時"
    }

    menu_sale_conditions_history {
        int id PK "販売条件履歴ID"
        int menu_sale_condition_id PK "販売条件ID"
        int menu_id FK "メニューID"
        boolean is_weekday_only "平日限定かどうか"
        time available_time_from "開始時間"
        time available_time_until "終了時間"
        int discount_percentage "割引率"
        datetime created_at "作成日時"
        datetime updated_at "更新日時"
        string operation_type "操作タイプ"
    }

    menu_categories {
        int id PK "メニューカテゴリーID"
        string menu_category_name "メニューカテゴリー名"
        datetime created_at "作成日時"
        datetime updated_at "更新日時"
    }

    menu_categories_history {
        int id PK "メニューカテゴリー履歴ID"
        int menu_category_id PK "メニューカテゴリーID"
        string menu_category_name "メニューカテゴリー名"
        datetime created_at "作成日時"
        datetime updated_at "更新日時"
        string operation_type "操作タイプ"
    }
```

# 考えたこと
## 要件1
- 注文オプションテーブルを追加
## 要件2
- 設計の変更はなし
    - 既存の設計でも、SQLで集計することが可能なため
- 人気の寿司ネタを特定したい場合、寿司ネタ名でGROUP BYされることが多い可能性があるので、寿司ネタ名（menu_name）にインデックスを貼ることを検討しても良いかもしれない
## 要件3
- 販売条件テーブルを追加
## 要件4
- 設計の変更はなし
    - 既存の設計で考慮されているため
## 要件5
- 販売条件テーブルを追加

# 確認・相談
- 要件3・5について、アプリケーション側で実装すべきか？DB設計に組み込むべきか？