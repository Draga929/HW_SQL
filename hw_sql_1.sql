/* �������:
1) ������� �� ������ https://docs.google.com/spreadsheets/d/1zKgaE7GfNU5vYeZl9FAua9AmqfQNSwrlaWMfFQX237s/edit?usp=sharing
2) � Google ������� ������� �� ��������� Sheet2
3) ������� ��������� ������ padawan_user � ������� ���� ���
4) ������� DBeaver
5) ����� ���������� PostgreSQL
6) ����: 159.69.151.133
7) ���� ������: qa_students_1
8) ������������: padawan_user_19
9) ������: 123
10) �������� SQL
11) ����� �������� SQL
12) ���������� ������� home work 1 
==========================================================================================================================*/ 

/*1. ������� ��� ���� � ��� ������.*/

select * from students;

/*2. ������� ���� ��������� � �������.*/

select name  from students;

/*3. ������� ������ Id �������������.*/

select id from students;

/*4. ������� ������ ��� �������������.*/

select name from students;

/*5. ������� ������ email �������������.*/

select email from students;

/*6. ������� ��� � email �������������.*/

select name, email from students;

/*7. ������� id, ���, email � ���� �������� �������������.*/

select id, name, email, created_on  from students;

/*8. ������� ������������� ��� password 12333.*/

select * from students where password = '12333' order by name;

/*9. ������� ������������� ������� ���� ������� 2021-03-26 00:00:00.*/

select * from students where created_on  = '2021-03-26 00:00:00' order by name; 

/*10. ������� ������������� ��� � ����� ���� ����� ����.*/

select * from students where name  = '%����%' order by name; 

/*11. ������� ������������� ��� � ����� � ����� ���� 8.*/

select * from students where name  like '%8';

/*12. ������� ������������� ��� � ����� � ���� ����� �.*/

select * from students where name  like '%a%' order by name; 

/*13. ������� ������������� ������� ���� ������� 2021-07-12 00:00:00.*/

select * from students where created_on  = '2021-07-12 00:00:00' order by name;

/*14. ������� ������������� ������� ���� ������� 2021-07-12 00:00:00 � ����� ������ 1m313.*/

select * from students where created_on  = '2021-07-12 00:00:00' and password  = '1m313' order by name;

/*15. ������� ������������� ������� ���� ������� 2021-07-12 00:00:00 � � ������� � ����� ���� ����� Andrey.*/

select * from students where created_on  = '2021-07-12 00:00:00' and name like '%Andrey%' order by name;

/*16. ������� ������������� ������� ���� ������� 2021-07-12 00:00:00 � � ������� � ����� ���� ����� 8.*/

select * from students where created_on  = '2021-07-12 00:00:00' and name like '%8%' order by name;

/*17. ������� ������������ � ������� id ����� 110.*/

select * from students where id = 110;

/*18. ������� ������������ � ������� id ����� 153.*/

select * from students where id = 153;

/*19. ������� ������������ � ������� id ������ 140.*/

select * from students where id > 140;

/*20. ������� ������������ � ������� id ������ 130.*/

select * from students where id < 130;

/*21. ������� ������������ � ������� id ������ 127 ��� ������ 188.*/

select * from students where id < 127 or id > 188;

/*22. ������� ������������ � ������� id ������ ���� ����� 137.*/

select * from students where id <= 137;

/*23. ������� ������������ � ������� id ������ ���� ����� 137.*/

select * from students where id >= 137;

/*24. ������� ������������ � ������� id ������ 180 �� ������ 190.*/

select * from students where id > 180 and id < 190;

/*25. ������� ������������ � ������� id ����� 180 � 190.*/

/*25.1.*/ 

select * from students where id between 180 and 190;

/*25.2.*/

select * from students where id > 179 and id < 191;

/*26. ������� ������������� ��� password ����� 12333, 1m313, 123313.*/

select * from students where password in ('12333', '1m313', '123313');

/*27. ������� ������������� ��� created_on ����� 2020-10-03 00:00:00, 2021-05-19 00:00:00, 2021-03-26 00:00:00.*/

select * from students where created_on in ('2020-10-03 00:00:00', '2021-05-19 00:00:00', '2021-03-26 00:00:00');

/*28. ������� ����������� id.*/

/*28.1.*/

select min(id) as min_id from students;

/*28.2.*/

select id from students where id = (select min(id) from students);

/*29. ������� ������������.*/

/*29.1.*/

select max(id) as max_id from students;

/*29.2.*/

select id from students where id = (select max(id) from students); 

/*30. ������� ���������� �������������.*/

select count(*) from students;

/*31. ������� id ������������, ���, ���� �������� ������������. ������������� �� ������� ����������� ���� ���������� �������������.*/

select id, name, created_on from students order by created_on; 

/*32. ������� id ������������, ���, ���� �������� ������������. ������������� �� ������� �������� ���� ���������� �������������.*/

select id, name, created_on from students order by created_on desc;

/*===================================================== END =========================================================================/*