-- 各寿司ネタが今月何個売れているのかを調べる（セットメニューは除く）
WITH
  this_month_order AS (
    SELECT
      id
    FROM
      orders
    WHERE
      created_at >= DATE_FORMAT (NOW (), '%Y-%m-01')
      AND created_at < DATE_ADD (
        DATE_FORMAT (NOW (), '%Y-%m-01'),
        INTERVAL 1 MONTH
      )
  ),
  not_set_menu AS (
    SELECT
      *
    FROM
      menus
    WHERE
      is_set_menu = FALSE
  )
SELECT
  menu_name AS メニュー,
  SUM(quantity) AS 販売数
FROM
  order_items
  JOIN this_month_order ON order_items.id = this_month_order.id
  JOIN not_set_menu ON order_items.id = not_set_menu.id
GROUP BY
  menu_name
ORDER BY
  販売数 DESC;