CREATE TABLE rice_sizes (
  rice_size_id INT AUTO_INCREMENT,
  rice_size_name VARCHAR(10) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (rice_size_id)
);

CREATE TABLE menu_categories (
  menu_category_id INT AUTO_INCREMENT,
  menu_category_name VARCHAR(50) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (menu_category_id)
);

CREATE TABLE menus (
  menu_id INT AUTO_INCREMENT,
  menu_name VARCHAR(50) NOT NULL,
  price_without_tax INT NOT NULL CHECK (price_without_tax >= 0),
  is_set_menu BOOLEAN NOT NULL CHECK (is_set_menu IN (0, 1)),
  is_takeout_menu BOOLEAN NOT NULL CHECK (is_takeout_menu IN (0, 1)),
  menu_category_id INT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (menu_id),
  FOREIGN KEY (menu_category_id) REFERENCES menu_categories (menu_category_id)
);

CREATE TABLE orders (
  order_id INT AUTO_INCREMENT,
  customer_name VARCHAR(50) NOT NULL,
  phone_number VARCHAR(15) NOT NULL,
  is_paid BOOLEAN NOT NULL CHECK (is_paid IN (0, 1)),
  additional_request VARCHAR(100),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (order_id)
);

CREATE TABLE order_items (
  order_item_id INT AUTO_INCREMENT,
  order_id INT NOT NULL,
  menu_id INT,
  quantity INT NOT NULL CHECK (quantity > 0),
  without_wasabi BOOLEAN NOT NULL CHECK (without_wasabi IN (0, 1)),
  rice_size_id INT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (order_item_id),
  FOREIGN KEY (order_id) REFERENCES orders (order_id),
  FOREIGN KEY (menu_id) REFERENCES menus (menu_id),
  FOREIGN KEY (rice_size_id) REFERENCES rice_sizes (rice_size_id)
);
