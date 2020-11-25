select * from crime_scene_report where type='murder' AND date=20180115 AND city LIKE 'SQL%';
-- Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".

-- First witness:
select * from person where address_street_name = 'Northwestern Dr' order by address_number DESC limit 1;
-- Morty Schapiro

-- Second witness:
select * from person where name LIKE 'Annabel%' AND address_street_name LIKE "Franklin%"
-- Annabel Miller

select * from interview join person ON person_id = id where name LIKE 'morty%';
-- I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".

select * from interview join person ON person_id = id where name LIKE 'Annabel%' AND address_street_name LIKE 'Franklin%'
-- I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.

select * from get_fit_now_check_in join get_fit_now_member
ON get_fit_now_check_in.membership_id = get_fit_now_member.id
WHERE check_in_date = '20180109' and membership_id LIKE '48Z%'
-- returns Joe Germuska and Jeremy Bowers

select * from get_fit_now_member join person ON get_fit_now_member.name = person.name
where get_fit_now_member.id LIKE '48Z%' AND membership_status = 'gold';
-- return Joe Germuska and Jeremy Bowers

select * from person join drivers_license on person.license_id = drivers_license.id
where plate_number like '%H42W%' AND gender = 'male'
-- returns Tushar Chandra and Jeremy Bowers

SELECT * FROM get_fit_now_check_in 
JOIN get_fit_now_member
ON get_fit_now_check_in.membership_id = get_fit_now_member.id
JOIN person
ON get_fit_now_member.person_id = person.id
JOIN interview
ON interview.person_id = person.id
JOIN drivers_license
ON person.license_id = drivers_license.id
where get_fit_now_member.id LIKE '48Z%' AND membership_status = 'gold'
-- Joined 5 tables by their foreign key and returned one result: Jeremy Bowers and his transcript
-- I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.

