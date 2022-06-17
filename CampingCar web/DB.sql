CREATE TABLE company
(
    c_id   NUMBER(1)   NOT NULL,
    c_name  VARCHAR(10),
    c_address   VARCHAR(40),
    c_telephone VARCHAR(20),
    c_personname    VARCHAR(15),
    c_personmail    varchar(30)
);

ALTER TABLE company ADD CONSTRAINT c_id_pk PRIMARY KEY (c_id) ;


CREATE TABLE campcar
(
    cp_num  VARCHAR(9) NOT NULL,
    cp_name VARCHAR(30),
    cp_type VARCHAR(2),   
    cp_date date,
    cp_count    NUMBER(2),
    cp_info VARCHAR(80),
    cp_cost NUMBER(7),
    c_id    NUMBER(1)
);

ALTER TABLE campcar ADD CONSTRAINT cp_num_pk PRIMARY KEY (cp_num) ;

ALTER TABLE campcar
ADD CONSTRAINTS c_id_fk FOREIGN KEY (c_id) 
REFERENCES company(c_id);


CREATE TABLE repairshop
(
    rs_id   NUMBER(1)   NOT NULL,
    rs_name VARCHAR(25),
    rs_address  VARCHAR(40),
    rs_telephone    VARCHAR(15),
    rs_personname   VARCHAR(15),
    rs_personmail   VARCHAR(30)
);

ALTER TABLE repairshop ADD CONSTRAINT rs_id_pk PRIMARY KEY (rs_id) ;


CREATE TABLE customer
(
    cs_license   NUMBER(15) NOT NULL,
    cs_name VARCHAR(15),
    cs_address  VARCHAR(40),
    cs_telephone    VARCHAR(15),
    cs_mail VARCHAR(30)
);

ALTER TABLE customer ADD CONSTRAINT cs_license_pk PRIMARY KEY (cs_license) ;


CREATE TABLE cust_used
(
    cs_license  NUMBER(15),
    cu_start    date,
    cp_num  VARCHAR(9),
    cu_useday   NUMBER(3)
);

ALTER TABLE cust_used
ADD CONSTRAINTS cs_license_fk FOREIGN KEY (cs_license) 
REFERENCES customer(cs_license);

ALTER TABLE cust_used
ADD CONSTRAINTS cp_num_fk FOREIGN KEY (cp_num) 
REFERENCES campcar(cp_num);

CREATE TABLE campCar_Use
(
    cpu_id  NUMBER(3)   NOT NULL,
    cp_num  VARCHAR(9),
    cs_license  NUMBER(15),
    cpu_useStart date,
    cpu_useEnd date,
    cpu_useDay NUMBER(3),
    cpu_cost VARCHAR(10), 
    cpu_payDate date,
    cpu_etcPayInfo VARCHAR(80),
    cpu_etcPayCost VARCHAR(10)
);

ALTER TABLE campCar_Use
ADD CONSTRAINTS cp_num_fk2 FOREIGN KEY (cp_num) 
REFERENCES campcar(cp_num);

ALTER TABLE campCar_Use
ADD CONSTRAINTS cs_license_fk2 FOREIGN KEY (cs_license) 
REFERENCES customer(cs_license);

CREATE TABLE repair_request
(
    rr_id number(4) NOT NULL,
    cp_num  VARCHAR(9),
    rs_id NUMBER(1),
    cs_license NUMBER(15),
    rr_content VARCHAR(90),
    rr_cost VARCHAR(10),
    rr_payDay date,
    rr_etcContent VARCHAR(70)
);
ALTER TABLE repair_request ADD CONSTRAINT rr_id_pk PRIMARY KEY (rr_id) ;
    
ALTER TABLE repair_request
ADD CONSTRAINTS cp_num_fk3 FOREIGN KEY (cp_num) 
REFERENCES campcar(cp_num);

ALTER TABLE repair_request
ADD CONSTRAINTS rs_id_fk FOREIGN KEY (rs_id) 
REFERENCES repairshop(rs_id);

ALTER TABLE repair_request
ADD CONSTRAINTS cs_license_fk3 FOREIGN KEY (cs_license) 
REFERENCES customer(cs_license);

ALTER TABLE customer ADD cs_passwd VARCHAR(12) ;
ALTER TABLE customer MODIFY cs_address VARCHAR(100);

INSERT INTO company values
(1, 'Benz' ,'경기도 군포시' , '031-123-4321' , '임oo' ,'lim111@naver.com');
INSERT INTO company values
(2, 'Hyundai'  ,'서울시 강서구', '02-567-9753' ,'김oo' , 'kkk@gmail.com');
INSERT INTO company values
(3, 'Kia' ,'서울시 강남구' , '02-012-4576' ,'방oo' , 'bbb123@nate.com');
INSERT INTO company values
(4, 'Tesla' ,'경기도 안산시' , '031-098-5432' ,'이oo' , 'lee1015@daum.net');
INSERT INTO company values
(5, 'Mini' , '서울시 강동구', '02-345-1357' ,'한oo' , 'h1004@yahoo.com');

