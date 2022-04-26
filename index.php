<?php
$db = new PDO("mysql:host=127.0.0.1;dbname=shop", "root", ""); // подключение к БД
?>

<!doctype html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>lb1</title>
</head>
<body>
<form action="" method="post">
    <input placeholder="Производитель:" type="text" name="vendor">
    <input type="submit" value="Поиск"><br> <! -- поиск по производителю -->

</form>
<br>
<form action="" method="post">
    <input placeholder="Категория:"type="text" name="category">
    <input type="submit" value="Поиск"><br> <! -- поиск по категории -->

</form>
<br>
<form action="" method="post">
    <input placeholder="Минимальная цена:" type="text" name="min_price"> <! -- поиск по ценам -->
    <input placeholder="Максимальная цена:" type="text" name="max_price">
    <input type="submit" value="Поиск"><br>

</form>

<?php

// запрос по производителям
if (isset($_POST["vendor"])) { // есть ли в массиве ПОСТ значение производителя (посылался ли запрос)
    $statement = $db->prepare("SELECT items.name, price, quantity, quality FROM items inner join vendors on FID_Vender = ID_Vendors WHERE Vendors.name=?"); // подготовленный запрос
    $statement->execute([$_POST["vendor"]]);

    while ($data = $statement->fetch()) { // из запроса выбираются данные
        echo " <br> Название: {$data['name']} ~~~ Цена: {$data['price']} ~~~ Количество: {$data['quantity']} ~~~ Качество: {$data['quality']} ";}
}

// запрос по категориям
if (isset($_POST["category"])) {
    $statement = $db->prepare("SELECT items.name, price, quantity, quality FROM items inner join Categories on FID_Category = ID_Categories WHERE Categories.name=?");
    $statement->execute([$_POST["category"]]);

    while ($data = $statement->fetch()) { // из запроса выбираются данные
        echo "<br> Название: {$data['name']} ~~~ Цена: {$data['price']} ~~~ Количество: {$data['quantity']} ~~~ Качество: {$data['quality']} ";}
}

// запрос по ценам
if (isset($_POST["min_price"])) {
    $statement = $db->prepare("SELECT items.name, price, quantity, quality FROM items WHERE price between ? and ?");
    $statement->execute([$_POST["min_price"], $_POST["max_price"]]); // массив с 2 элементами

    while ($data = $statement->fetch()) { // из запроса выбираются данные
        echo "<br>Название: {$data['name']} ~~~ Цена: {$data['price']} ~~~ Количество: {$data['quantity']} ~~~ Качество: {$data['quality']} ";}
}
?>
</body>
</html>

