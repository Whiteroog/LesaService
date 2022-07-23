<?php
require 'components/admin/admin.php';

if (!isset($_POST)) {
    require 'authentication.php';
    return;
}

$login = $_POST['login'];
$password = $_POST['password'];

require 'database.php';

$sql_get_user = "select * from users where login = '{$login}'";
$user_query = mysqli_query($link, $sql_get_user);
$user = mysqli_fetch_array($user_query);

if (!isset($user) || !password_verify($password, $user['password'])) {
    require 'authentication.php';
    return;
}

setcookie("login", $login, strtotime("+7 days"));
session_start();
$_SESSION["login"] = $login;
$_SESSION["status"] = admin::name_verify($login) ? "admin" : "user";
require 'store.php';