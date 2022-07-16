<?php
$host="localhost";
$port=3306;
$socket="";
$user="root";
$password="Lapyx498";
$dbname="lesaservicedb";

$con = new mysqli($host, $user, $password, $dbname, $port, $socket)
or die ('Could not connect to the database server' . mysqli_connect_error());

//$con->close();

$query = 'SELECT * FROM products';
$result = mysqli_query($con, $query); // выполнить запрос

$rows = mysqli_fetch_all($result, MYSQLI_ASSOC); // привести в ассоциативный массив

// mysqli_fetch_array($result) // получить след. запись

foreach ($rows as $id => $row) { // ключ => значение
    echo "[$id] {$row['ID']} | {$row['ProductName']} | {$row['Length']} | {$row['Height']} | {$row['Width']} | 
{$row['PriceFrameWithLadder']} | {$row['PricePathwayFrame']} | {$row['PriceFlooring']} <br>";
}