select *
from _flms.coach_match m
left join _flms.coaches p on m.coach_id = p.coach_id
where m.match_id = $1 and m.club_name = $2 and event in ('participate')