select * from boxoffice_tb;

select * from director_tb;

select * from genere_tb;

select * from language_tb;

#1.Write a query to get Total films released ?
select count(FilmID) Total_film_released from boxoffice_tb;

#2.Write a query to get Total budget ?
select sum(Budget_in_crores) Total_budget_in_Crores from boxoffice_tb;

#3.Write a query to get Total worldwide collection ?
select round(sum(Worldwide_Collection_in_Crores),2) Total_worldwide_collection from boxoffice_tb;

#4.Write a query to get Total First day collection worldwide ?
select round(sum(First_Day_Collection_Worldwide_in_Crores),2) Total_First_Day_Collection_Worldwide from boxoffice_tb;

#5.Write a query to get Total Overseas collection ?
select sum(Overseas_Collection_in_Crores) Total_Overseas_collection from boxoffice_tb;

#6.Write a query to get Total India Gross collection ?
select round(sum(India_Gross_Collection_in_Crores),2) Total_India_Gross_Collection_Worldwide from boxoffice_tb;

#7.Top 10 filmsbased on world wide collections. Display films,collections ?
with cte as (select Title as films, Worldwide_Collection_in_Crores as Collections from boxoffice_tb),
cte1 as (select *, rank() over(order by Collections desc)rnk from cte)
select * from cte1
where rnk<=10;

#8.Total Number of films released by year?
select sum(Title) films, year(Release_Date) year from boxoffice_tb
group by year
order by year asc;

#9.Top 10 filmsbased on india collections.Display films,collections?
with cte as (select Title as films, India_Gross_Collection_in_Crores as Collections from boxoffice_tb),
cte1 as (select *, rank() over(order by Collections desc)rnk from cte)
select * from cte1
where rnk<=10;

#10.Top 10 filmsbased on overses collections.Display films,collections
with cte as (select Title as films, Overseas_Collection_in_Crores as Collections from boxoffice_tb),
cte1 as (select *, rank() over(order by Collections desc)rnk from cte)
select * from cte1
where rnk<=10;

#11.Top 10 filmsbased on firstday collections.Display films,collections?
with cte as (select Title as films, First_Day_Collection_Worldwide_in_Crores as Collections from boxoffice_tb),
cte1 as (select *, rank() over(order by Collections desc)rnk from cte)
select * from cte1
where rnk<=10;

#12.Weekday wise films released,Display week name and no of films released?
select dayname(release_date) weekday_name, count(Title) Total_moviesreleased from boxoffice_tb
group by dayname(release_date)
order by dayname(release_date);

#13.Write a query to get OTT platofrm wise movies count?
select count(Title) movies_count, OTT_Platform from boxoffice_tb
group by OTT_Platform
order by  count(Title);

#14.Top 10 Directors by films released?
with cte as  (select a.Director Director, count(b.Title) films from director_tb a
inner join boxoffice_tb b on a.director_id = b.directorid
group by a.Director),
cte1 as (select *, dense_rank() over(order by films desc)rnk from cte)
select * from cte1
where rnk<=10;

#15.Top 10 directors by world wide collection?
with cte as  (select a.Director Director, sum(b.Worldwide_Collection_in_Crores) World_wide_Collections from director_tb a
inner join boxoffice_tb b on a.director_id = b.directorid
group by a.Director),
cte1 as (select *, dense_rank() over(order by World_wide_Collections desc)rnk from cte)
select * from cte1
where rnk<=10;

#16.Top10 lead actors by world wide collection?
with cte as (select Lead_Actor_Actress,  sum(Worldwide_Collection_in_Crores) World_wide_Collections from boxoffice_tb
group by Lead_Actor_Actress),
cte1 as (select *,rank() over(order by  World_wide_Collections desc)rnk from cte)
select * from cte1
where rnk<=10;

#17,Top 10 movies by IMDb rating?
with cte as (select IMDb_Rating, Title as movies from boxoffice_tb),
cte1 as (select *,dense_rank() over(order by  IMDb_Rating desc)rnk from cte)
select * from cte1
where rnk<=10;

