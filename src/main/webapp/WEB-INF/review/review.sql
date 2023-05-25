create table review(
	idx 			int not null auto_increment,  	/* 리뷰 고유 번호 */
	movieIdx	int not null,										/* 영화 고유 번호 */
	mid 			varchar(20) 			not null, 		/* 작성자 아이디 */
	nickName 	varchar(15)  			not null,			/* 작성자 닉네임 */
	context 	text,														/* 리뷰 내용 */
	rating 		double default 0	not null,			/* 평점 */
	wDate datetime default now(),							/* 작성일자 */
	thumb 		int default 0,	  							/* 좋아요 */
	spoiler		int default 0,	  							/* 스포일러 방지용 (0: 공개 / 1: 스포일러 블러처리) */
	reviewDel 		int default 0, 							/* 신고 */
	primary key(idx),
	foreign key(movieIdx) references movie(idx)	/* 외래키 설정 */ 
	on update cascade
	on delete restrict /* 원본에서 사용하는 키 지우기 제한 - 리뷰가 달려있으면 영화 삭제 불가*/ 
);
desc review;
drop table review;

alter table review add column reviewDelContent text;