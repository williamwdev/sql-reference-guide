SELECT * FROM crime_scene_report WHERE type='murder' AND date=20180115 AND city LIKE 'SQL%';
-- Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".

-- First witness:
SELECT * FROM person WHERE address_street_name = 'Northwestern Dr' ORDER BY address_number DESC limit 1;
-- Morty Schapiro

-- Second witness:
SELECT * FROM person WHERE name LIKE 'Annabel%' AND address_street_name LIKE "Franklin%"
-- Annabel Miller

SELECT * FROM interview JOIN person ON person_id = id WHERE name LIKE 'morty%';
-- I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".

SELECT * FROM interview JOIN person ON person_id = id WHERE name LIKE 'Annabel%' AND address_street_name LIKE 'Franklin%'
-- I saw the murder happen, and I recognized the killer FROM my gym when I was working out last week on January the 9th.

SELECT * FROM get_fit_now_check_in JOIN get_fit_now_member
ON get_fit_now_check_in.membership_id = get_fit_now_member.id
WHERE check_in_date = '20180109' AND membership_id LIKE '48Z%'
-- returns Joe Germuska and Jeremy Bowers

SELECT * FROM get_fit_now_member JOIN person ON get_fit_now_member.name = person.name
WHERE get_fit_now_member.id LIKE '48Z%' AND membership_status = 'gold';
-- return Joe Germuska and Jeremy Bowers

SELECT * FROM person JOIN drivers_license on person.license_id = drivers_license.id
WHERE plate_number like '%H42W%' AND gender = 'male'
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
WHERE get_fit_now_member.id LIKE '48Z%' AND membership_status = 'gold'
-- Joined 5 tables by their foreign key and returned one result: Jeremy Bowers and his transcript
-- I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.


-- Congrats, you found the murderer! But wait, there's more... If you think you're up for a challenge, try querying the interview transcript of the murderer to find the real villain behind this crime. If you feel especially confident in your SQL skills, try to complete this final step with no more than 2 queries. Use this same INSERT statement with your new suspect to check your answer.
SELECT * FROM facebook_event_checkin
JOIN person
ON facebook_event_checkin.person_id = person.id
JOIN drivers_license
ON person.license_id = drivers_license.id
WHERE hair_color = 'red' AND car_make LIKE '%Tesla%' AND event_name LIKE '%SQL%'
-- returns Miranda Priestly which is correct