#18,Bottom 10 movies by IMDb rating?
with cte as (select IMDb_Rating, Title as movies from boxoffice_tb),
cte1 as (select *,dense_rank() over(order by  IMDb_Rating asc)rnk from cte)
select * from cte1
where rnk<=10;

#19,Write a query to get 5 longest run time movies?
with cte as (select Runtime_mins, Title as movies from boxoffice_tb),
cte1 as (select *,dense_rank() over(order by  Runtime_mins desc)rnk from cte)
select * from cte1
where rnk<=5;

#20.Write a query to get 5 shortest run time movies?
with cte as (select Runtime_mins, Title as movies from boxoffice_tb),
cte1 as (select *,dense_rank() over(order by  Runtime_mins asc)rnk from cte)
select * from cte1
where rnk<=5;

#21.Top7 movies by world wide collection in Bollywood?
with cte as (select Title as Movies,  sum(Worldwide_Collection_in_Crores) World_wide_Collections from boxoffice_tb
where Industry= 'Bollywood'
group by Title),
cte1 as (select *,dense_rank() over(order by  World_wide_Collections desc)rnk from cte)
select * from cte1
where rnk<=7 ;

#22.Top7 movies by world wide collection in Tollywood?
with cte as (select Title as Movies,  sum(Worldwide_Collection_in_Crores) World_wide_Collections from boxoffice_tb
where Industry= 'Tollywood'
group by Title),
cte1 as (select *,dense_rank() over(order by  World_wide_Collections desc)rnk from cte)
select * from cte1
where rnk<=7 ;

#23.Top7 movies by world wide collection in Kollywood?
with cte as (select Title as Movies,  sum(Worldwide_Collection_in_Crores) World_wide_Collections from boxoffice_tb
where Industry= 'Kollywood'
group by Title),
cte1 as (select *,dense_rank() over(order by  World_wide_Collections desc)rnk from cte)
select * from cte1
where rnk<=7 ;

#24.Top7 movies by world wide collection in Sandalwood?
with cte as (select Title as Movies,  sum(Worldwide_Collection_in_Crores) World_wide_Collections from boxoffice_tb
where Industry= 'Sandalwood'
group by Title),
cte1 as (select *,dense_rank() over(order by  World_wide_Collections desc)rnk from cte)
select * from cte1
where rnk<=7 ;

#25.Top7 movies by world wide collection in Mollywood?
with cte as (select Title as Movies,  sum(Worldwide_Collection_in_Crores) World_wide_Collections from boxoffice_tb
where Industry= 'Mollywood'
group by Title),
cte1 as (select *,dense_rank() over(order by  World_wide_Collections desc)rnk from cte)
select * from cte1
where rnk<=7 ;

#26.Write query to display industry and verdict wise films count?
select Industry, Verdict, count(Title) as films from boxoffice_tb
group by Industry, Verdict
order by Industry;

#27.Write query to get films based on budget in Bollywood?
select Title as films, Budget_in_Crores from boxoffice_tb
where Industry ='Bollywood'
order by Budget_in_Crores desc;

#28.Write query to get films based on budget in Tollywood?
select Title as films, Budget_in_Crores from boxoffice_tb
where Industry ='Tollywood'
order by Budget_in_Crores desc;

#29.Write query to get films based on budget in Kollywood?
select Title as films, Budget_in_Crores from boxoffice_tb
where Industry ='Kollywood'
order by Budget_in_Crores desc;

#30.Write query to get films based on budget in Sandalwood?
select Title as films, Budget_in_Crores from boxoffice_tb
where Industry ='Sandalwood'
order by Budget_in_Crores desc;

#31.Write query to get films based on budget in Mollywood?
select Title as films, Budget_in_Crores from boxoffice_tb
where Industry ='Mollywood'
order by Budget_in_Crores desc;

#32.Top 5 movies by IMDb rating from Bollywood?
with cte as (select IMDb_Rating, Title as films from boxoffice_tb
where Industry = 'Bollywood'),
cte1 as (select *, dense_rank() over(order by IMDb_Rating desc)rnk from cte)
select * from cte1
where rnk<=5;

