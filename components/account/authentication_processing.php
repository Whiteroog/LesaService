<?php
if (!isset($_POST)) {
    header("Location: /LesaServiceOnPHP/components/account/authentication.php/?action=sign-in");
    return;
}

$login = $_POST['login'];
$password = $_POST['password'];

require 'D:/GitHub/LesaServiceOnPHP/database/database.php';

$sql_get_user = "select * from users where login = '{$login}'";
$user_query = mysqli_query($link, $sql_get_user);
$user = mysqli_fetch_array($user_query);

if (!isset($user) || !password_verify($password, $user['password'])) {
    header("Location: /LesaServiceOnPHP/components/account/authentication.php/?action=sign-in");
    return;
}

$_SESSION = [];
setcookie("login", $login, strtotime("+7 days"), '/');

require 'authorization.php';
header("Location: /LesaServiceOnPHP/index.php");