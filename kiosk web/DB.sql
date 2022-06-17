--DB ����
create database foodcourt ;

--���̺� ����
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
	
-- court���̺� ������ insert
insert into court values(1,'������');
insert into court values(2,'�Ѽ����');
insert into court values(3,'�����ѽ�');
insert into court values(4,'���̵��');

-- menu ���̺� ������ insert
insert into menu values(1,'¥���',6000,1);
insert into menu values(2,'«��',7000,1);
insert into menu values(3,'������',10000,1);
insert into menu values(4,'������',6000,1);
insert into menu values(5,'��ä��',6000,1);
insert into menu values(6,'Į����',5000,2);
insert into menu values(7,'��ġ����',4000,2);
insert into menu values(8,'��ġ����',5000,2);
insert into menu values(9,'��ⱹ��',6000,2);
insert into menu values(10,'�ø�',5000,2);
insert into menu values(11,'�����',7000,3);
insert into menu values(12,'��ġ�',7000,3);
insert into menu values(13,'������',7000,3);
insert into menu values(14,'������',8000,3);
insert into menu values(15,'������',7500,3);
insert into menu values(16,'��ɵ��',7000,4);
insert into menu values(17,'ġ��',8000,4);
insert into menu values(18,'�յ��',8500,4);
insert into menu values(19,'�������',8500,4);
insert into menu values(20,'�����',7000,4);

-- customer ���̺� ������ insert
insert into customer values(1)

--���α׷��������� sql

-- Ǫ����Ʈ���� ������ �� ǪƮ��Ʈ�̸��� �� Ǫ����Ʈ�� �ش��ϴ� �޴��� PK,������ ���
-- WHERE ������ a.courtid = 1 ���� ���� 1�� 4���� �ٲ㰡��Ἥ ǪƮ��Ʈ 4���� ���� ���
SELECT a.menuid, b.court_name, a.menu_name, a.price
FROM menu a,court b
WHERE a.courtid = b.courtid AND a.courtid=1

-- JSP���� �մ��� �ֹ��� �޴����� �����͸� �޾�  orders ���̺� INSERT
INSERT INTO orders VALUES ()

--�մ��� �ֹ��� �޴����� �����Ͱ� ������ִ� orders ���̺��� �̿��ؼ� 
--�޴��̸�,�ֹ��� ����, �޴�*������ ������ ���
SELECT m.menu_name,o.num, m.price*o.num 
FROM orders o, menu m 
WHERE o.menuid = m.menuid

-- sum() �Լ��� ����ؼ� �ѱݾ��� ���. custid(�ֹ���ȣ)�� GROUP BY
SELECT sum(m.price*o.num) 
FROM orders o, menu m
WHERE o.menuid = m.menuid 
GROUP BY o.custid

--�մ��� �ֹ���ȣ,�ֹ��� �޴��� �����ִ� Ǫ����Ʈ,�޴� �̸�, �ֹ��� ������ ���
SELECT o.custid, c.court_name, m.menu_name, o.num 
FROM court c, menu m, orders o 
WHERE c.courtid = m.courtid AND m.menuid = o.menuid AND c.courtid =1

--�ı��� ��µǸ鼭 �մ��� �ֹ��� ������ ����(���� �ֹ��� �ޱ�����)
DELETE FROM orders