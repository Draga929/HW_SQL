/* Условия:
1) Перейти по ссылке https://docs.google.com/spreadsheets/d/1zKgaE7GfNU5vYeZl9FAua9AmqfQNSwrlaWMfFQX237s/edit?usp=sharing
2) В Google Таблице перейти на страничку Sheet1
3) Выбрать свободную строку padawan_user и вписать свой Ник
4) Открыть DBeaver
5) Новое соединение PostgreSQL
6) Хост: 159.69.151.133
7) База данных: qa_ddl_28_120
8) Пользователь: padawan_user_120
9) Пароль: 123
10) Редактор SQL
11) Новый редактор SQL
12) Выполнение задание home work 2 */

/*==========================================================================================================================

Таблица employees
Создать таблицу employees 
- id. serial,  primary key,
- employee_name. Varchar(50), not null
Наполнить таблицу employee 70 строками.
Решение:*/

create table employees(
id serial primary key,
employee_name varchar (50) unique not null
);

insert into employees (employee_name)
 values ('Karen'),
        ('Lauran'),
        ('Amanda'),
        ('Elsie'),
        ('Lizzie'),
        ('Alberta'),
        ('Ann'),
        ('Cindy'),
        ('Barbara'),
        ('Laura'),
        ('Rosa'),
        ('Janice'),
        ('Frances'),
        ('Martha'),
        ('Evelyn'),
        ('Maxine'),
        ('Katie'),
        ('June'),
        ('Amy'),
        ('Lillie'),
        ('Sandra'),
        ('Kimberly'),
        ('Lisa'),
        ('Teresa'),
        ('Nancy'),
        ('Arlene'),
        ('Tracey'),
        ('Lucy'),
        ('Lauren'),
        ('Ruth'),
        ('Judith'),
        ('Chong'),
        ('Natasha'),
        ('Jennifer'),
        ('Lorna'),
        ('Jamesi'),
        ('Randal'),
        ('Jerrod'),
        ('John'),
        ('Matthew'),
        ('Steven'),
        ('Theodore'),
        ('Joey'),
        ('Bob'),
        ('Terry'),
        ('Micha'),
        ('Frankie'),
        ('Anthany'),
        ('Mark'),
        ('James'),
        ('Michka'),
        ('Darrell'),
        ('Christopher'),
        ('Joseph'),
        ('Jeffrey'),
        ('Emmett'),
        ('Bernard'),
        ('Mich'),
        ('Roberto'),
        ('Anthony'),
        ('Michael'),
        ('Tomas'),
        ('Kenneth'),
        ('Jof'),
        ('Isaac'),
        ('Robert'),
        ('Charles'),
        ('Jeffriy'),
        ('Joni'),
        ('Brent');
        
select * from employees;

/*======================================================

Таблица salary
Создать таблицу salary
- id. Serial  primary key,
- monthly_salary. Int, not null
Наполнить таблицу salary 15 строками:
- 1000
- 1100
- 1200
- 1300
- 1400
- 1500
- 1600
- 1700
- 1800
- 1900
- 2000
- 2100
- 2200
- 2300
- 2400
- 2500
Ршение:*/

create table salary(
id serial primary key,
monthly_salary int not null
);

insert into salary (monthly_salary)
 values (1000),
        (1100),
        (1200),
        (1300),
        (1400),
        (1500),
        (1600),
        (1700),
        (1800),
        (1900),
        (2000),
        (2100),
        (2200),
        (2300),
        (2400),
        (2500); 

select * from salary;

/*==============================================================

Таблица employee_salary
Создать таблицу employee_salary
- id. Serial  primary key,
- employee_id. Int, not null, unique
- salary_id. Int, not null
Наполнить таблицу employee_salary 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id
--------------------------------------
|  id  |  employee_id  |  salary_id  |
|  3   |     1         |    7        |
|  1   |     2         |    4        |
|  5   |     3         |    9        |
|  40  |     4         |    13       |
|  23  |     5         |    4        |
|  11  |     6         |    2        |
|  52  |     7         |    10       |
|  15  |     8         |    13       |
|  26  |     9         |    4        |
|  16  |     10        |    1        |
|  33  |     11        |    7        |
--------------------------------------
Решение:*/

create table employee_salary(
id serial primary key,
employee_id int not null unique,
salary_id int not null
);

