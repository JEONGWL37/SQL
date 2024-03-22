# 데이터 베이스 목록 확인
SHOW DATABASES;


#DB 접근 명령어
USE mysql;


# 테이블 목록 확인
SHOW TABLES; 


# DB 생성
CREATE DATABASE guro_5class;

# 새로운 DB접근
USE guro_5class;

# student 테이블 생성
CREATE TABLE student ( 
	phone VARCHAR(100) NOT NULL PRIMARY KEY,	
	NAME VARCHAR(20) NOT NULL,
	age INT NOT NULL,
	address VARCHAR(50) NOT NULL
	favorite VARCHAR(50) NOT NULL
);

# 테이블 목록 확인
SHOW TABLES;

#테이블 구조 확인, 아래 둘중에 하나만 입력해도 ok desc: 내림차순
DESC student;
DESCRIBE student;

# 데이터 입력
INSERT INTO student VALUES ('010-6438-9300', '신동진', 36, '서울시 구로구 오류동', '피아노');

# 데이터 확인, *는 ALL(전체 속성)을 의미함.
testSELECT * FROM student;
SELECT NAME, age FROM student;

# 우리의 데이터 입력
INSERT INTO student VALUES('010-9068-4786', '이정원', 28, '서울시 관악구 봉천동', '캠핑');
INSERT INTO student VALUES('010-8475-2297', '최예슬', 33, '경기도 파주시 목동동', '뜨개질');
INSERT INTO student VALUES('010-6792-2536', '박찬흥', 34, '서울 도봉구 창동', '영화보기');
INSERT INTO student VALUES('010-7189-3415', '김가영', 25, '경기도 남양주시', '클라이밍');
INSERT INTO student VALUES('010-5697-7985', '최원석', 33, '서울 서대문구 홍제동', '앤듀로');
INSERT INTO student VALUES('010-8004-3046', '심보민', 25, '경기도 오산시 갈곶동','헬스');
INSERT INTO student VALUES('010-7769-8748', '선혁', 24, '경기도 하남시 선동','축구');
INSERT INTO student VALUES('010-9370-2164', '신준용', 39, '서울 금천구 가산동','놀고먹기');
INSERT INTO student VALUES('010-4172-6775', '이지연', 29, '서울 은평구 진관동','미술');

# test DB에 접근
USE test;

# test Table 목록확인
SHOW TABLES;

# test Table 구조확인
DESC test;

# test Table에 데이터 입력
INSERT INTO test VALUE("사과");

#test Table 데이터 조회 
 SELECT * from test;

# 3글자 데이터 입력 -> 해당 테이블의 col1 컬럼은 char(2) 설정이라서 세글자는 입력 안됨
INSERT INTO test VALUES("포도");



USE guro_5class;

#AS옵션 테스트
SELECT phone AS 전화번호, NAME AS 이름, age AS 나이 FROM student;

# AS를 활용해서 모든 컬럼을 한국어로 변환해서 출력하시오
SELECT phone AS 전화번호, NAME AS 이름, age AS 나이, address AS 주소, favorite AS 취미 FROM student;

# 정렬 -> ORDER BY (asc -> 오름차순, desc -> 내림차순)
SELECT NAME AS 이름, age AS 나이 FROM student ORDER BY age ASC;

# 다차 컬럼 정렬 (이름 ->오름차순, 나이 -> 내림차순)
SELECT NAME AS 이름, age AS 나이 FROM student ORDER BY NAME ASC, age DESC;

INSERT INTO student VALUES('010-5534-9664', '신동진', 40, '서울시 구로구 오류동동', 'lol');

# 이름이 오름차순으로 정렬, 같은 이름이 있으면 해당영역내에서 내림차순 수행
Select * from student order by name asc, age DESC;

# 중복제거 -> Distinct

SELECT DISTINCT NAME FROM student ORDER BY NAME ASC;

#행 개수 제한 출력 -> Limit
SELECT * FROM student; # 전체 조회 시 11개
SELECT * FROM student LIMIT 5; # 5개로 개수 제한 조회

