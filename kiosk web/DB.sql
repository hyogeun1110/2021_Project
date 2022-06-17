--DB 생성
create database foodcourt ;

--테이블 생성
create table court(
	courtid int primary key,
	court_name varchar(10)
	);

create table menu(
	menuid int primary key ,
	menu_name varchar(10),
	price int,
	courtid int foreign key references court (courtid)
	);

CREATE TABLE customer (
       custid int primary key 
   );

create table orders(
	custid int foreign key references customer (custid),
	menuid int foreign key references menu (menuid),
	num int
	) ;
	
-- court테이블에 데이터 insert
insert into court values(1,'상하이');
insert into court values(2,'한성면옥');
insert into court values(3,'전주한식');
insert into court values(4,'돈이돈까스');

-- menu 테이블에 데이터 insert
insert into menu values(1,'짜장면',6000,1);
insert into menu values(2,'짬뽕',7000,1);
insert into menu values(3,'탕수육',10000,1);
insert into menu values(4,'볶음밥',6000,1);
insert into menu values(5,'잡채밥',6000,1);
insert into menu values(6,'칼국수',5000,2);
insert into menu values(7,'잔치국수',4000,2);
insert into menu values(8,'멸치국수',5000,2);
insert into menu values(9,'고기국수',6000,2);
insert into menu values(10,'냉면',5000,2);
insert into menu values(11,'비빔밥',7000,3);
insert into menu values(12,'김치찌개',7000,3);
insert into menu values(13,'설렁탕',7000,3);
insert into menu values(14,'갈비탕',8000,3);
insert into menu values(15,'고등어백반',7500,3);
insert into menu values(16,'등심돈까스',7000,4);
insert into menu values(17,'치즈돈까스',8000,4);
insert into menu values(18,'왕돈까스',8500,4);
insert into menu values(19,'돈까스정식',8500,4);
insert into menu values(20,'생선까스',7000,4);

-- customer 테이블에 데이터 insert
insert into customer values(1)

--프로그램내에서의 sql

-- 푸드코트별로 나누고 그 푸트코트이름과 그 푸드코트에 해당하는 메뉴의 PK,가격을 출력
-- WHERE 절에서 a.courtid = 1 에서 숫자 1을 4까지 바꿔가며써서 푸트코트 4개를 전부 출력
SELECT a.menuid, b.court_name, a.menu_name, a.price
FROM menu a,court b
WHERE a.courtid = b.courtid AND a.courtid=1

-- JSP에서 손님이 주문한 메뉴들의 데이터를 받아  orders 테이블에 INSERT
INSERT INTO orders VALUES ()

--손님이 주문한 메뉴들의 데이터가 저장되있는 orders 테이블을 이용해서 
--메뉴이름,주문한 개수, 메뉴*개수의 가격을 출력
SELECT m.menu_name,o.num, m.price*o.num 
FROM orders o, menu m 
WHERE o.menuid = m.menuid

-- sum() 함수를 사용해서 총금액을 계산. custid(주문번호)를 GROUP BY
SELECT sum(m.price*o.num) 
FROM orders o, menu m
WHERE o.menuid = m.menuid 
GROUP BY o.custid

--손님의 주문번호,주문한 메뉴가 속해있는 푸드코트,메뉴 이름, 주문한 개수를 출력
SELECT o.custid, c.court_name, m.menu_name, o.num 
FROM court c, menu m, orders o 
WHERE c.courtid = m.courtid AND m.menuid = o.menuid AND c.courtid =1

--식권이 출력되면서 손님이 주문한 내역을 삭제(다음 주문을 받기위해)
DELETE FROM orders