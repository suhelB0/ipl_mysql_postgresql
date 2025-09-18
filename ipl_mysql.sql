use ipl_data;

SELECT * FROM matches;
SELECT * FROM  deliveries;

-- 1. Number of matches played per year of all the years in IPL.
SELECT season,COUNT(*) FROM  matches GROUP BY season ORDER BY season;

-- 2. Number of matches won of all teams over all the years of IPL.
SELECT winner,COUNT(*) FROM matches WHERE winner<>'' GROUP BY winner;

-- 3. For the year 2016 get the extra runs conceded per team.
SELECT bowling_team,SUM(extra_runs) FROM deliveries WHERE match_id IN (SELECT id FROM matches WHERE season=2016) GROUP BY bowling_team;

-- 4. For the year 2015 get the top economical bowlers.
SELECT d.bowler, ROUND(SUM(d.total_runs - d.bye_runs - d.legbye_runs)/(SUM(CASE WHEN d.wide_runs=0 AND d.noball_runs=0 THEN 1 ELSE 0 END)/6.0),2) AS economy
FROM deliveries d
JOIN matches m
  ON d.match_id = m.id
WHERE m.season = 2015
GROUP BY d.bowler
ORDER BY economy
LIMIT 10;

-- 5. Top run scorer in year 2016.
SELECT batsman,SUM(batsman_runs) AS runs FROM deliveries WHERE match_id IN (SELECT id FROM matches WHERE season=2016) GROUP BY batsman ORDER BY runs DESC LIMIT 1;