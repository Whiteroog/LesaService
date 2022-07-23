<?php
require 'components/header.php';
require 'database.php';

$product_id = $_GET['product_id'];


$sql_get_product_build_constr = "select * from products where id = {$product_id}";
$sql_get_product_parameters = "select * from view_products_parameters where id = {$product_id}";
$sql_get_product_build_constr_detail = "select * from view_products_build_constr_detail where product_id = {$product_id}";

$product_query = mysqli_query($link, $sql_get_product_build_constr);
$parameters_query = mysqli_query($link, $sql_get_product_parameters);
$product_detail_query = mysqli_query($link, $sql_get_product_build_constr_detail);

$product = mysqli_fetch_array($product_query);
$parameters = mysqli_fetch_all($parameters_query, MYSQLI_ASSOC);
$product_detail = mysqli_fetch_all($product_detail_query, MYSQLI_ASSOC);


$length = "Нет значения";
$height = "Нет значения";
$width = "Нет значения";

foreach ($parameters as $parameter) {
    switch ($parameter['parameter']) {
        case "Длина":
            $length = $parameter['value'];
            break;
        case "Высота":
            $height = $parameter['value'];
            break;
        case "Ширина":
            $width = $parameter['value'];
            break;
    }
}

foreach ($product_detail as $detail) {
    switch ($detail['part_type']) {
        case "Рама с лестницей":
            $frame_with_ladder = ['part_id' => $detail['part_id'],
                'part_title' => $detail['part_title'],
                'amount' => $detail['amount'],
                'price' => $detail['price']];
            break;
        case "Рама проходная":
            $pathway_frame = ['part_id' => $detail['part_id'],
                'part_title' => $detail['part_title'],
                'amount' => $detail['amount'],
                'price' => $detail['price']];
            break;
        case "Настил":
            $flooring = ['part_id' => $detail['part_id'],
                'part_title' => $detail['part_title'],
                'amount' => $detail['amount'],
                'price' => $detail['price']];
            break;
        default:
            $other_details[] = ['part_id' => $detail['part_id'],
                'part_title' => $detail['part_title'],
                'amount' => $detail['amount'],
                'price' => $detail['price']];
    }
}

?>

<main>
    <?= $product['title'] ?? "нет значения" ?><br>
    Код товара: <?= $product['id'] ?? "нет значения" ?><br>
    <img src="<?= $product['image_url'] ?? "/img/products/not-found.png" ?>" width="400" alt="<?= $product['title'] ?? "нет значения" ?>"><br>
    Технические характеристики<br>
    Тип конструкции: <?= $product['product_type'] ?><br>
    длина: <?= $length ?? "нет значения" ?> м.<br>
    высота: <?= $height ?? "нет значения" ?> м.<br>
    ширина: <?= $width ?? "нет значения" ?> м.<br>
    <br>
    Настраиваемая комплектация<br>
    Ввести:<br>
    <?= $frame_with_ladder['part_title'] ?? "Рама с лестницей" ?>: <?= $frame_with_ladder['amount'] ?? "нет значения" ?> шт.<br>
    <?= $pathway_frame['part_title'] ?? "Рама проходная" ?>: <?= $pathway_frame['amount'] ?? "нет значения" ?> шт.<br>
    <?= $flooring['part_title'] ?? "Настил" ?>: <?= $flooring['amount'] ?? "нет значения" ?> шт.<br>
    <br>
    Оставшая комплектация<br>
    Нельзя вводить:<br>
    <?php if (isset($other_details)): ?>
    <?php foreach ($other_details as $detail): ?>
    <?= $detail['part_title'] ?? "нет значения" ?>: <?= $detail['amount'] ?? "нет значения" ?> шт.<br>
    <?php endforeach; ?>
    <?php endif; ?>
    <br>
    <a>Купить</a>
</main>

<?php
require 'components/footer.php';
?>