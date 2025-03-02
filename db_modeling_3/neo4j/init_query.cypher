// ユーザ作成
MERGE (user:User {name: "Alice"})
ON CREATE SET user.uuid = apoc.create.uuid(), user.created_at = datetime();
MERGE (user:User {name: "Bob"})
ON CREATE SET user.uuid = apoc.create.uuid(), user.created_at = datetime();

// ディレクトリ作成
MERGE (dir:Directory {name: "Root"})
ON CREATE SET dir.uuid = apoc.create.uuid(), dir.created_at = datetime();
MATCH (parent:Directory {name: "Root"})
MERGE (child:Directory {name: "Projects"})
ON CREATE SET child.uuid = apoc.create.uuid(), child.created_at = datetime()
MERGE (parent)-[:CONTAINS]->(child);
MATCH (parent:Directory {name: "Root"})
MERGE (child:Directory {name: "Reports"})
ON CREATE SET child.uuid = apoc.create.uuid(), child.created_at = datetime()
MERGE (parent)-[:CONTAINS]->(child);
MATCH (parent:Directory {name: "Reports"})
MERGE (child:Directory {name: "Reports 2024"})
ON CREATE SET child.uuid = apoc.create.uuid(), child.created_at = datetime()
MERGE (parent)-[:CONTAINS]->(child);
MATCH (parent:Directory {name: "Reports"})
MERGE (child:Directory {name: "Reports 2025"})
ON CREATE SET child.uuid = apoc.create.uuid(), child.created_at = datetime()
MERGE (parent)-[:CONTAINS]->(child);

// ドキュメント作成
MATCH (user:User {name: "Alice"})
OPTIONAL MATCH (dir:Directory {name: "Projects"})
MERGE (doc:Document {name: "Project Plan", content: "This is the special project plan."})
ON CREATE SET doc.uuid = apoc.create.uuid(), doc.created_at = datetime()
MERGE (user)-[:CREATED]->(doc)
MERGE (dir)-[:CONTAINS]->(doc);

MATCH (user:User {name: "Bob"})
OPTIONAL MATCH (dir:Directory {name: "Reports 2024"})
MERGE (doc:Document {name: "Annual Report 2024", content: "This is the annual report."})
ON CREATE SET doc.uuid = apoc.create.uuid(), doc.created_at = datetime()
MERGE (user)-[:CREATED]->(doc)
MERGE (dir)-[:CONTAINS]->(doc);

// ドキュメント更新
MATCH (dir:Directory)-[r:CONTAINS]->(prevDoc:Document {name: "Annual Report 2024"})
DELETE r
WITH prevDoc, dir
MERGE (newDoc:Document {name: "Revised Annual Report 2024", content: "This is the final annual report 2024."})
ON CREATE SET newDoc.uuid = apoc.create.uuid(), newDoc.created_at = datetime()
MERGE (newDoc)-[:HAS_PREVIOUS_VERSION]->(prevDoc)
MERGE (dir)-[:CONTAINS]->(newDoc)
WITH newDoc
MATCH (user:User {name: "Alice"})
MERGE (user)-[:CREATED]->(newDoc);