#33.Top 5 movies by IMDb rating from  Kollywood?
with cte as (select IMDb_Rating, Title as films from boxoffice_tb
where Industry = 'Kollywood'),
cte1 as (select *, dense_rank() over(order by IMDb_Rating desc)rnk from cte)
select * from cte1
where rnk<=5;

#34.Top 5 movies by IMDb rating from Tollywood?
with cte as (select IMDb_Rating, Title as films from boxoffice_tb
where Industry = 'Tollywood'),
cte1 as (select *, dense_rank() over(order by IMDb_Rating desc)rnk from cte)
select * from cte1
where rnk<=5;

#35.Top 5 movies by IMDb rating from Sandalwood?
with cte as (select IMDb_Rating, Title as films from boxoffice_tb
where Industry = 'Sandalwood'),
cte1 as (select *, dense_rank() over(order by IMDb_Rating desc)rnk from cte)
select * from cte1
where rnk<=5;

#36.Top 5 movies by IMDb rating from Mollywood
with cte as (select IMDb_Rating, Title as films from boxoffice_tb
where Industry = 'Mollywood'),
cte1 as (select *, dense_rank() over(order by IMDb_Rating desc)rnk from cte)
select * from cte1
where rnk<=5;

#37.Write a query to get language wise budget
select a.language, sum(b.Budget_in_Crores) budget_in_Crore from language_tb a
left join boxoffice_tb b on a.LanguageID = b.LanguageID
group by Language
order by sum(b.Budget_in_Crores);

#38.Write a query to get language wise how many directors are there?
select a.language , count(distinct b.DirectorID) DirectorsCount from language_tb a
left join boxoffice_tb b on a.LanguageID = b.LanguageID
group by a.language;

#39.Write a query to get language wise worldwide total collection ?
select a.language , round(sum(b.Worldwide_Collection_in_Crores),2) Worldwide_Collection_in_Crores from language_tb a
left join boxoffice_tb b on a.LanguageID = b.LanguageID
group by a.language
Order by sum(b.Worldwide_Collection_in_Crores);

#40.Write a query to get language, lead actor/actress wise films they acted?
select a.language, b.Lead_Actor_Actress as Actor_Actress, b.Title  from language_tb a
left join boxoffice_tb b on a.LanguageID = b.LanguageID;

#41.Write a query to get language, year wise films released?
select a.language, year(b.Release_date) year, b.Title  from language_tb a
left join boxoffice_tb b on a.LanguageID = b.LanguageID
order by year(b.Release_date);

#42.Write a query to get films which was not released on overseas?
select title as films from boxoffice_tb
where Overseas_Collection_in_Crores = 0;

#43,Write a query to get language wise top 3 longest runtime moves?
with cte as (select a.language, b.Runtime_mins, Title as movies from language_tb a 
left join boxoffice_tb b on a.LanguageID = b.LanguageID),
cte1 as (select *,dense_rank() over(order by  Runtime_mins desc)rnk from cte)
select * from cte1
where rnk<=3;

#44.Write a query to get language wise bottom 5 shortest runtime moves?
with cte as (select a.language, b.Runtime_mins, Title as movies from language_tb a 
left join boxoffice_tb b on a.LanguageID = b.LanguageID),
cte1 as (select *,dense_rank() over(order by  Runtime_mins asc)rnk from cte)
select * from cte1
where rnk<=5;

#45.Write a query to get language wise top 5 films based first day collections?
with cte as (select a.language ,b.First_Day_Collection_Worldwide_in_Crores as First_Day_Collection_Worldwide_in_Crores, Title as movies from language_tb a 
left join boxoffice_tb b on a.LanguageID = b.LanguageID),
cte1 as (select *,dense_rank() over(order by First_Day_Collection_Worldwide_in_Crores desc)rnk from cte)
select * from cte1
where rnk<=5;

