-- rice_sizes テーブルにデータを挿入
INSERT INTO
  rice_sizes (rice_size_name)
VALUES
  ('小');

INSERT INTO
  rice_sizes (rice_size_name)
VALUES
  ('中');

INSERT INTO
  rice_sizes (rice_size_name)
VALUES
  ('大');

-- menu_categories テーブルにデータを挿入
INSERT INTO
  menu_categories (menu_category_name)
VALUES
  ('盛り込み');

INSERT INTO
  menu_categories (menu_category_name)
VALUES
  ('にぎり');

INSERT INTO
  menu_categories (menu_category_name)
VALUES
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
  ('玉子', 100, FALSE, TRUE, NULL);

INSERT INTO
  menus (
    menu_name,
    price_without_tax,
    is_set_menu,
    is_takeout_menu,
    menu_category_id
  )
VALUES
  ('はな', 8650, TRUE, TRUE, 1);

INSERT INTO
  menus (
    menu_name,
    price_without_tax,
    is_set_menu,
    is_takeout_menu,
    menu_category_id
  )
VALUES
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
  ('ヤマダ', '123-456-7890', FALSE, NULL);

INSERT INTO
  orders (
    customer_name,
    phone_number,
    is_paid,
    additional_request
  )
VALUES
  ('田中太郎', '098-765-4321', TRUE, 'クーポン利用希望');

-- order_items テーブルにデータを挿入
INSERT INTO
  order_items (
    order_id,
    menu_id,
    quantity,
    without_wasabi,
    rice_size_id
  )
VALUES
  (1, 1, 2, TRUE, 2);

INSERT INTO
  order_items (
    order_id,
    menu_id,
    quantity,
    without_wasabi,
    rice_size_id
  )
VALUES
  (1, 2, 1, FALSE, 1);

INSERT INTO
  order_items (
    order_id,
    menu_id,
    quantity,
    without_wasabi,
    rice_size_id
  )
VALUES
  (2, 3, 1, TRUE, 3);