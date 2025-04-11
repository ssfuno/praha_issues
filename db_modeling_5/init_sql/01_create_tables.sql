CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE documents (
  id INT PRIMARY KEY AUTO_INCREMENT,
  created_by INT NOT NULL,
  deleted_at DATETIME DEFAULT '9999-12-31 23:59:59',
  FOREIGN KEY (created_by) REFERENCES users (id)
);

CREATE TABLE document_histories (
  id INT PRIMARY KEY AUTO_INCREMENT,
  document_id INT NOT NULL,
  title TEXT NOT NULL,
  main_text TEXT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (document_id) REFERENCES documents (id),
  INDEX idx_document_id_created_at (document_id, created_at DESC)
);