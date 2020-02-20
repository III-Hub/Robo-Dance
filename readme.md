# Robo-Dance

The Robo-Dance challenge solution.

## Set up

The Laravel framework was used. 

### Data
The db.sql file contains the database dump that can be imported. 
This database already has 2 teams with 5 members each, and 5 danceoffs between pairs of robots from opposing team. 

### A typical Laravel environment will work

### Using Docker
If using docker, the included docker-compose.yml file will pull and set up a LAMP development environment. The app is served at localhost:5000 and PhpMyadmin at locahost. 

## Execution
The app uses the following endpoints with respective http methods in brackets. 

### Robots
* /api/robots   (GET) List of robots
* /api/robots/:id   (GET)  A robot whose id is provided
* /api/robots   (POST) Add new robot. The format is shown below and all values are required
```
{
  "name" : "Funky Joe",
  "powermove" : "Spinning Turtle",
  "experience" : 5,
  "outOfOrder" : false
}
```
* Note: The app generates avatar and assigns robot to a team with less than 5 members. If no such team is available, a new one is created. 

### Seasons or Round
* /api/seasons   (POST) Closses the current active season and creates a new one.
* Note: Danceoff compatition takes place in seasons. A robot may only have one danceoff per season against a member of oposing team.

### Danceoffs
* /api/danceoffs   (GET) List of danceoff compatitions for the current season.
* /api/danceoffs/leaderboard   (GET) List of robots ordered by danceoffs wins for all seasons
* /api/danceoffs   (POST) Add danceoff result. The format is shown below and all values are required
```
{
  "won_id" : 1,
  "lost_id" : 2
}
```
* Note: won_id is the id of the robot that won, lost_id is the id of the robot that lost. A number of validative measures are taken to insure data integrity. 
