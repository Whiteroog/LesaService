<?php
$action = $_GET['action'];

if($action === 'sign out') {
    $_SESSION = [];
    $_COOKIE = [];
    return; // куда-то вывести
}
?>

<form name="feedback" method="POST" action="/LesaServiceOnPHP/authentication_processing.php">
    <label>Login: <input type="text" name="login"></label><br>
    <br>
    <label>Password: <input type="text" name="password"></label><br>
    <br>
    <input type="submit" name="send" value="Отправить">
</form>