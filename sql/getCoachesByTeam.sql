select *
from _flms.coach_team t 
join _flms.coaches c on t.coach_id = c.coach_id
where t.club_name = $1