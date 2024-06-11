const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser')
const app = express();
const port = 3000;
const db = require('./queries')
app.use(cors());
app.use(express.json());
app.use(bodyParser.json())
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
)



app.get('/', (req, res) => {
  res.send('Hello World!'); // Basic response
});

app.get('/teams', db.getTeams)
app.get('/teams/info', db.getTeamsInfo)
app.get('/teams/matchplayedbyTeam', db.getMatchplayedByTeam)
app.get('/teams/:id', db.getTeamByTeam_name)
app.post('/teams', db.createTeam)
app.put('/teams/:id', db.updateTeam)
app.delete('/teams/:id', db.deleteTeam)

app.get('/stadiums', db.getStadiums)
app.get('/stadiums/:id', db.getStadiumByStadium_name)
app.post('/stadiums', db.createStadium)

app.get('/players/:id', db.getPlayersByTeam)
app.post('/players', db.createPlayer)
app.put('/players/:clubName/:playerID', db.updatePlayer)
app.delete('/players/:playerID', db.deletePlayer)

app.get('/coaches/:clubName', db.getCoachesByTeam)
app.post('/coaches', db.createCoach)
app.put('/coaches/:clubName/:coachID', db.updateCoach)
app.delete('/coaches/:coachID', db.deleteCoach)


app.get('/fixtures/:clubName', db.getFixturesByTeam)
app.get('/fixtures/week/:week', db.getFixturesByWeek)
app.get('/fixtures/event/:match_id', db.getEventByMatch)
app.get('/fixtures/result/:match_id', db.getMatchResult)
app.delete('/fixtures/event/:match_id/:player_id/:event/:event_half/:event_time', db.unsubmitEvent)
app.post('/fixtures/event', db.submitEvent)
app.get('/fixtures/players/:club_name/:match_id', db.getPlayersByMatch)
app.get('/fixtures/coaches/:club_name/:match_id', db.getCoachesByMatch)
app.post('/fixtures/players', db.submitPlayer)
app.delete('/fixtures/players/:matchID/:playerID', db.unsubmitPlayer)
app.post('/fixtures/coach', db.submitCoach)
app.delete('/fixtures/coach/:matchID/:coachID', db.unsubmitCoach)


app.get('/referee', db.getRefList)
app.post('/referee', db.addRef)
app.delete('/referee/:ref_id', db.deleteRef)
app.get('/referee/schedule/:matchweek', db.getRefSchedule)
app.post('/referee/schedule/', db.addRefSchedule)
app.delete('/referee/schedule/:match_id/:ref_id', db.deleteRefSchedule)











app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}/`);
});


  
  

