SELECT TOP (1000) [company]
      ,[location]
      ,[industry]
      ,[total_laid_off]
      ,[percentage_laid_off]
      ,[date]
      ,[stage]
      ,[country]
      ,[funds_raised_millions]
  FROM [Pratik].[dbo].[layoffs]

select * from layoffs

--Remove Duplicates
--Standardize the Data
--Null values or blank values
--Remove Any Columns

select * into layoffs_staging from layoffs where 1=0; --Created staging table with same columns and no datas inside.
select*from layoffs_staging
insert layoffs_staging
select*from layoffs;  -- We just inserted the datas to staging table.

with duplicate_cte as --Duplicate cte
(
select*,
ROW_NUMBER() over(partition by company,location,industry,total_laid_off,percentage_laid_off,date,stage,country,funds_raised_millions order by company) as row_num
from layoffs_staging
)
select * from duplicate_cte where row_num>1; --We removed duplicate data rows.

select*from layoffs_staging where company='Casper'
select*from layoffs_staging

select company,TRIM(company) from layoffs_staging
select company from layoffs_staging
update layoffs_staging
set company=TRIM(company) --We updated company names.

select distinct industry,TRIM(industry) from layoffs_staging order by 1
update layoffs_staging
set industry='Crypto' where industry in (
select distinct industry from layoffs_staging where industry like'Crypto%')
--We changed the crypto like values to crypto to make it spesific.

select distinct location from layoffs_staging order by 1
select distinct country from layoffs_staging order by 1
select date from layoffs_staging order by 1

update layoffs_staging
set country='United States' where country='United States.' --We changed the usa country value.

select *
from layoffs_staging
where ISDATE([date]) = 0; --Checked if the date datas are valid.

alter table layoffs_staging
add date_new date; --Created new date column.

update layoffs_staging
set date_new = 
  try_convert(date, [date], 101); --We converted date from varchar to date data type.

select date,date_new from layoffs_staging
select*from layoffs_staging

alter table layoffs_staging
drop column date --Deleted the old date column.

--Correcting null or blank spaces
select distinct industry from layoffs_staging
select *from layoffs_staging where industry='NULL' or industry =''
select *from layoffs_staging  where company='Carvana'
update layoffs_staging
set industry='Travel' where company='Airbnb'
update layoffs_staging
set industry='Consumer' where company='Juul'
update layoffs_staging
set industry='Transportation' where company='Carvana'


select *from layoffs_staging where total_laid_off='NULL' or total_laid_off =''
select *from layoffs_staging  where company='Accolade'

select * from layoffs_staging
--Deleting the rows that we can't use.
delete from layoffs_staging where total_laid_off='NULL' and percentage_laid_off='NULL'
delete from layoffs_staging where total_laid_off='NULL'


alter table layoffs_staging
alter column total_laid_off int;--Changed from varchar to int.

delete from layoffs_staging where funds_raised_millions='NULL'
alter table layoffs_staging
alter column percentage_laid_off float;

select max(total_laid_off),MAX(percentage_laid_off) from layoffs_staging

alter table layoffs_staging
alter column funds_raised_millions float;

select * from layoffs_staging where percentage_laid_off=1 order by
funds_raised_millions desc

select company, SUM(total_laid_off) from layoffs_staging group by company order by 2 desc

select MIN(date_new) minimum,MAX(date_new) maximum from layoffs_staging

select industry,sum(total_laid_off) total_laid_offs
from layoffs_staging group by industry order by 2 desc  --The industries with the most laid offs.

select country,SUM(total_laid_off) from layoffs_staging
group by country order by 2 desc

select year(date_new) most_laid_offs,sum(total_laid_off) laid_offs from layoffs_staging
group by year(date_new) order by 1 desc

select stage,SUM(total_laid_off) from layoffs_staging
group by stage order by 2 desc

select SUBSTRING(CONVERT(varchar,date_new,23),6,2) as month_v,SUM(total_laid_off) as total_laid_offs
from layoffs_staging 
group by SUBSTRING(CONVERT(varchar,date_new,23),6,2) order by 2 desc --Converted date to varchar for substring.

select company,year(date_new) year_,SUM(total_laid_off) total_layoffs
from layoffs_staging
group by company,year(date_new)
order by year(date_new) desc

select top 1 year(date_new),SUM(total_laid_off)
from layoffs_staging
group by YEAR(date_new)
order by SUM(total_laid_off) desc  --The most layoffs in a year
