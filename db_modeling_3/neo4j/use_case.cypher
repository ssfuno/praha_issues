// ディレクトリ移動
MATCH (oldParent:Directory)-[r:CONTAINS]->(child:Directory {name: "Reports"})
DELETE r
WITH child
MATCH (newParent:Directory {name: "Projects"})
MERGE (newParent)-[:CONTAINS]->(child);

// 最上位ディレクトリ一覧取得
MATCH (dir:Directory)
WHERE NOT (:Directory)-[:CONTAINS]->(dir)
RETURN dir;

// 特定のディレクトリの直下のディレクトリ一覧取得
MATCH (parent:Directory {name: "Reports"})-[:CONTAINS]->(child:Directory)
RETURN child;

// 特定のディレクトリの先祖のディレクトリ一覧取得
MATCH (ancestor:Directory)-[:CONTAINS*]->(child:Directory {name: "Reports 2025"})
RETURN ancestor;