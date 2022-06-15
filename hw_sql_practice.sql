1) Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd.
Решение:
select  model, speed, hd
from  PC
where price < 500
==========================================================
2) Найдите производителей принтеров. Вывести: maker.
Решение:
select maker
from product
where product.type='Printer'
group by maker
==========================================================
3) Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
Решение:
select  model, ram, screen
from  laptop
where price > 1000
==========================================================
4) Найдите все записи таблицы Printer для цветных принтеров.
Решение:
select *
from printer
where printer.color='y'
==========================================================
5) Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
Решение:
select model, speed, hd
from PC
where (CD='12x' or CD='24x') and price<600
==========================================================
6) Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.
Решение:
6.1)
select distinct maker, speed  
from laptop 
join product on product.model=laptop.model
where hd >= 10 
6.2)
Select distinct maker, speed  
from Product 
join Laptop on product.model=laptop.model  
where hd >= 10
6.3)
Select distinct maker, speed  
from Product 
join Laptop on laptop.model=product.model  
where hd >= 10
===========================================================
7) Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
Решение:
Select laptop.model, laptop.price  
from laptop
join product on laptop.model=product.model  
where product.maker='B' 
union 
Select pc.model, pc.price 
from pc 
join product on pc.model=product.model  
where product.maker='B' 
union 
Select printer.model, printer.price
from printer
join product on printer.model=product.model  
where product.maker='B'
===========================================================
8) Найдите производителя, выпускающего ПК, но не ПК-блокноты.
Решение:
select maker 
from product 
where type='PC' and maker 
not in (select maker from product where type ='Laptop') 
group by maker   
===========================================================
9) Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker.
Решение:
select maker  
from pc 
join product on pc.model=product.model 
where speed >= 450 
group by maker 
===========================================================
10) Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price.
Решение:
select model, price
from printer
where price=(select max(price) from printer)
==============================================================
11) Найдите среднюю скорость ПК.
Решение:
select avg (speed) 
from pc
==============================================================
12) Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
Решение:
select avg (speed) 
from laptop
where price > 1000
===============================================================
13) Найдите среднюю скорость ПК, выпущенных производителем A.
Решение:
select avg (speed) 
from pc
join product on pc.model=product.model  
where product.maker='A'
===============================================================
14) Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.
Решение:
14.1)
select s.class, s.name, c.country
from ships s
join  classes c ON s.class = c.class
where c.numGuns >= 10
14.2)
select ships.class, ships.name, classes.country
from ships 
join classes on ships.class=classes.class
where numGuns >= 10
================================================================
15) Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD.
Решение:
select  hd
from  pc
group by  hd
having  count(hd)>1
=================================================================
16) Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
Решение:
SELECT DISTINCT p1.model, p2.model, p1.speed, p1.ram
FROM pc p1, pc p2
WHERE p1.speed = p2.speed AND p1.ram = p2.ram AND p1.model > p2.model
==================================================================
17) Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
Вывести: type, model, speed.
Решение:
select distinct p.type, p.model, l.speed
from laptop l
join product p on l.model=p.model
where l.speed<(select min(speed) from pc) 
====================================================================
18) Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price.
Решение:
SELECT DISTINCT product.maker, printer.price
FROM product, printer
WHERE product.model=printer.model
AND printer.color='y'
AND printer.price=(SELECT MIN(price) FROM printer
WHERE printer.color='y')
=====================================================================
19) Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов. Вывести: maker, средний размер экрана.
Решение:
SELECT product.maker, AVG(screen)
FROM laptop
LEFT JOIN product ON product.model = laptop.model
GROUP BY product.maker
=======================================================================
20) Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.
Решение:
20.1)
SELECT maker, COUNT(model)
FROM product
WHERE type = 'pc'
GROUP BY product.maker
HAVING COUNT (DISTINCT model) > 2
20.2)
SELECT maker, COUNT(model)
FROM Product
GROUP BY maker, type
HAVING COUNT(model) >= 3 AND type ='PC'

======================================================================
21) Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
Вывести: maker, максимальная цена.
Решение:
21.1)
SELECT product.maker, MAX(pc.price)
FROM product, pc
WHERE product.model = pc.model
GROUP BY product.maker
21.2)
SELECT product.maker, MAX(pc.price)
FROM product
join pc on product.model = pc.model
GROUP BY product.maker
========================================================================
22) Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена.
Решение:
SELECT pc.speed, AVG(pc.price)
FROM pc
WHERE pc.speed > 600
GROUP BY pc.speed
========================================================================
23) Найдите производителей, которые производили бы как ПК
со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц.
Вывести: Maker.
Решение:
SELECT DISTINCT maker
FROM product t1 
JOIN pc t2 ON t1.model=t2.model
WHERE speed>=750 AND maker IN
(SELECT maker
FROM product t1 
JOIN laptop t2 ON t1.model=t2.model
WHERE speed>=750)
=======================================================================
24) Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.
Решение:
24.1)
SELECT model
FROM (SELECT model, price
 FROM pc
 UNION
 SELECT model, price
 FROM Laptop
 UNION
 SELECT model, price
 FROM Printer)
 t1
WHERE price = (
 SELECT MAX(price)
 FROM (
  SELECT price
  FROM pc
  UNION
  SELECT price
  FROM Laptop
  UNION
  SELECT price
  FROM Printer
  ) t2
 )
