
create table movie(
	idx 			int not null auto_increment,  	/* 영화 고유	번호 */
	title 		varchar(100) 			not null, 		/* 영화 제목 */
	rYear 		int	 							not null,			/* 개봉 년도 */
	country 	varchar(50),  									/* 제작 국가 */
	genre 		varchar(50)			not null,				/* 장르 */
	director 	varchar(30) 		not null,				/* 감독 */
	actor 		text,														/* 주연(구분자 /) */
	keyword   text,														/* 키워드(구분자 /) */
	story			text,														/* 플롯 */
	poster 		text,														/* 포스터 */
	rating 		double default 0,						/* 별점(사이트내) */
	runtime 		int default 0,								/* 상영시간 */
	primary key(idx) 
);
select * from movie where director='크리스토퍼 놀란';
select * from movie where title like '%가디언즈 오브 갤럭시%';

drop table movie;

select * from movie;

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

drop table review;

select movie.idx, movie.title, review.mid, review.context, review.rating, review.wDate from movie inner join review on movie.idx = review.movieIdx;

select * from movie where idx = 1067;
select avg(rating) as rating from review where movieIdx = 1067;