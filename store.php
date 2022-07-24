<?php
require 'components/header.php';
require 'database/database.php';

$sql_get_products_build_constr = 'select * from products where category = "Конструкция"';
$products_query = mysqli_query($link, $sql_get_products_build_constr);
$products_array = mysqli_fetch_all($products_query, MYSQLI_ASSOC);

require 'components/products.php';
require 'components/footer.php';