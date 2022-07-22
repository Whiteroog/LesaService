<main class="showcase">
    <div>
        фильтры
    </div>
    <ul class="advantage-list goods-showcase">
        <?php if (isset($products_array)) {
            foreach ($products_array as $product) {
                require ('components/product.php');
            }
        } ?>
    </ul>
</main>