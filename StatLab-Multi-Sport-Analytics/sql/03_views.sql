CREATE VIEW team_game_results AS
SELECT game_id,league_id,game_date,home_team_id AS team_id,away_team_id AS opponent_id,home_score AS score_for,away_score AS score_against,1 AS is_home FROM games
UNION ALL
SELECT game_id,league_id,game_date,away_team_id,home_team_id,away_score,home_score,0 FROM games;
CREATE VIEW team_standings AS SELECT t.team_id,t.name AS team_name,t.league_id,COUNT(*) AS played,
SUM(CASE WHEN score_for>score_against THEN 1 ELSE 0 END) AS wins,
SUM(CASE WHEN score_for<score_against THEN 1 ELSE 0 END) AS losses,
SUM(CASE WHEN score_for=score_against THEN 1 ELSE 0 END) AS draws
FROM team_game_results r JOIN teams t ON t.team_id=r.team_id GROUP BY t.team_id,t.name,t.league_id;
CREATE VIEW nba_game_log AS SELECT s.*,p.name AS player_name,t.name AS team_name,g.game_date,CASE WHEN p.team_id=g.home_team_id THEN 1 ELSE 0 END AS is_home FROM nba_player_games s JOIN players p ON p.player_id=s.player_id JOIN teams t ON t.team_id=p.team_id JOIN games g ON g.game_id=s.game_id;
CREATE VIEW nfl_game_log AS SELECT s.*,p.name AS player_name,t.name AS team_name,g.game_date,CASE WHEN p.team_id=g.home_team_id THEN 1 ELSE 0 END AS is_home FROM nfl_player_games s JOIN players p ON p.player_id=s.player_id JOIN teams t ON t.team_id=p.team_id JOIN games g ON g.game_id=s.game_id;
CREATE VIEW mlb_game_log AS SELECT s.*,p.name AS player_name,t.name AS team_name,g.game_date,CASE WHEN p.team_id=g.home_team_id THEN 1 ELSE 0 END AS is_home FROM mlb_player_games s JOIN players p ON p.player_id=s.player_id JOIN teams t ON t.team_id=p.team_id JOIN games g ON g.game_id=s.game_id;
CREATE VIEW nhl_game_log AS SELECT s.*,p.name AS player_name,t.name AS team_name,g.game_date,CASE WHEN p.team_id=g.home_team_id THEN 1 ELSE 0 END AS is_home FROM nhl_player_games s JOIN players p ON p.player_id=s.player_id JOIN teams t ON t.team_id=p.team_id JOIN games g ON g.game_id=s.game_id;
CREATE VIEW ncaa_game_log AS SELECT s.*,p.name AS player_name,t.name AS team_name,g.game_date,CASE WHEN p.team_id=g.home_team_id THEN 1 ELSE 0 END AS is_home FROM ncaa_player_games s JOIN players p ON p.player_id=s.player_id JOIN teams t ON t.team_id=p.team_id JOIN games g ON g.game_id=s.game_id;
CREATE VIEW soccer_game_log AS SELECT s.*,p.name AS player_name,t.name AS team_name,g.game_date,CASE WHEN p.team_id=g.home_team_id THEN 1 ELSE 0 END AS is_home FROM soccer_player_games s JOIN players p ON p.player_id=s.player_id JOIN teams t ON t.team_id=p.team_id JOIN games g ON g.game_id=s.game_id;
