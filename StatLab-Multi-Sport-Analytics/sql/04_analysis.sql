-- NBA player averages; each record is one player appearance.
SELECT player_id,player_name,COUNT(*) AS games,ROUND(AVG(points*1.0),2) AS ppg,ROUND(AVG(rebounds*1.0),2) AS rpg,ROUND(AVG(assists*1.0),2) AS apg FROM nba_game_log GROUP BY player_id,player_name ORDER BY ppg DESC;
-- Home versus away, not a causal effect.
SELECT player_name,is_home,ROUND(AVG(points*1.0),2) AS ppg FROM nba_game_log GROUP BY player_name,is_home;
-- MLB batting average: ratio of sums, not average game averages.
SELECT player_name,SUM(hits)*1.0/NULLIF(SUM(at_bats),0) AS batting_average FROM mlb_game_log GROUP BY player_name;
-- NFL trends. Passing yards describe the demo quarterbacks only.
SELECT game_date,player_name,passing_yards FROM nfl_game_log ORDER BY game_date;
-- Quality checks: all should return zero.
SELECT COUNT(*) AS invalid_batting_lines FROM mlb_player_games WHERE hits>at_bats OR home_runs>hits;
SELECT COUNT(*) AS non_participating_players FROM nba_player_games s JOIN players p ON p.player_id=s.player_id JOIN games g ON g.game_id=s.game_id WHERE p.team_id NOT IN (g.home_team_id,g.away_team_id);