# 연산 열 추가하기 -> Concat. AS는 보기쉽게하는거라서 필수는 아님!
# 문1) 현재 student 테이블에서 작년 기준 나이를 포함한 전체 컬럼을 출력하시오.
SELECT NAME, age As 현재나이, age - 1 AS 작년나이, address, favorite FROM student;

# 문자열 결합하기.
# 문2) 출력 결과에서 name과 age를 결합하고, 전체 컬럼을 출력하시오.
SELECT NAME, age, CONCAT(NAME, age) AS 결합, address, favorite FROM student;

# 응용 하기. fail! 무시하셈
SELECT CONCAT(NAME + "은", age + "살 이며", + address + "거주 중입니다.") AS 응용결과 FROM student;

# SELECT - WHERE 절 연습
# 나이가 33인 학생들을 조회하시오.

SELECT * FROM student WHERE age = 33;

#나이가 30이하 이고, 결과를 내림차순 정렬하시오.
SELECT * FROM student WHERE age <= 30 ORDER BY age DESC;

#문제 1) 나이가 25이상이고, 30 이하인 학생들을 나이를 기준으로 내림차순 출력하시오
#- 출력 컬럼은 전체가 모두 나오게 

SELECT * FROM student WHERE age BETWEEN 25 AND 30 order BY age DESC;
 
 # LIKE 옵션 연습
 # 문제 1) 서울에 거주하는 인원 중 나이가 29 미만인 학생들을 조회하시오.
 #-출력되는 컬럼은 한글로 "이름","나이","주소"만 보이도록 하세요.
 
SELECT NAME AS 이름, age AS 나이, address AS 주소 from student WHERE address LIKE '서울%' AND age < 29;
 
# 오답지
SELECT NAME AS 이름, age AS 나이, address AS 주소 from student WHERE between address LIKE '서울%' and age < 29;

#guro_5class DB에 접근
USE guro_5class;

#Insert 테스트 테이블

CREATE TABLE student_hobby(
	NAME VARCHAR(20) NOT NULL, 
	height FLOAT NOT NULL,
	birthday DATE NOT NULL,
	hobby CHAR(2) 
);	

# Table 목록 확인
SHOW TABLES; 

# 구조확인
DESC student_hobby;

# INSERT 테스트
INSERT INTO student_hobby VALUES ('이정원', 173.2, '1995-08-21'); 

# Null값을 부여한 Insert * Null 허용값을 입력안하는 것이 아니라 Null로 입력해야함.
INSERT INTO student_hobby VALUES ('이정원', 173.2, '1995-08-21', NULL);

SELECT * FROM student_hobby;

# Auto_Increment 숫자 자동 증가 테스트 
CREATE TABLE boarder_test (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	SUBJECT VARCHAR(50) NOT NULL,
	content TEXT NOT NULL
);

# 테이블 구조 확인
DESC boarder_test;	

# Insert 입력 *주의사항 auto_increment는 자동증가이지만 Null값을 써야 함.
INSERT INTO boarder_test VALUES (NULL, '문의드립니다.', '안녕하세요? 컴퓨터가 안되요. 연락주세요');
INSERT INTO boarder_test VALUES (NULL, '문의드립니다.', '안녕하세요? 자판기가 안되요. 환불해주세요');
INSERT INTO boarder_test VALUES (NULL, '문의드립니다.', '안녕하세요? 책상이 부셔졌어요. 교환해주세요');

# 데이터 확인 
SELECT * FROM boarder_tests

# Update Test
SELECT * FROM student;
UPDATE student SET favorite ='축구' WHERE NAME = '선혁';
SELECT * FROM student;
UPDATE student SET favorite ='게임' WHERE NAME = '이정원';
SELECT * FROM student;

# Update Test2 * update 기능 사용시 대상이 된 값이 다시 원래대로 되돌릴 수 없으니 주의 필요! 또한 항상 where을 넣어야 함!
UPDATE student SET favorite ='ㅋㅋ';
SELECT * FROM student;

# Delete Test
SELECT * FROM student;
DELETE FROM student WHERE NAME ='신동진';
DELETE FROM student WHERE phone ='010-6792-2536';

