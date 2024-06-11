SELECT 
  m.matchweek, 
  m.match_id, 
  t2.club_name AS opponent, 
  t.home_away,
  m.match_time,
  CASE WHEN t.home_away = 'home' THEN home_ticket ELSE away_ticket END AS ticket
FROM _flms.team_match t
JOIN _flms.matches m ON t.match_id = m.match_id
JOIN _flms.team_match t2 ON m.match_id = t2.match_id
WHERE t.club_name = $1
  AND t.goal_scored IS NULL 
  AND t2.club_name != $1
ORDER BY m.matchweek asc;
