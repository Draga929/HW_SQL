/* Условия:
1) Перейти по ссылке https://docs.google.com/spreadsheets/d/1zKgaE7GfNU5vYeZl9FAua9AmqfQNSwrlaWMfFQX237s/edit?usp=sharing
2) В Google Таблице перейти на страничку Sheet2
3) Выбрать свободную строку padawan_user и вписать свой Ник
4) Открыть DBeaver
5) Новое соединение PostgreSQL
6) Хост: 159.69.151.133
7) База данных: qa_students_1
8) Пользователь: padawan_user_19
9) Пароль: 123
10) Редактор SQL
11) Новый редактор SQL
12) Выполнение задание home work 1 
==========================================================================================================================*/ 

/*1. Вывести все поля и все строки.*/

select * from students;

/*2. Вывести всех студентов в таблице.*/

select name  from students;

/*3. Вывести только Id пользователей.*/

select id from students;

/*4. Вывести только имя пользователей.*/

select name from students;

/*5. Вывести только email пользователей.*/

select email from students;

/*6. Вывести имя и email пользователей.*/

select name, email from students;

/*7. Вывести id, имя, email и дату создания пользователей.*/

select id, name, email, created_on  from students;

/*8. Вывести пользователей где password 12333.*/

select * from students where password = '12333' order by name;

/*9. Вывести пользователей которые были созданы 2021-03-26 00:00:00.*/

select * from students where created_on  = '2021-03-26 00:00:00' order by name; 

/*10. Вывести пользователей где в имени есть слово Анна.*/

select * from students where name  = '%Анна%' order by name; 

/*11. Вывести пользователей где в имени в конце есть 8.*/

select * from students where name  like '%8';

/*12. Вывести пользователей где в имени в есть буква а.*/

select * from students where name  like '%a%' order by name; 

/*13. Вывести пользователей которые были созданы 2021-07-12 00:00:00.*/

select * from students where created_on  = '2021-07-12 00:00:00' order by name;

/*14. Вывести пользователей которые были созданы 2021-07-12 00:00:00 и имеют пароль 1m313.*/

select * from students where created_on  = '2021-07-12 00:00:00' and password  = '1m313' order by name;

/*15. Вывести пользователей которые были созданы 2021-07-12 00:00:00 и у которых в имени есть слово Andrey.*/

select * from students where created_on  = '2021-07-12 00:00:00' and name like '%Andrey%' order by name;

/*16. Вывести пользователей которые были созданы 2021-07-12 00:00:00 и у которых в имени есть цифра 8.*/

select * from students where created_on  = '2021-07-12 00:00:00' and name like '%8%' order by name;

/*17. Вывести пользователя у которых id равен 110.*/

select * from students where id = 110;

/*18. Вывести пользователя у которых id равен 153.*/

select * from students where id = 153;

/*19. Вывести пользователя у которых id больше 140.*/

select * from students where id > 140;

/*20. Вывести пользователя у которых id меньше 130.*/

select * from students where id < 130;

/*21. Вывести пользователя у которых id меньше 127 или больше 188.*/

select * from students where id < 127 or id > 188;

/*22. Вывести пользователя у которых id меньше либо равно 137.*/

select * from students where id <= 137;

/*23. Вывести пользователя у которых id больше либо равно 137.*/

select * from students where id >= 137;

/*24. Вывести пользователя у которых id больше 180 но меньше 190.*/

select * from students where id > 180 and id < 190;

/*25. Вывести пользователя у которых id между 180 и 190.*/

/*25.1.*/ 

select * from students where id between 180 and 190;

/*25.2.*/

select * from students where id > 179 and id < 191;

/*26. Вывести пользователей где password равен 12333, 1m313, 123313.*/

select * from students where password in ('12333', '1m313', '123313');

/*27. Вывести пользователей где created_on равен 2020-10-03 00:00:00, 2021-05-19 00:00:00, 2021-03-26 00:00:00.*/

select * from students where created_on in ('2020-10-03 00:00:00', '2021-05-19 00:00:00', '2021-03-26 00:00:00');

/*28. Вывести минимальный id.*/

/*28.1.*/

select min(id) as min_id from students;

/*28.2.*/

select id from students where id = (select min(id) from students);

/*29. Вывести максимальный.*/

/*29.1.*/

select max(id) as max_id from students;

/*29.2.*/

select id from students where id = (select max(id) from students); 

/*30. Вывести количество пользователей.*/

select count(*) from students;

/*31. Вывести id пользователя, имя, дату создания пользователя. Отсортировать по порядку возрастания даты добавления пользоватлеля.*/

select id, name, created_on from students order by created_on; 

/*32. Вывести id пользователя, имя, дату создания пользователя. Отсортировать по порядку убывания даты добавления пользоватлеля.*/

select id, name, created_on from students order by created_on desc;

/*===================================================== END =========================================================================/*