DROP TABLE IF EXISTS matches;
CREATE TABLE matches (
    id INT PRIMARY KEY,
    season INT,
    city VARCHAR(100),
    match_date DATE,
    team1 VARCHAR(100),
    team2 VARCHAR(100),
    toss_winner VARCHAR(100),
    toss_decision VARCHAR(10),
    result VARCHAR(20),
    dl_applied SMALLINT,
    winner VARCHAR(100),
    win_by_runs INT,
    win_by_wickets INT,
    player_of_match VARCHAR(100),
    venue VARCHAR(200),
    umpire1 VARCHAR(100),
    umpire2 VARCHAR(100),
    umpire3 VARCHAR(100)
);

DROP TABLE IF EXISTS deliveries;
CREATE TABLE deliveries (
    match_id INT,
    inning INT,
    batting_team VARCHAR(100),
    bowling_team VARCHAR(100),
    over_no INT,
    ball INT,
    batsman VARCHAR(100),
    non_striker VARCHAR(100),
    bowler VARCHAR(100),
    is_super_over INT,
    wide_runs INT,
    bye_runs INT,
    legbye_runs INT,
    noball_runs INT,
    penalty_runs INT,
    batsman_runs INT,
    extra_runs INT,
    total_runs INT,
    player_dismissed VARCHAR(100),
    dismissal_kind VARCHAR(50),
    fielder VARCHAR(100),
    FOREIGN KEY (match_id) REFERENCES matches(id)
);

\copy matches (
    id,
    season,
    city,
    match_date,
    team1,
    team2,
    toss_winner,
    toss_decision,
    result,
    dl_applied,
    winner,
    win_by_runs,
    win_by_wickets,
    player_of_match,
    venue,
    umpire1,
    umpire2,
    umpire3
) FROM './data/matches.csv' WITH (FORMAT csv, HEADER true);

\copy deliveries (
    match_id,
    inning,
    batting_team,
    bowling_team,
    over_no,
    ball,
    batsman,
    non_striker,
    bowler,
    is_super_over,
    wide_runs,
    bye_runs,
    legbye_runs,
    noball_runs,
    penalty_runs,
    batsman_runs,
    extra_runs,
    total_runs,
    player_dismissed,
    dismissal_kind,
    fielder
) FROM './data/deliveries.csv' WITH (FORMAT csv, HEADER true);

