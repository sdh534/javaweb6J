
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
	rating 		double default 0,								/* 별점(사이트내) */
	primary key(idx) 
);
select * from movie where idx = 4829;

drop table movie;

select * from movie where director="크리스토퍼 놀란" order by rYear desc;
