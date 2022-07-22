<?php
$link = mysqli_connect("localhost", "root", "Lapyx498", "db_lesaservice");

if (!$link){
    print("Ошибка: Невозможно подключиться к MySQL " . mysqli_connect_error());
}