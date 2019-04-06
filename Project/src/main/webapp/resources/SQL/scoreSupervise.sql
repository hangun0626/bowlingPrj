--board 테이블 생성
create table SCORE_TEAM_MGM(
 SCORE_TEAM_MGM_PK number(38) primary key --게시물 번호
 ,WRITER           varchar2(100) not null --작성자
 ,SCORE_TEAM_TITLE   varchar2(200) not null --제목
 ,SCORE_TEAM_PWD    varchar2(20) not null --비번
 ,SCORE_TEAM_HITNO number(38) default 0--조회수
 ,SCORE_TEAM_REF number(38) --원본글과 답변글을 묶어주는 그룹번호역할
 ,REG_DTIME date --등록일시
);

select * from SCORE_TEAM_MGM order by SCORE_TEAM_MGM_PK desc;

--board_no_seq 시퀀스 생성
create SCORE_TEAM_MGM_PK_SEQ
START with 1 --1부터 시작
increment by 1 --1씩 증가옵션
nocache;

drop sequence SCORE_TEAM_MGM_PK_SEQ;

select SCORE_TEAM_MGM_PK_SEQ.NEXTVAL from DAUL;