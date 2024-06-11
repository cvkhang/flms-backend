select *
from _flms.player_match m
left join _flms.players p on m.player_id = p.player_id
where m.match_id = $1 and m.club_name = $2 and m.event in ('start','sub')
order by m."event" asc, m.player_id asc