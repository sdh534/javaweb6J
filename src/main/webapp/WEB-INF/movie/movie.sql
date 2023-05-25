
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

select title, director, keyword, rYear from movie where title like '%가%' or director like '%가%' order by rYear desc limit 5;
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

select * from (select review.* from movie cross join review on movie.idx = review.movieIdx) as temp where movieIdx=1792 and temp.context != "";
select * from (select movie.genre, review.mid from movie cross join review on movie.idx = review.movieIdx) as temp where mid='lalaland';

select title from movie;
select * from movie where title = '앵무새 몸으로 울었다';
select * from movie where title = '랑종';
select * from movie where trailerKey is not null;
select avg(rating) as rating from review where movieIdx = 1067;

alter table movie add column trailerKey varchar(100);
alter table movie drop column trailerKey;

select idx, title from movie;
select * from member cross join review on review.mid = member.mid where context is not null and movieIdx=1067;
select * from	(select member.* from movie cross join review
						on review.movieIdx = movie.idx) as temp where movieIdx=1067 and temp.context != '';
-- 1. 멤버랑 무비테이블을 조인 해주고(movieIdx로 + 리뷰를 가져오면 ? 됨?) 
select * from review;
select review.*, member.photo from member cross join review on review.mid = member.mid where review.mid='sdh534' and movieIdx=1067
select review.*, member.photo from member cross join review on review.mid=member.mid where review.mid='sdh534' and movieIdx=1067

 "select * from (select review.* from movie cross join review on review.movieIdx = movie.idx) as temp where movieIdx=? and temp.context != ''
 select review.* from review cross join movie on review.movieIdx = movie.idx where movieIdx=1067 and context != ''
select review.* from member cross join review on review.mid = member.mid where movieIdx=1067;
select * from (select movieIdx from movie cross join review on review.movieIdx = movie.idx)as a
select * from (select review.idx as rIdx from movie inner join review on review.movieIdx = movie.idx)as a;

-- 1. 리뷰테이블의 값을 가져와서 -> wDate로 분류 -> title 중복제거 -> movie 테이블과 조인
select distinct movieIdx from review order by wDate desc;

select * from movie inner join (select distinct movieIdx from review order by wDate desc)as a on idx = a.movieIdx

select title, director, rYear from movie where title like '%가디%' or director like '%가디%' order by title asc limit 5;