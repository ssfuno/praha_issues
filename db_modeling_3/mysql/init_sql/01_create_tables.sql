CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_name VARCHAR(50) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  deleted_at DATETIME DEFAULT '9999-12-31 23:59:59'
);

CREATE TABLE directories (
  id INT PRIMARY KEY AUTO_INCREMENT,
  directory_name VARCHAR(50) NOT NULL,
  parent_id INT DEFAULT NULL,
  user_id INT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (parent_id) REFERENCES directories (id)
);

CREATE TABLE documents (
  id INT PRIMARY KEY AUTO_INCREMENT,
  directory_id INT NOT NULL,
  position INT NOT NULL,
  deleted_at DATETIME DEFAULT '9999-12-31 23:59:59'
);

CREATE TABLE document_histories (
  id INT PRIMARY KEY AUTO_INCREMENT,
  document_id INT NOT NULL,
  user_id INT NOT NULL,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (document_id) REFERENCES documents (id),
  FOREIGN KEY (user_id) REFERENCES users (id),
  INDEX idx_document_id_created_at (document_id, created_at DESC)
);