#46.Write a query to get language wise top 5 films based India gross collections?
with cte as (select a.language, b.India_Gross_Collection_in_Crores as India_Gross_Collection_in_Crores, Title as movies from language_tb a 
left join boxoffice_tb b on a.LanguageID = b.LanguageID),
cte1 as (select *,dense_rank() over(order by  b.India_Gross_Collection_in_Crores desc)rnk from cte)
select * from cte1
where rnk<=5;

#47.Write a query to get language, Director wise films count?
select c.Director, a.language , count(b.Title) as films from language_tb a
inner join boxoffice_tb b on a.LanguageID = b.LanguageID
inner join director_tb c on b.DirectorID = c.director_id
group by a.language , c.Director;

#48.Write a query to get language wise OTT platofrm wise fims count?
select a.language language, b.OTT_Platform OTT_Platform , count(b.Title) film_count from language_tb a
inner join boxoffice_tb b
group by a.language, b.OTT_Platform ;

#49.What are top 10 fimns based language and first day collection?
with cte as (select a.language ,b.First_Day_Collection_Worldwide_in_Crores as First_Day_Collection_Worldwide_in_Crores, b.Title as film from language_tb a 
left join boxoffice_tb b on a.LanguageID = b.LanguageID),
cte1 as (select *,dense_rank() over(partition by a.language order by First_Day_Collection_Worldwide_in_Crores desc)rnk from cte)
select * from cte1
where rnk<=10; 

#50.Write a query to get director wise number of fims released in from year 2017 to 2019?
select a.director, count(b.Title) films from director_tb a
inner join boxoffice_tb b on a.Director_ID = b.directorID
where year(release_date) between 2017 and 2019
group by a.director;

#51.Write a query to get director wise world wide collections?
select a.director, round(sum(b.Worldwide_Collection_in_Crores),2) Worldwide_Collection_in_Crores from director_tb a
inner join boxoffice_tb b on a.Director_ID = b.directorID
group by a.director;

#52.Write a query to get director wise first day world wide collections?
select a.director, round(sum(b.First_Day_Collection_Worldwide_in_Crores),2) First_Day_Collection_Worldwide_in_Crores from director_tb a
inner join boxoffice_tb b on a.Director_ID = b.directorID
group by a.director;

#53.Write a query to get director wise India gross collections?
select a.director, round(sum(b.India_Gross_Collection_in_Crores),2) India_Gross_Collection_in_Crores from director_tb a
inner join boxoffice_tb b on a.Director_ID = b.directorID
group by a.director
order by round(sum(b.India_Gross_Collection_in_Crores),2) desc;

#54.Write a query to get director wise overseas collections?
select a.director, round(sum(b.Overseas_Collection_in_Crores),2) Overseas_Collection_in_Crores from director_tb a
inner join boxoffice_tb b on a.Director_ID = b.directorID
group by a.director
order by a.director;

#55.Write a query to get director, lead actor/actress and number of films?
select a.director, b.Lead_Actor_Actress, count(b.title) film_count from director_tb a
inner join boxoffice_tb b on a.Director_ID = b.directorID
group by a.director, b.Lead_Actor_Actress;

#56.Write a query to get films which is having budget on between 150 crores and 277 crores?
select Title, Budget_in_Crores from boxoffice_tb
where Budget_in_Crores between 150 and 277;

#57.Write a query to get director, week name wise films released?
select a.director, dayname(b.release_date) dayname, b.Title as film from director_tb a
inner join boxoffice_tb b on a.Director_ID = b.directorID
order by dayname(b.release_date);

#58.Write a query to get OTT platofrm and director wise films released?
select a.ott_platform, b.director, a.Title film from boxoffice_tb a
inner join director_tb b on a.DirectorID = b.director_ID
order by b.director;

#59.Write a query to get director wise films released on Friday only?
select a.director, b.Title as film from director_tb a
inner join boxoffice_tb b on a.Director_ID = b.directorID
where dayname(b.release_date)= 'Friday';

#60.Write a query to get films based on IMDb reating between 6.5 and 7.7?
select Title, IMDB_Rating from boxoffice_tb
where IMDB_Rating between 6.5 and 7.7;

#61.Write a query to get director,films and IMDb ratings?
select a.director, b.Title film, b.IMDB_Rating from director_tb a
inner join boxoffice_tb b on a.Director_ID = b.directorID;