insert into employee_salary(employee_id, salary_id)
values (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (7, 7),
       (8, 8),
       (9, 9),
       (10, 10),
       (495, 11),
       (496, 12),
       (497, 13),
       (498, 14),
       (499, 15),
       (500, 16),
       (501, 17),
       (502, 18),
       (503, 19),
       (504, 20),
       (505, 21),
       (506, 22),
       (507, 23),
       (508, 24),
       (509, 25),
       (510, 26),
       (511, 27),
       (512, 28),
       (513, 29),
       (514, 30),
       (515, 31),
       (516, 32),
       (517, 33),
       (518, 34),
       (519, 35),
       (520, 36),
       (521, 37),
       (522, 38),
       (523, 39),
       (524, 40);
      
select * from employee_salary;

/*================================================================

Таблица roles
Создать таблицу roles
- id. Serial  primary key,
- role_name. int, not null, unique
Поменять тип столба role_name с int на varchar(30)
Наполнить таблицу roles 20 строками:
-----------------------------------------------
|   id   |          role_name                 |
|   1    |     Junior Python developer        |
|   2    |     Middle Python developer        |
|   3    |     Senior Python developer        |
|   4    |     Junior Java developer          |
|   5    |     Middle Java developer          |
|   6    |     Senior Java developer          |
|   7    |     Junior JavaScript developer    |
|   8    |     Middle JavaScript developer    |
|   9    |     Senior JavaScript developer    |
|   10   |     Junior Manual QA engineer      |      
|   11   |     Middle Manual QA engineer      |  
|   12   |     Senior Manual QA engineer      |  
|   13   |     Project Manager                |
|   14   |     Designer                       |
|   15   |     HR                             |
|   16   |     CEO                            |
|   17   |     Sales manager                  |
|   18   |     Junior Automation QA engineer  |        
|   19   |     Middle Automation QA engineer  |     
|   20   |     Senior Automation QA engineer  |   
-----------------------------------------------
Решение:*/

create table roles(
id serial primary key,
role_name int not null unique
);

alter table roles 
alter column role_name type varchar(30);

insert into roles (role_name)
 values ('Junior Python developer'),
        ('Middle Python developer'),
        ('Senior Python developer'),
        ('Junior Java developer'),
        ('Middle Java developer'),
        ('Senior Java developer'),
        ('Junior JavaScript developer'),
        ('Middle JavaScript developer'),
        ('Senior JavaScript developer'),
        ('Junior Manual QA engineer'),
        ('Middle Manual QA engineer'),
        ('Senior Manual QA engineer'),
        ('Project Manager'),
        ('Designer'),
        ('HR'),
        ('CEO'),
        ('Sales manager'),
        ('Junior Automation QA engineer'),
        ('Middle Automation QA engineer'),
        ('Senior Automation QA engineer'); 

select * from roles;

/*==========================================================================

Таблица roles_employee
Создать таблицу roles_employee
- id. Serial  primary key,
- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
Наполнить таблицу roles_employee 40 строками:
--------------------------------------
|  id  |  employee_id  |  role_id    |
|  1   |     7         |    2        |
|  2   |     20        |    4        |
|  3   |     3         |    9        |
|  4   |     5         |    13       |
|  5   |     23        |    4        |
|  6   |     11        |    2        |
|  7   |     10        |    9        |
|  8   |     22        |    13       |
|  9   |     21        |    3        |
|  10  |     34        |    4        |
|  11  |     6         |    7        |
--------------------------------------
Решение:*/

create table roles_employee(
id serial primary key,
employee_id int not null unique,
role_id int not null,
foreign key (employee_id)
references employees(id),
foreign key (role_id)
references roles (id)
);

insert into roles_employee(employee_id, role_id)
values (495, 1),
       (496, 2),
       (497, 3),
       (498, 4),
       (499, 5),
       (500, 6),
       (501, 7),
       (502, 8),
       (503, 9),
       (504, 10),
       (505, 11),
       (506, 12),
       (507, 13),
       (508, 14),
       (509, 15),
       (510, 16),
       (511, 17),
       (512, 18),
       (513, 19),
       (514, 20),
       (515, 1),
       (516, 2),
       (517, 3),
       (518, 4),
       (519, 5),
       (520, 6),
       (521, 7),
       (522, 8),
       (523, 9),
       (524, 10),
       (525, 11),
       (526, 12),
       (527, 13),
       (528, 14),
       (529, 15),
       (530, 16),
       (531, 17),
       (532, 18),
       (533, 19),
       (534, 20);

select * from roles_employee;

/*================ END =================================================================*/
