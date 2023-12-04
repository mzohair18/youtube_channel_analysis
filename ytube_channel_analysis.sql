use ytube_channel_analysis;
show tables;
select * from alex_the_analyst;

#Q.1) How many SQL videos with views greater than 4L in the month of March 2020 has Alex uploaded?
select * from alex_the_analyst
where title_name like '%SQL%' having month=3 and views>400000;

#Q.2)Which video got the most views on his channel?
select * from alex_the_analyst
order by views DESC;

#Q.3)Which videos got the best ratio of likes and views?
select title_name,(likes/views) as best_like_by_view_ratio from alex_the_analyst
order by best_like_by_view_ratio DESC;

#Q.4)  How many distinct months Alex has posted videos?
select distinct yearmonth from alex_the_analyst;
select count(distinct yearmonth) as months_posted from alex_the_analyst;

#Q.5) How many videos have Alex posted in different types of languages AND TOOLS like SQL,Python,PowerBI
select case
 when title_name like '%ython%' then 'Python'
 when title_name like '%SQL%' then 'SQL'
 when title_name like '%xcel%' then 'EXCEL'
 when title_name like '%ablea%' then 'Tableau'
 when title_name like '%ower%' then 'PowerBI'
else 'Other' end as typ,count(*) as no_of_videos
from alex_the_analyst
group by typ


#Q.6)Specific month is which Alex has posted videos
select yearmonth,count(*) as no_of_videos
from alex_the_analyst
group by yearmonth
order by count(*) DESC;


#Q.7)Which month has more than 1M views on his channel?
select yearmonth,sum(views) as total_views
from alex_the_analyst
group by yearmonth
having total_views>1000000
order by total_views DESC;


#Q.8)What was the percentage change in Nov - Oct 2020 in the views 
with final as (
select yearmonth,sum(views) as totalviews
from alex_the_analyst
where year=2020 and month in (10,11)
group by yearmonth
)
select yearmonth,totalviews,lag(totalviews) over (order by yearmonth desc)
from final