#62.Write a query to get films with highest budget based flop verdict?
select Title film, max(Budget_in_Crores) highest_budget from boxoffice_tb
where verdict = 'flop'
group by Title 
order by max(Budget_in_Crores) desc;

#63.Write a query to get total number of directors?
Select count(distinct director) Director_count from director_tb;

#64.Write a query to get vedridct wise total films released?
select verdict, count(Title) Total_films from boxoffice_tb
group by verdict;

#65.Write a query to get top 10 directors based number of films?
with cte as (select a.director, count(b.Title) Total_films from director_tb a
inner join boxoffice_tb b on a.Director_ID = b.directorID
group by a.director),
cte1 as (select *, dense_rank() over(order by Total_films desc)rnk from cte)
select * from cte1
where rnk<=10;

#66.Write a query to get top 5 directors based on world wide collections and also industry wise?
with cte as (select a.director, b.Industry, sum(b.Worldwide_Collection_in_Crores) Worldwide_Collection_in_Crores from director_tb a
inner join boxoffice_tb b on a.Director_ID = b.directorID
group by a.director, b.Industry),
cte1 as (select *, dense_rank() over(order by Worldwide_Collection_in_Crores desc)rnk from cte)
select * from cte1
where rnk<=5;

#67.Write a query to get top 3 directors based on India gross collections in Bollowood industry?
with cte as (select a.director, round(sum(b.India_Gross_Collection_in_Crores),2) India_Gross_Collection_in_Crores from director_tb a
inner join boxoffice_tb b on a.Director_ID = b.directorID
where Industry = 'Bollywood'
group by a.director),
cte1 as (select *, dense_rank() over(order by India_Gross_Collection_in_Crores desc)rnk from cte)
select * from cte1
where rnk<=3;

#68.Write a query to get top 3 directors based on India gross collections in Tollowood industry?
with cte as (select a.director, round(sum(b.India_Gross_Collection_in_Crores),2) India_Gross_Collection_in_Crores from director_tb a
inner join boxoffice_tb b on a.Director_ID = b.directorID
where Industry = 'Tollywood'
group by a.director),
cte1 as (select *, dense_rank() over(order by India_Gross_Collection_in_Crores desc)rnk from cte)
select * from cte1
where rnk<=3;

#69.Write a query to get top 3 directors based on India gross collections in Kollowood industry?
with cte as (select a.director, round(sum(b.India_Gross_Collection_in_Crores),2) India_Gross_Collection_in_Crores from director_tb a
inner join boxoffice_tb b on a.Director_ID = b.directorID
where Industry = 'Kollywood'
group by a.director),
cte1 as (select *, dense_rank() over(order by India_Gross_Collection_in_Crores desc)rnk from cte)
select * from cte1
where rnk<=3;

#70.Write a query to get top 3 directors based on India gross collections in Mollowood industry?
with cte as (select a.director, round(sum(b.India_Gross_Collection_in_Crores),2) India_Gross_Collection_in_Crores from director_tb a
inner join boxoffice_tb b on a.Director_ID = b.directorID
where Industry = 'Mollywood'
group by a.director),
cte1 as (select *, dense_rank() over(order by India_Gross_Collection_in_Crores desc)rnk from cte)
select * from cte1
where rnk<=3;

#71.Write a query to get top 3 directors based on India gross collections in Sandalwood industry?
with cte as (select a.director, round(sum(b.India_Gross_Collection_in_Crores),2) India_Gross_Collection_in_Crores from director_tb a
inner join boxoffice_tb b on a.Director_ID = b.directorID
where Industry = 'Sandalwood'
group by a.director),
cte1 as (select *, dense_rank() over(order by India_Gross_Collection_in_Crores desc)rnk from cte)
select * from cte1
where rnk<=3;

#72.Write to get total number of generes?
select count(distinct Genre) Total_Genre from genere_tb;

