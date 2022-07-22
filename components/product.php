<li class="product-style">
    <div>
        код: <?= $product['id']?><br>
        <img src="/img/products/scaffolding_section_1.jpg" width="200"><br>
    </div>
    <div>
        <?= $product['title']?><br><br>
        параметры 1 секции<br>
        ширина: <?= $product['width'] ?? "нет значения" ?> м<br>
        длина: <?= $product['length'] ?? "нет значения" ?> м<br>
        высота: <?= $product['height'] ?? "нет значения" ?> м<br>
    </div>
    <div>
        от <?= $product['price'] ?? "нет значения" ?> р.<br>
        <a >Купить</a><br>
    </div>
</li>