# Truncate Test
TRUNCATE TABLE student;
SELECT * FROM student;

INSERT INTO student VALUES ('010-6438-9300', '신동진', 36, '서울시 구로구 오류동', 'LeagueOfLegend');
SELECT * FROM student;

# Lower -> 소문자 변환 / Upper -> 대문자 변환
SELECT phone, NAME, age, address, LOWER(favorite) AS '소문자 변환 결과' FROM student;
SELECT phone, NAME, age, address, UPPER(favorite) AS '대문자 변환 결과' FROM student;

# SELECT 바로 테스트
SELECT LOWER('LeagueOfLegend') AS '소문자 변환 결과';
SELECT UPPER('LeagueOfLegend') AS '대문자 변환 결과';
    
# Trim 테스트
INSERT INTO student VALUE ('010-9999-9999', '테스트', 33, '서울시 금천구', 'Piano ');
INSERT INTO student VALUE ('010-9999-9111', 'test', 33, '서울시 관악구', 'Piano ');
SELECT * FROM student;

SELECT phone, NAME, age, address, LTRIM(favorite) AS 좌측공백제거 FROM student;

#문자열 합치기
SELECT CONCAT(NAME, '은 ', age, '세 입니다.') AS '문자열 합친 결과' FROM student;

#날짜 뺄셈 Datediff

SELECT * FROM student_hobby;
SELECT DATEDIFF('2024-03-22', birthday) AS '내가 태어나고 몇일 살았지?' FROM student_hobby;

# 테이블 이름 변경 board_test -> test_board

SHOW TABLES;
ALTER TABLE `boarder_test` RENAME `test_board`;
SHOW TABLES;

# 테이블 열 이름 변경 student 테이블에서 favorite -> hobby
SELECT * FROM student;
ALTER TABLE `student` CHANGE COLUMN favorite hobby VARCHAR(77);
DESC student;

# 테이블 열 삭제 student 테이블에서 hobby 컬럼 삭제
ALTER TABLE `student` DROP COLUMN if EXISTS `hobby`;
DESC student;

# 테이블 열 추가 
ALTER TABLE `student` ADD COLUMN hobby varchar(20) NULL;
DESC student;

# 설계단계에서 정규화 끝내고, 2개의 테이블 생성(기본키, 외래키)

CREATE TABLE personal (
	citizen_num CHAR(14) NOT NULL PRIMARY KEY, 
	NAME VARCHAR(10) NOT NULL,
	address VARCHAR(40) NOT NULL
	);
DESC personal;

# 두 번째 키 테이블 생성 (외래키) PRI -> 기본키 / MUL -> 외래키
# 1. 두 번째 테이블은 기본키가 없어도 굴려감 
# 2. cascade
CREATE TABLE personal_addtion(
	citizen_num_fk CHAR(14) NOT NULL, 
	age INT NOT NULL,
	height FLOAT NOT NULL,
	weight FLOAT NOT NULL,
	hobby VARCHAR(10) null,
	FOREIGN KEY (citizen_num_fk) REFERENCES personal(citizen_num) ON DELETE CASCADE #참조 제약(무결성):기본키의
																											  # on update :반대 개념	 
);
DESC personal_addtion;	

# 두 번째 테이블에 기본키를 부여 
ALTER TABLE `personal_addtion` ADD CONSTRAINT PRIMARY KEY (citizen_num_fk);
DESC personal_addtion;

# 데이터 입력 테스트
INSERT INTO personal VALUES ('950821-1******', '이정원', '서울시 관악구');
INSERT INTO personal_addtion VALUES ('950821-1******', 28, 173.2, 95, '게임');
INSERT INTO personal VALUES ('964546-2******', '홍길동', '서울시 구로구');
INSERT INTO personal_addtion VALUES ('964546-2******', 20, 175.2, 76, '보드');

SELECT * FROM personal;
SELECT * FROM personal_addtion;

# personal 테이블에서만 홍길동 데이터 삭제 후 select로 두 테이블 확인

DELETE FROM personal WHERE NAME = '홍길동';
SELECT * FROM personal_addtion;