#73.Write query to get director,language,genere films count?
select d.director, l.language, g.genre, count(b.Title) as Film_count from boxoffice_tb b
inner join director_tb d on b.DirectorID = d.director_ID
inner join language_tb l on l.LanguageID = b.LanguageID
inner join genere_tb g on g.GenreID = b.GenreID
group by d.director, l.language, g.genre;

#74.Write a query to genere wise budget?
select g.genre , sum(b.Budget_in_Crores) as Budget_in_Crores from boxoffice_tb b
left join genere_tb g on b.GenreID = g.GenreID
group by g.genre;

#75.Write a query to get genere wise first day worldwide collections?
select g.genre , round(sum(b.First_Day_Collection_Worldwide_in_Crores),2) as First_Day_Collection_Worldwide_in_Crores from boxoffice_tb b
left join genere_tb g on b.GenreID = g.GenreID
group by g.genre;

#76.Write a query to get genere wise overseas collections?
select g.genre , round(sum(b.Overseas_Collection_in_Crores),2) as Overseas_Collection_in_Crores from boxoffice_tb b
left join genere_tb g on b.GenreID = g.GenreID
group by g.genre;

#77.Write a query to get genere wise India gross collections?
select g.genre , round(sum(b.India_Gross_Collection_in_Crores),2) as India_Gross_Collection_in_Crores from boxoffice_tb b
left join genere_tb g on b.GenreID = g.GenreID
group by g.genre;

#78.Write a query to get genere wise top 2 longest run time movies?
with cte as (select g.genre,b.Title movie, b.Runtime_mins Longest_run_Time from boxoffice_tb b
left join genere_tb g on b.GenreID = g.GenreID),
cte1 as (select *, Dense_rank() over(order by Longest_run_Time desc)rnk from cte)
select * from cte1
where rnk<=2;

#79.Write a query to get genere wise bottom shortest runtime movies?
with cte as (select g.genre,b.Title movie, b.Runtime_mins Longest_run_Time from boxoffice_tb b
left join genere_tb g on b.GenreID = g.GenreID),
cte1 as (select *, Dense_rank() over(order by Longest_run_Time asc)rnk from cte)
select * from cte1;

#80.Write a query to get verdict, genere wise films released?
select b.verdict, b.Title film, g.genre from boxoffice_tb b
inner join genere_tb g on g.GenreID = b.GenreID;

#81.Write a query to get genere, OTT platform wise films count?
select b.OTT_Platform, g.genre, count(b.Title) films_count from boxoffice_tb b
inner join genere_tb g on g.GenreID = b.GenreID
group by b.OTT_Platform,g.genre;

#82.Write a query to get genere wise films count?
select g.genre, count(b.Title) films_count from boxoffice_tb b
inner join genere_tb g on g.GenreID = b.GenreID
group by g.genre;

#83.Write a query to get genere wise films count  in Tollowood Industry?
select g.genre, count(b.Title) films_count, b.Industry from boxoffice_tb b
inner join genere_tb g on g.GenreID = b.GenreID
where Industry = 'Tollywood'
group by g.genre;

#84.Write a query to get genere wise films count in Kollowood Industry?
select g.genre, count(b.Title) films_count, b.Industry from boxoffice_tb b
inner join genere_tb g on g.GenreID = b.GenreID
where Industry = 'Kollywood'
group by g.genre;

#85.Write a query to get genere wise films count in Mollowood Industry?
select g.genre, count(b.Title) films_count, b.Industry from boxoffice_tb b
inner join genere_tb g on g.GenreID = b.GenreID
where Industry = 'Mollywood'
group by g.genre;

#86.Write a query to get genere wise films count in Bollowood Industry?
select g.genre, count(b.Title) films_count, b.Industry from boxoffice_tb b
inner join genere_tb g on g.GenreID = b.GenreID
where Industry = 'Bollywood'
group by g.genre;

#87.Write a query to get genere wise films count in Sandalwood Industry?
select g.genre, count(b.Title) films_count, b.Industry from boxoffice_tb b
inner join genere_tb g on g.GenreID = b.GenreID
where Industry = 'Sandalwood'
group by g.genre;

