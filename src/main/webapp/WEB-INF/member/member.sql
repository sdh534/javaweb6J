show tables;

create table member(
	idx 			int not null auto_increment,  		/* 회원 고유	번호 */
	mid 			varchar(20) 			not null, 			/* 회원 아이디 */
	pwd 			varchar(100) 			not null,				/* 회원 비밀번호-SHA256 암호화 */
	salt 			char(8) 					not null, 			/* 비밀번호 보안을 위한 해시키 */
	email 		varchar(40) 			not null, 			/* 회원 이메일 */
	m_genre 	varchar(100),											/* 선호하는 장르 */
	m_level 	int 							default 1,			/* 유저 등급(0: 관리자 / 1: 일반회원 / 2: 우수회원) */
	nickName 	varchar(15)  			not null,				/* 유저 닉네임 */
	userInfor char(6)						default '공개',		/* 프로필 공개 여부 */
	userDel   char(2)						default 'NO',		/* 탈퇴 신청 여부 */
	content		text,															/* 프로필 소개글 */
	photo 		varchar(100)			default 'noimage.jpg',	/* 회원 사진 */
	primary key(idx, mid) 
);

desc member;

drop table member;

insert into member values (default, "admin", "1234", "", "admin1234@naver.com", "SF/로맨스", 0, "관리자", default, default, "잘부탁합니다.", default);


select * from member where mid="admin";