24.2)
WITH model AS ( SELECT model FROM Product ),
price AS (SELECT model, MAX(price) AS price FROM PC
GROUP BY model
UNION ALL
SELECT model, MAX(price) FROM Laptop
GROUP BY model
UNION ALL
SELECT model, MAX(price) FROM Printer
GROUP BY model)
SELECT m.model FROM
model m INNER JOIN price p
ON m.model = p.model
WHERE p.price = (SELECT MAX(price) FROM price)
24.3)
with model_count as (
select model, price as max_price from pc
union all
select model, price as max_price from laptop
union all
select model, price as max_price from printer)
select distinct model from model_count where max_price = (select max(max_price) from model_count)
==================================================================================================
25) Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. Вывести: Maker.
Решение:
25.1)
SELECT DISTINCT maker
FROM product
WHERE model IN (
SELECT model
FROM pc
WHERE ram = (
  SELECT MIN(ram)
  FROM pc
  )
AND speed = (
  SELECT MAX(speed)
  FROM pc
  WHERE ram = (
   SELECT MIN(ram)
   FROM pc
   )
  )
)
AND
maker IN (
SELECT maker
FROM product
WHERE type='printer'
);
25.2)
with data as (Select maker, ram, speed from product
join pc on pc.model=product.model
where type='PC' and maker in
(select maker from product where type='Printer')and ram=(select min(ram) from pc))
select distinct maker from data
where speed=(select max(speed) from data)
25.3)
select distinct maker
from product
where maker in (
select maker
from product
where model in (
select model
from PC
where ram in (
select min(ram)
from PC)
and speed in (
select max(speed)
from PC
where ram in (
select min(ram)
from PC
)
)
)
)
and type='Printer';
=======================================================================================================
26) Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). Вывести: одна общая средняя цена.
Решение:
26.1)
SELECT AVG(price)
FROM (
SELECT code, price, pc.model, ram, hd
FROM pc
WHERE model IN (
SELECT model
FROM product
WHERE maker='a'
)
UNION
SELECT code, price, laptop.model, ram, hd
FROM laptop
WHERE model IN (
SELECT model
FROM product
WHERE maker='a'
)
) a;
26.2)
SELECT AVG(price) AS AVG_price FROM (SELECT model, price FROM PC
UNION ALL
SELECT model, price FROM Laptop) AS price
INNER JOIN Product AS p
ON price.model = p.model
WHERE maker = 'A'
26.3)
Select avg(t1.price) as avgprice from (select pc.price from pc
join product on product.model=pc.model
where product.maker='A'
union all
select laptop.price from laptop
join product on product.model=laptop.model
where product.maker='A') t1, product
26.4)
WITH JOIN_TAB AS (
SELECT MAKER, PRICE, TYPE
FROM PC
INNER JOIN Product
ON Product.MODEL=PC.MODEL
WHERE MAKER = 'A'
union all
SELECT MAKER, PRICE, TYPE
FROM laptop
INNER JOIN Product
ON Product.MODEL=laptop.MODEL
WHERE MAKER = 'A'
)
select AVG(PRICE) AS AVG_PRICE
FROM JOIN_TAB
26.5)
select avg(price) as AVG_price
from (
select pc.model,pc.price from pc
union all
select lp.model,lp.price from laptop lp
) as price
where model in (select p.model from product p
where maker = 'A')
===========================================================================
27) Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. Вывести: maker, средний размер HD.
Решение:
27.1)
SELECT maker, AVG(hd)
FROM product t1 JOIN pc t2 ON t1.model=t2.model
WHERE maker IN (
SELECT maker
FROM product
WHERE type='printer'
)
GROUP BY maker;
27.2)
SELECT maker, AVG(hd)
FROM product 
JOIN pc ON product.model=pc.model
WHERE maker IN (
SELECT maker
FROM product
WHERE type='printer'
)
GROUP BY maker;
============================================================================================
28) Используя таблицу Product, определить количество производителей, выпускающих по одной модели.
Решение:
select count(maker)
from product
where maker in
(
  Select maker from product
  group by maker
  having count(model) = 1
)
============================================================================================
29) В предположении, что приход и расход денег на каждом пункте приема фиксируется не чаще одного раза в день [т.е. первичный ключ (пункт, дата)], написать запрос с выходными данными (пункт, дата, приход, расход). Использовать таблицы Income_o и Outcome_o.
Решение:
SELECT t1.point, t1.date, inc, out
FROM income_o t1 LEFT JOIN outcome_o t2 ON t1.point = t2.point
AND t1.date = t2.date
UNION
SELECT t2.point, t2.date, inc, out
FROM income_o t1 RIGHT JOIN outcome_o t2 ON t1.point = t2.point
AND t1.date = t2.date
==============================================================================================
30) В предположении, что приход и расход денег на каждом пункте приема фиксируется произвольное число раз (первичным ключом в таблицах является столбец code), требуется получить таблицу, в которой каждому пункту за каждую дату выполнения операций будет соответствовать одна строка.
Вывод: point, date, суммарный расход пункта за день (out), суммарный приход пункта за день (inc). Отсутствующие значения считать неопределенными (NULL).
Решение:
select point, date, SUM(sum_out), SUM(sum_inc)
from( select point, date, SUM(inc) as sum_inc, null as sum_out from Income Group by point, date
Union
select point, date, null as sum_inc, SUM(out) as sum_out from Outcome Group by point, date ) as t
group by point, date order by point




























