SELECT
    t.club_name,
    COUNT(*) AS played,
    SUM(CASE WHEN m.goal_scored > m2.goal_scored THEN 1 ELSE 0 END) AS won,
    SUM(CASE WHEN m.goal_scored = m2.goal_scored THEN 1 ELSE 0 END) AS drawn,
    SUM(CASE WHEN m.goal_scored < m2.goal_scored THEN 1 ELSE 0 END) AS lost
FROM
    _flms.team_match m
JOIN
    _flms.team_match m2 ON m.match_id = m2.match_id AND m.club_name != m2.club_name
JOIN
    _flms.teams t ON t.club_name = m.club_name
WHERE m.goal_scored is not null and m2.goal_scored is not null
GROUP BY
    t.club_name
ORDER BY
    t.position;
