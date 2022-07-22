<li class="product-style">
    <div>
        код: <?= $product['id']?><br>
        <img src="/img/products/scaffolding_section_1.jpg" width="200"><br>
    </div>
    <div>
        <?= $product['title']?><br><br>
        параметры 1 секции<br>
        ширина: <?= $product['width']?> м<br>
        длина: <?= $product['length']?> м<br>
        высота: <?= $product['height']?> м<br>
    </div>
    <div>
        от <?= $product['price']?> р.<br>
        <a href="">Купить</a><br>
    </div>
</li>