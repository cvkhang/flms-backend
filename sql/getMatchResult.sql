select t1.club_name as team1, t1.goal_scored as goal1, t2.goal_scored as goal2, t2.club_name as team2
from _flms.team_match t1
left join _flms.team_match t2 on t1.match_id = t2.match_id
left join _flms.matches m on m.match_id = t1.match_id
where t1.match_id = $1 and t1.club_name != t2.club_name
order by t2.home_away asc
limit 1