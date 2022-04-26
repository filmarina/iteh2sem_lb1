SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- База данных: `shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
                              `ID_Categories` int(10) NOT NULL,
                              `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`ID_Categories`, `name`) VALUES
                                                       (2, 'Манга'),
                                                       (3, 'Плакаты'),
                                                       (4, 'Диски'),
                                                       (5, 'Значки');

-- --------------------------------------------------------

--
-- Структура таблицы `items`
--

CREATE TABLE `items` (
                         `ID_Items` int(10) NOT NULL,
                         `name` varchar(20) NOT NULL,
                         `price` int(10) NOT NULL,
                         `quantity` int(10) NOT NULL,
                         `quality` int(1) NOT NULL,
                         `FID_Vender` int(10) NOT NULL,
                         `FID_Category` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `items`
--

INSERT INTO `items` (`ID_Items`, `name`, `price`, `quantity`, `quality`, `FID_Vender`, `FID_Category`) VALUES
                                                                                                           (57, 'Манга "Атака титанов"', 170, 12, 5, 3, 2),
                                                                                                           (58, 'Плакат "Кошечка из Сакурасо"', 20, 100, 3, 2, 3),
                                                                                                           (59, 'Манхва "Ветролом"', 190, 10, 4, 5, 2),
                                                                                                           (60, 'Брелок "Ходячий замок"', 50, 50, 2, 5, 5),
                                                                                                           (61, 'Маньхуа "19 дней"', 200, 24, 5, 5, 2),
                                                                                                           (62, 'Значок "Магическая битва"', 60, 70, 1, 1, 5),
                                                                                                           (63, 'CD "Twice"', 130, 80, 4, 4, 4),
                                                                                                           (64, 'Диск "Вокалоиды"', 60, 7, 5, 4, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `vendors`
--

CREATE TABLE `vendors` (
                           `ID_Vendors` int(10) NOT NULL,
                           `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `vendors`
--

INSERT INTO `vendors` (`ID_Vendors`, `name`) VALUES
                                                 (1, 'УкрМанга'),
                                                 (2, 'Джамп'),
                                                 (3, 'Сквозняк'),
                                                 (4, 'Маскот'),
                                                 (5, 'АнимеХаус');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
    ADD PRIMARY KEY (`ID_Categories`);

--
-- Индексы таблицы `items`
--
ALTER TABLE `items`
    ADD PRIMARY KEY (`ID_Items`),
  ADD KEY `FID_Vender` (`FID_Vender`),
  ADD KEY `FID_Category` (`FID_Category`);

--
-- Индексы таблицы `vendors`
--
ALTER TABLE `vendors`
    ADD PRIMARY KEY (`ID_Vendors`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
    MODIFY `ID_Categories` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `items`
--
ALTER TABLE `items`
    MODIFY `ID_Items` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT для таблицы `vendors`
--
ALTER TABLE `vendors`
    MODIFY `ID_Vendors` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `items`
--
ALTER TABLE `items`
    ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`FID_Vender`) REFERENCES `vendors` (`ID_Vendors`),
  ADD CONSTRAINT `items_ibfk_2` FOREIGN KEY (`FID_Category`) REFERENCES `categories` (`ID_Categories`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
