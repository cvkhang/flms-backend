Select *
from _flms.ref_match r
join _flms.matches m on m.match_id = r.match_id
join _flms.team_match t on t.match_id = m.match_id
join  _flms.teams t2 on t.club_name = t2.club_name
join  _flms.referees r2 on r.ref_id = r2.ref_id
where t.home_away = 'home'and m.matchweek = $1
order by r.ref_id;