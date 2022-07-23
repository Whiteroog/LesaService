<?php

// временно

$_SESSION = [];
$_COOKIE = [];


if(isset($_COOKIE['login'])) {
    session_start();
    $_SESSION["login"] = $_COOKIE["login"];
    require 'store.php';
}
// else ->
?>

<form name="feedback" method="POST" action="/LesaServiceOnPHP/authorization.php">
    <label>Login: <input type="text" name="login"></label><br>
    <br>
    <label>Password: <input type="text" name="password"></label><br>
    <br>
    <input type="submit" name="send" value="Отправить">
</form>