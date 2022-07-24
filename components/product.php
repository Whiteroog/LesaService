<?php
$product_id = $product['id'];

$params['product_id'] = $product_id;
$url = "product_detail.php/?".http_build_query($params);
?>

<li class="product-style">
    <div>
        код: <?= $product_id?><br>
        <img src="<?= $product['image_url'] ?? "/img/products/not-found.png" ?>" width="200" alt="<?= $product['title'] ?? "нет значения" ?>"><br>
    </div>
    <div>
        <?= $product['title']?><br><br>
        параметры 1 секции<br>
        <?php
        $sql_get_product_parameters = "select * from view_products_parameters where id = {$product_id}";
        $parameters_query = mysqli_query($link, $sql_get_product_parameters);
        $parameters = mysqli_fetch_all($parameters_query, MYSQLI_ASSOC);

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
        ?>
        длина: <?= $length ?? "нет значения" ?> м<br>
        высота: <?= $height ?? "нет значения" ?> м<br>
        ширина: <?= $width ?? "нет значения" ?> м<br>
    </div>
    <div>
        от <?= $product['price'] ?? "нет значения" ?> р.<br>
        <a href="<?= $url ?>">Подробно</a><br>
    </div>
</li>