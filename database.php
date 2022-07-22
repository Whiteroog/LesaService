<?php
$link = mysqli_connect("localhost", "root", "Lapyx498", "db_lesaservice");

if (!$link){
    print("Ошибка: Невозможно подключиться к MySQL " . mysqli_connect_error());
}

$sql_get_building_construction_products = 'select * from view_products';
$products_query = mysqli_query($link, $sql_get_building_construction_products);

$products_array = mysqli_fetch_all($products_query, MYSQLI_ASSOC);

//foreach ($products_array as $row) {
//    print("{$row['id']} | {$row['title']} | {$row['producttype']} | {$row['width']} | {$row['length']} | {$row['height']} | {$row['price']} <br>");
//}