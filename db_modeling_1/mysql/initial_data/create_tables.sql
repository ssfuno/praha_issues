-- テーブルの作成
CREATE TABLE menu_categories (
  id INT AUTO_INCREMENT,
  menu_category_name VARCHAR(50) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

CREATE TABLE menu_categories_history (
  id INT AUTO_INCREMENT,
  menu_category_id INT,
  menu_category_name VARCHAR(50) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  operation_type ENUM ('INSERT', 'UPDATE', 'DELETE') NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE menus (
  id INT AUTO_INCREMENT,
  menu_category_id INT,
  menu_name VARCHAR(50) NOT NULL,
  price_without_tax INT UNSIGNED NOT NULL,
  is_set_menu BOOLEAN NOT NULL CHECK (is_set_menu IN (0, 1)),
  is_takeout_menu BOOLEAN NOT NULL CHECK (is_takeout_menu IN (0, 1)),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (menu_category_id) REFERENCES menu_categories (id)
);

CREATE TABLE menus_history (
  id INT AUTO_INCREMENT,
  menu_id INT,
  menu_category_id INT,
  menu_name VARCHAR(50) NOT NULL,
  price_without_tax INT UNSIGNED NOT NULL,
  is_set_menu BOOLEAN NOT NULL CHECK (is_set_menu IN (0, 1)),
  is_takeout_menu BOOLEAN NOT NULL CHECK (is_takeout_menu IN (0, 1)),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  operation_type ENUM ('INSERT', 'UPDATE', 'DELETE') NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE orders (
  id INT AUTO_INCREMENT,
  customer_name VARCHAR(50) NOT NULL,
  phone_number VARCHAR(15) NOT NULL,
  is_paid BOOLEAN NOT NULL CHECK (is_paid IN (0, 1)),
  additional_request VARCHAR(100),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

CREATE TABLE order_options (
  id INT AUTO_INCREMENT,
  has_wasabi BOOLEAN NOT NULL CHECK (has_wasabi IN (0, 1)),
  rice_size VARCHAR(50) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

CREATE TABLE order_items (
  id INT AUTO_INCREMENT,
  order_id INT NOT NULL,
  menu_id INT,
  order_option_id INT,
  quantity INT NOT NULL CHECK (quantity > 0),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (order_id) REFERENCES orders (id),
  FOREIGN KEY (menu_id) REFERENCES menus (id),
  FOREIGN KEY (order_option_id) REFERENCES order_options (id)
);

CREATE TABLE menu_sale_conditions (
  id INT AUTO_INCREMENT,
  menu_id INT,
  is_weekday_only BOOLEAN NOT NULL CHECK (is_weekday_only IN (0, 1)),
  available_time_from TIME NOT NULL,
  available_time_until TIME NOT NULL,
  discount_percentage INT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (menu_id) REFERENCES menus (id)
);

CREATE TABLE menu_sale_conditions_history (
  id INT AUTO_INCREMENT,
  menu_sale_condition_id INT,
  menu_id INT,
  is_weekday_only BOOLEAN NOT NULL CHECK (is_weekday_only IN (0, 1)),
  available_time_from TIME NOT NULL,
  available_time_until TIME NOT NULL,
  discount_percentage INT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  operation_type ENUM ('INSERT', 'UPDATE', 'DELETE') NOT NULL,
  PRIMARY KEY (id)
);

-- トリガーの作成
DELIMITER $$

CREATE TRIGGER trg_menus_history_insert
AFTER INSERT ON menus
FOR EACH ROW
BEGIN
  INSERT INTO menus_history (menu_id, menu_category_id, menu_name, price_without_tax, is_set_menu, is_takeout_menu, created_at, updated_at, operation_type)
  VALUES (NEW.id, NEW.menu_category_id, NEW.menu_name, NEW.price_without_tax, NEW.is_set_menu, NEW.is_takeout_menu, NEW.created_at, NEW.updated_at, 'INSERT');
END $$

CREATE TRIGGER trg_menus_history_update
AFTER UPDATE ON menus
FOR EACH ROW
BEGIN
  INSERT INTO menus_history (menu_id, menu_category_id, menu_name, price_without_tax, is_set_menu, is_takeout_menu, created_at, updated_at, operation_type)
  VALUES (NEW.id, NEW.menu_category_id, NEW.menu_name, NEW.price_without_tax, NEW.is_set_menu, NEW.is_takeout_menu, NEW.created_at, NEW.updated_at, 'UPDATE');
END $$

CREATE TRIGGER trg_menus_history_delete
AFTER DELETE ON menus
FOR EACH ROW
BEGIN
  INSERT INTO menus_history (menu_id, menu_category_id, menu_name, price_without_tax, is_set_menu, is_takeout_menu, created_at, updated_at, operation_type)
  VALUES (OLD.id, OLD.menu_category_id, OLD.menu_name, OLD.price_without_tax, OLD.is_set_menu, OLD.is_takeout_menu, OLD.created_at, OLD.updated_at, 'DELETE');
END $$

CREATE TRIGGER trg_menu_categories_history_insert
AFTER INSERT ON menu_categories
FOR EACH ROW
BEGIN
  INSERT INTO menu_categories_history (menu_category_id, menu_category_name, created_at, updated_at, operation_type)
  VALUES (NEW.id, NEW.menu_category_name, NEW.created_at, NEW.updated_at, 'INSERT');
END $$

CREATE TRIGGER trg_menu_categories_history_update
AFTER UPDATE ON menu_categories
FOR EACH ROW
BEGIN
  INSERT INTO menu_categories_history (menu_category_id, menu_category_name, created_at, updated_at, operation_type)
  VALUES (NEW.id, NEW.menu_category_name, NEW.created_at, NEW.updated_at, 'UPDATE');
END $$

CREATE TRIGGER trg_menu_categories_history_delete
AFTER DELETE ON menu_categories
FOR EACH ROW
BEGIN
  INSERT INTO menu_categories_history (menu_category_id, menu_category_name, created_at, updated_at, operation_type)
  VALUES (OLD.id, OLD.menu_category_name, OLD.created_at, OLD.updated_at, 'DELETE');
END $$

CREATE TRIGGER trg_menu_sale_conditions_history_insert
AFTER INSERT ON menu_sale_conditions
FOR EACH ROW
BEGIN
  INSERT INTO menu_sale_conditions_history (menu_sale_condition_id, menu_id, is_weekday_only, available_time_from, available_time_until, discount_percentage, created_at, updated_at, operation_type)
  VALUES (NEW.id, NEW.menu_id, NEW.is_weekday_only, NEW.available_time_from, NEW.available_time_until, NEW.discount_percentage, NEW.created_at, NEW.updated_at, 'INSERT');
END $$

CREATE TRIGGER trg_menu_sale_conditions_history_update
AFTER UPDATE ON menu_sale_conditions
FOR EACH ROW
BEGIN
  INSERT INTO menu_sale_conditions_history (menu_sale_condition_id, menu_id, is_weekday_only, available_time_from, available_time_until, discount_percentage, created_at, updated_at, operation_type)
  VALUES (NEW.id, NEW.menu_id, NEW.is_weekday_only, NEW.available_time_from, NEW.available_time_until, NEW.discount_percentage, NEW.created_at, NEW.updated_at, 'UPDATE');
END $$

CREATE TRIGGER trg_menu_sale_conditions_history_delete
AFTER DELETE ON menu_sale_conditions
FOR EACH ROW
BEGIN
  INSERT INTO menu_sale_conditions_history (menu_sale_condition_id, menu_id, is_weekday_only, available_time_from, available_time_until, discount_percentage, created_at, updated_at, operation_type)
  VALUES (OLD.id, OLD.menu_id, OLD.is_weekday_only, OLD.available_time_from, OLD.available_time_until, OLD.discount_percentage, OLD.created_at, OLD.updated_at, 'DELETE');
END $$

DELIMITER ;
