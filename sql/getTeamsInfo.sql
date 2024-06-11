SELECT *
FROM
    _flms.teams t
Join
    _flms.stadiums s ON s.stadium_name = t.stadium_name
Order by t.club_name;