INSERT INTO campCar values  
('20거4680','G 63 AMG','A',TO_DATE('2020-10-09','YYYY-MM-DD'),18,'버스형캠핑카의 끝판왕',1000000,1);
INSERT INTO campCar values  
('03주3909','GLS 580','A',TO_DATE('2019-01-05','YYYY-MM-DD'),15,'다인승 가능한 버스형 캠핑카',650000,1);
INSERT INTO campCar values  
('10이0892','GLE 300d','C',TO_DATE('2020-07-07', 'YYYY-MM-DD'),8,'깔끔한 디자인의 중형 캠핑카',350000,1);
INSERT INTO campCar values  
('07유9879','GLC 220d','B',TO_DATE('2021-03-25', 'YYYY-MM-DD'),4,'가족단위의 소형 캠핑카',200000,1);
INSERT INTO campCar values  
('11가4098','KONA','A',TO_DATE('2018-06-13', 'YYYY-MM-DD'),16,'16인승까지 가능한 캠핑카',550000,2);
INSERT INTO campCar values  
('02거5050','VENUE','C',TO_DATE('2018-08-08', 'YYYY-MM-DD'),4,'4인승 중형 캠핑카',230000,2);
INSERT INTO campCar values  
('08오8123','SantaFe','C',TO_DATE('2019-02-20', 'YYYY-MM-DD'),8,'8인승 중형 캠핑카',270000,2);
INSERT INTO campCar values  
('10허9091','PALISADE','B',TO_DATE('2019-03-21', 'YYYY-MM-DD'),4,'4인승 소형 캠핑카',100000,2);
INSERT INTO campCar values  
('20러0192','CANIVAL','A',TO_DATE('2019-05-14', 'YYYY-MM-DD'),15,'15인승 버스형 캠핑카' ,530000,3);
INSERT INTO campCar values  
('19감6320','SORENTO','C',TO_DATE('2020-04-27', 'YYYY-MM-DD'),8,'8인승 중형 캠핑카',220000,3);
INSERT INTO campCar values  
('03교7801', 'SPORTAGE','B' , TO_DATE('2020-09-01', 'YYYY-MM-DD') ,5,  '5인승 소형 캠핑카',160000 , 3);
INSERT INTO campCar values  
('05리7091', 'SELTOS' ,'B' , TO_DATE('2020-09-18', 'YYYY-MM-DD')  ,4,  '4인승 소형 캠핑카' ,120000 , 3);
INSERT INTO campCar values  
('17다0954', 'Model S' ,'A' ,TO_DATE('2021-05-09', 'YYYY-MM-DD') ,16, '16인승 전기 캠핑카',610000, 4);
INSERT INTO campCar values  
('09후7651', 'Model 3','C' ,TO_DATE('2021-04-10', 'YYYY-MM-DD') ,8, '8인승 전기 캠핑카' ,290000, 4);
INSERT INTO campCar values  
('11아3331', 'Model X','C' ,TO_DATE('2021-01-28', 'YYYY-MM-DD') ,6, '6인승 전기 캠핑카',240000, 4);
INSERT INTO campCar values  
('13다4149', 'Model Y','B' ,TO_DATE('2021-01-11', 'YYYY-MM-DD') ,2, '2인승 전기 캠핑카',160000, 4);
INSERT INTO campCar values  
('05구0019', '5-DOOR','A' ,TO_DATE('2019-10-10', 'YYYY-MM-DD') ,15, '13인승 대형 캠핑카',470000, 5);
INSERT INTO campCar values 
('17러9592','CONVERTIBLE','C' ,TO_DATE('2019-10-28', 'YYYY-MM-DD') , 7, '7인승 중형 캠핑카',210000, 5);
INSERT INTO campCar values  
('01다8670', 'CLUBMAN' ,'B' ,TO_DATE('2019-12-05', 'YYYY-MM-DD')  ,5, '5인승 소형 캠핑카',140000, 5);
INSERT INTO campCar values  
('05사1530','COUNTRYMAN','B', TO_DATE('2019-09-27', 'YYYY-MM-DD'),3,  '3인승 소형 캠핑카',110000, 5);

INSERT INTO repairshop values  
(1, 'LG정비' , '서울시 마포구' , '02-956-1234', '김철수', 'chul12@naver.com');
INSERT INTO repairshop values  
(2, '두산정비', '경기도 안양시', '031-456-0981', '홍길동', 'hgd098@naver.com');
INSERT INTO repairshop values  
(3, '삼성정비', '충청남도 천안시', '041-135-7890', '박민수', 'minsu0101@naver.com');


