SELECT 
  club_name,
  m.player_id,
  player_name,
  "event",
  event_half,
  event_time
FROM _flms.player_match m
Left join _flms.players p on m.player_id = p.player_id 
WHERE match_id = $1
ORDER BY event_half asc,event_time asc,club_name,"event",m.player_id;