#88.Write a query to get lead actors/actress wise,genere and films count?
select b.Lead_Actor_Actress,g.genre, Count(b.Title) as FilmCount from boxoffice_tb b
inner join genere_tb g on g.GenreID = b.GenreID
group by g.genre,b.Lead_Actor_Actress;

#89.Write a query to get 5th rank movie based on Worldwide total collections?
with cte as (select Title, round(sum(Worldwide_Collection_in_Crores),2) Worldwide_Collection_in_Crores from boxoffice_tb
group by Title),
cte1 as(select *, dense_rank() over(order by Worldwide_Collection_in_Crores desc)rnk from cte)
select * from cte1
where rnk= 5;

#90.Write a query to get 5th rank movie by industry wise based on First day worldwide collections?
with cte as (select Title film,Industry, First_Day_Collection_Worldwide_in_Crores from boxoffice_tb),
cte1 as(select *, dense_rank() over(partition by Industry order by First_Day_Collection_Worldwide_in_Crores desc)rnk from cte)
select * from cte1
where rnk= 5;

#91.Write a query to get 3rd rank movie by industry wise based on IMDb Ratings?
with cte as (select Title film,Industry, IMDb_Rating from boxoffice_tb),
cte1 as(select *, dense_rank() over(partition by Industry order by IMDb_Rating desc)rnk from cte)
select * from cte1
where rnk= 3;

#92.Write a stored procedure to get top 5 films based on India gross colelctions?
delimiter &&
create procedure Top5filmsbasedIndiagrosscollection()
begin 
with cte as (select Title film, India_Gross_Collection_in_Crores from boxoffice_tb),
cte1 as(select *, dense_rank() over(order by India_Gross_Collection_in_Crores desc)rnk from cte)
select * from cte1
where rnk<= 5;
end
&&

call Top5filmsbasedIndiagrosscollection;

#93.Write a stored procdure to get industry Budget and Worldwide total collections? If we call any industry it will display industry,budget and wordwide total?
delimiter &&
create procedure Industrybudget(
In Industryname varchar(15))
begin
select industry, sum(Budget_in_Crores) Budget, round(sum(Worldwide_Collection_in_Crores),2) Worldwide_Total
from boxoffice_tb
where industry = Industryname
group by industry;
end
&&

#94.Calculate YoY% Budget growth?
with cte as
(select year(release_date) yr, round(sum(Budget_in_Crores),2)Total_Budget from boxoffice_tb
group by year(release_date)),
cte1 as (select yr,Total_Budget, lag(Total_Budget) over(order by yr) pr_Total_Budget from cte)
select *, concat(round(((Total_Budget-pr_Total_Budget)/pr_Total_Budget)*100,2),'%') as yoy from cte1;

#95.Calculate YoY% Worldwide total collelctions growth?
with cte as
(select year(release_date) yr, round(sum(Worldwide_Collection_in_Crores),2)Total_ww_cc from boxoffice_tb
group by year(release_date)),
cte1 as (select yr,Total_ww_cc, lag(total_ww_cc) over(order by yr) pre_yr_total_ww_cc from cte)
select *, concat(round(((Total_ww_cc-pre_yr_total_ww_cc)/pre_yr_total_ww_cc)*100,2),'%') as yoy from cte1;

#96. Calculate YoY% Indian Gross colelctions growth?
with cte as
(select year(release_date) yr, round(sum(India_Gross_Collection_in_Crores),2)Total_Ind_cc from boxoffice_tb
group by year(release_date)),
cte1 as (select yr,Total_Ind_cc, lag(Total_Ind_cc) over(order by yr) pre_Total_Ind_cc from cte)
select *, concat(round(((Total_Ind_cc-pre_Total_Ind_cc)/pre_Total_Ind_cc)*100,2),'%') as yoy from cte1;

#97.Create a stored procedure to get Total films count, world wide total collections?
delimiter &&
create procedure getTotfilmcountwwcc()
begin
select count(Title) Total_film_count, round(sum(Worldwide_Collection_in_Crores),2) WW_Collections from boxoffice_tb;
end
&&

call getTotfilmcountwwcc();
