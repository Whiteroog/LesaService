<?php
require 'D:/GitHub/LesaServiceOnPHP/components/admin/admin.php';

if(isset($_SESSION["login"])) {
    return;
}

if(!isset($_COOKIE['login'])) {
    return;
}

$login = $_COOKIE['login'];

session_start();
$_SESSION["login"] = $login;
$_SESSION["status"] = admin::name_verify($login) ? "admin" : "user";