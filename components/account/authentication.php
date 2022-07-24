<?php
$action = "";
if(isset($_GET['action'])) {
    $action = $_GET['action'];
}

if($action === 'sign-out') {
    $_SESSION = [];
    setcookie("login", "", time() - 3600, '/');
    header("Location: /LesaServiceOnPHP/index.php");
}
?>

<form name="feedback" method="POST" action="/LesaServiceOnPHP/components/account/authentication_processing.php">
    <label>Login: <input type="text" name="login"></label><br>
    <br>
    <label>Password: <input type="text" name="password"></label><br>
    <br>
    <input type="submit" name="send" value="Отправить">
</form>