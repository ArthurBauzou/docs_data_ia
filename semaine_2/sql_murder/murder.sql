-- 15 JAN 2018
-- in SQL city

select * from crime_scene_report
where city = 'SQL City'
and type = 'murder'
and date = 20180115

-- Security footage shows that there were 2 witnesses.
-- The first witness lives at the last house on "Northwestern Dr"
-- The second witness, named Annabel, lives somewhere on "Franklin Ave"

select * from person
where address_street_name = "Northwestern Dr"
order by address_number DESC

-- name : Morty Schapiro
-- id : 14887
-- licence : 118009
-- ssn : 111564949

select * from person
where address_street_name = "Franklin Ave"
and name like 'Annabel%'

-- name : Annabel Miller
-- id : 16371
-- licence : 490173
-- ssn : 318771143

select * from interview
where person_id = 14887

-- MORTY INERVIEW
-- I heard a gunshot and then saw a man run out.
-- He had a "Get Fit Now Gym" bag
-- The membership number on the bag started with "48Z"
-- Only gold members have those bags
-- The man got into a car with a plate that included "H42W"

-- ANNABEL INTERVIEW
-- I saw the murder happen, and I recognized the killer
-- from my gym when I was working out last week on January the 9th

select * from get_fit_now_member
where id like '48Z%'
and membership_status = 'gold'

-- id	person_id	name	 membership_start_date
-- 48Z7A	28819	Joe Germuska	20160305
-- 48Z55	67318	Jeremy Bowers	20160101

-- JEREMY INTERVIEW
-- I was hired by a woman with a lot of money
-- I don't know her name but I know she's around 5'5" (65") or 5'7" (67")
-- She has red hair and she drives a Tesla Model S
-- I know that she attended the SQL Symphony Concert 3 times in December 2017

select membership_id from get_fit_now_check_in
where check_in_date = 20180109

-- (X0643 ,UK1F2 ,XTE42 ,1AE2H ,6LSTG ,7MWHJ ,GE5Q8 ,48Z7A ,48Z55 ,90081)

select a.person_id
from get_fit_now_member as a
join get_fit_now_check_in as b
on a.id = b.membership_id
where b.check_in_date = 20180109

/*
person_id	name
15247	Shondra Ledlow
28073	Zackary Cabotage
55662	Sarita Bartosh
10815	Adriane Pelligra
83186	Burton Grippe
31523	Blossom Crescenzo
92736	Carmen Dimick
28819	Joe Germuska
67318	Jeremy Bowers
16371	Annabel Miller
*/

select a.id, name
from person as a
join drivers_license as b
on a.license_id = b.id
where b.hair_color = 'red'
and b.car_make = 'Tesla'
and b.gender = 'female'

/*
id	name
78881	Red Korb
90700	Regina George
99716	Miranda Priestly
*/

select person_id, count(date)
from facebook_event_checkin
where date < 20180000
and date > 20171200
and event_name like '%symphony%'
group by person_id

-- 24556, 99716

-- id	name	license_id	address_number	address_street_name	ssn
-- 99716	Miranda Priestly	202298	1883	Golden Ave	987756388

select * from income
where ssn = 987756388

-- annual_income : 310000