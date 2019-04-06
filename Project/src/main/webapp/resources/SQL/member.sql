--member.sql
create table member(
 mem_id varchar2(100) primary key
 ,mem_pwd varchar2(200) not null
 ,mem_name varchar2(50) not null --회원이름
 ,mem_zip varchar2(10)  --우편번호
 ,mem_zip2 varchar2(10) --우편번호
 ,mem_addr varchar2(100) --주소
 ,mem_addr2 varchar2(100) --나머지주소
 ,mem_phone01 varchar2(10) --폰번호
 ,mem_phone02 varchar2(10) --폰번호
 ,mem_phone03 varchar2(10) --폰번호
 ,mail_id varchar2(50) --메일 아이디
 ,mail_domain varchar2(100) --멜도메인 주소
 ,mem_date date --가입날짜
 ,mem_state varchar2(1) --가입신청회원 0, 가입회원 1, 탈퇴회원 2
 ,mem_grade varchar2(1) --관리자 0, 일반회원 1
 ,mem_joinmessage varchar2(4000) --가입인사
 ,mem_delcont varchar2(4000) --탈퇴사유
 ,mem_deldate date --탈퇴날짜
);

alter table member add (mem_grade varchar2(1) --관리자 0, 일반회원 1
 ,mem_joinmessage varchar2(4000));

--테스트데이터 삽입
insert into member (mem_id,mem_pwd,mem_name,mem_zip,mem_zip2,
mem_addr,mem_addr2,mem_phone01,mem_phone02,mem_phone03,
mail_id,mail_domain,mem_date,mem_state)
values('aaaaa','77777','이순신','123','789',
'서울시 강남구 역삼동 00빌딩','401','010','777','7777',
'aaaaa','naver.com',sysdate,1);

insert into member (mem_id,mem_pwd,mem_name,mem_grade) values('KDH','KDH','김대호','0');
insert into member (mem_id,mem_pwd,mem_name,mem_grade) values('YKD','YKD','유경두','0');
insert into member (mem_id,mem_pwd,mem_name,mem_grade) values('KDS','KDS','강대수','0');
insert into member (mem_id,mem_pwd,mem_name,mem_grade) values('KSK','KSK','강승구','0');
insert into member (mem_id,mem_pwd,mem_name,mem_grade) values('LSY','LSY','이소영','0');
insert into member (mem_id,mem_pwd,mem_name,mem_grade) values('JMH','JMH','조미해','0');
insert into member (mem_id,mem_pwd,mem_name,mem_grade) values('SMJ','SMJ','심민재','0');
insert into member (mem_id,mem_pwd,mem_name,mem_grade) values('KSH','KSH','김석희','0');
insert into member (mem_id,mem_pwd,mem_name,mem_grade) values('LJH','LJH','이진희','0');

delete from member where mem_grade = '0';
--김현우추가_20180513
--테스트데이터삭제
delete from member where mem_id = 'aaaaa';


select * from member;

--우편/주소 테이블(zipcode)
create table zipcode(
 no number(38) primary key
 ,zipcode varchar2(20) --우편번호
 ,sido varchar2(100) --시도
 ,gugun varchar2(100) --구군
 ,dong varchar2(100) --읍면동,길주소
 ,bunji varchar2(100) --번지
);

insert into zipcode values(1,'123-456','서울시','구로구',
'구로동','00빌딩 00호');
select * from zipcode;
























