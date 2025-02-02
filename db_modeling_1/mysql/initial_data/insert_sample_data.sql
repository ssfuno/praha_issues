-- menu_categories テーブルにデータを挿入
INSERT INTO
  menu_categories (menu_category_name)
VALUES
  ('盛り込み'),
  ('にぎり'),
  ('鮨やの丼&おすすめ');

-- menus テーブルにデータを挿入
INSERT INTO
  menus (
    menu_name,
    price_without_tax,
    is_set_menu,
    is_takeout_menu,
    menu_category_id
  )
VALUES
  ('玉子', 100, FALSE, TRUE, NULL),
  ('はな', 8650, TRUE, TRUE, 1),
  ('日替わりにぎりセット', 1000, TRUE, FALSE, 2);

-- orders テーブルにデータを挿入
INSERT INTO
  orders (
    customer_name,
    phone_number,
    is_paid,
    additional_request
  )
VALUES
  ('ヤマダ', '123-456-7890', FALSE, NULL),
  ('田中太郎', '098-765-4321', TRUE, 'クーポン利用希望');

-- order_options テーブルにサンプルデータを挿入
INSERT INTO
  order_options (has_wasabi, rice_size)
VALUES
  (TRUE, '大'),
  (FALSE, '中'),
  (TRUE, '中');

-- order_items テーブルにデータを挿入
INSERT INTO
  order_items (order_id, menu_id, order_option_id, quantity)
VALUES
  (1, 1, 1, 2),
  (1, 2, 2, 1),
  (2, 3, 3, 3);

-- menu_sale_conditions テーブルにサンプルデータを挿入
INSERT INTO
  menu_sale_conditions (
    menu_id,
    is_weekday_only,
    available_time_from,
    available_time_until,
    discount_percentage
  )
VALUES
  (1, 1, '11:00:00', '14:00:00', 10),
  (2, 0, '17:00:00', '20:00:00', 15);