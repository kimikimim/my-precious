<?php
echo "🔐 MYSQL TEST<br>";
$conn = new mysqli("localhost", "webuser", "webpass", "user_db");

if ($conn->connect_error) {
  echo "❌ 연결 실패: " . $conn->connect_error;
} else {
  echo "✅ 연결 성공<br>";

  $result = $conn->query("SHOW TABLES");
  while ($row = $result->fetch_row()) {
    echo "📁 Table: " . $row[0] . "<br>";
  }
}
?>
