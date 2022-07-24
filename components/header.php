<!doctype html>
<html lang="ru">
<head>
    <title>LesaService</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/LesaServiceOnPHP/style.css">
    <meta name="keywords" content="LesaService, строительные леса, вышки">
    <meta name="description" content="Продажа строительных лесов и вышек с помощью удобного инструмента, который поможет
подобрать параметры вашего заказа">
</head>
<body>
<header class="two-columns-equally">
    <div class="two-columns-equally left-align color-white-background-blue">
        <div>
            ООО «ЛесРегионСервис»<br>
            <span class="words-header">Леса и вышки</span>
        </div>
        <div class="right-align">
            <span class="words-header color-black-background-yellow">Качество и надежность</span>
        </div>
    </div>
    <div class="two-columns-equally color-black-background-yellow">
        <div class="center-align">
            +7 (925) 184-50-95
        </div>
        <div class="left-align">
            <strong>Офис:</strong><br>
            141801, Московская область, Дмитровский район, город Дмитров, улица Профессиональная, дом № 130, помещение 3<br>
            <strong>Адрес производства:</strong><br>
            Московская область, Дмитровский р-н г. Яхрома ул. Ленина 42
        </div>
    </div>
</header>
<nav>
    <a href="/LesaServiceOnPHP/index.php">Главная</a>
    <a href="/LesaServiceOnPHP/store.php">Магазин</a>
    <?php
    require 'components/account/authorization.php';
    ?>
    <?php if(!isset($_SESSION["login"])): ?>
    <a href="/LesaServiceOnPHP/components/account/authentication.php/?action=sign-in">Войти</a>
    <?php else: ?>
    <div>
        <?= $_SESSION["login"] ?><br>
        <a href="/LesaServiceOnPHP/components/account/authentication.php/?action=sign-out">Выйти</a>
    </div>
    <?php endif ?>
</nav>