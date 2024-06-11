select *
from _flms.player_team t 
join _flms.players p on t.player_id = p.player_id
where t.club_name = $1
order by shirt_number