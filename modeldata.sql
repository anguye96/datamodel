DROP DATABASE soccer-leagues;
CREATE DATABASE soccer-leagues;

\c soccer-leagues;

CREATE TABLE teams(
    id PRIMARY KEY REFERENCES results, players, lineups, matches,
    names TEXT UNIQUE NOT NULL,
    city TEXT 
);

CREATE TABLE referees(
    id PRIMARY KEY REFERENCES matches,
    names TEXT NOT NULL
);

CREATE TABLE results(
    id PRIMARY KEY REFERENCES teams, matches,
    team_id NOT NULL REFERENCES teams,
    match_id REFERENCES matches,
    result NOT NULL 
);

CREATE TABLE players(
    id PRIMARY KEY REFERENCES lineups,
    names TEXT NOT NULL,
    birthday INTEGER,
    height INTEGER,
    current_team_id REFERENCES teams
);

CREATE TABLE matches(
    id PRIMARY KEY REFERENCES results,
    home_team_id REFERENCES teams,
    away_team_id REFERENCES teams,
    locations TEXT,
    dates TIMESTAMP,
    start_time INTEGER,
    season_id REFERENCES referees,
    head_referee_id REFERENCES referees,
    assistent_referee_1_id REFERENCES referees,
    assistent_referee_2_id REFERENCES referees,

);

CREATE TABLE goals(
    id PRIMARY KEY ,
    player_id REFERENCES players,
    match_id REFERENCES matches,
);

CREATE TABLE lineups(
    id PRIMARY KEY,
    player_id REFERENCES teams,
    match_id REFERENCES teams,
    team_id REFERENCES teams

);

CREATE TABLE season (
    id PRIMARY KEY REFERENCES matches,
    start_date TIMESTAMP,
    end_date TIMESTAMP
);


DROP DATABASE craigslist;
CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE regions (
    id PRIMARY KEY REFERENCES posts,
    names NOT NULL UNIQUE
);

CREATE TABLE posts (
    id PRIMARY KEY,
    title TEXT NOT NULL,
    texts TEXT,
    location TEXT,
    user_id REFERENCES users,
    region_id REFERENCES regions,
    category_id REFERENCES categories
);

CREATE TABLE USERS (
    id PRIMARY KEY REFERENCES posts,
    username TEXT UNIQUE NOT NULL
    encrypted_password UNIQUE NOT NULL
    preferred_region_id REFERENCES regions
);

CREATE TABLE categories (
    if PRIMARY KEY REFERENCES posts,
    names TEXT NOT NULL
);

DROP DATABASE medical_center;
CREATE DATABASE medical_center;

\c medical_center;

CREATE TABLE doctors(
    id SERIAL PRIMARY KEY,
    doctor_name NOT NULL UNIQUE,
    specialty NOT NULL
);

CREATE TABLE visits(
    doctor_id SERIAL PRIMARY KEY REFERENCES doctors,
    patient_id NOT NULL UNIQUE REFERENCES patients,
    date_id  TIMESTAMP
);

CREATE TABLE patients(
    id SERIAL PRIMARY KEY REFERENCES visits,
    name NOT NULL 
    insurance TEXT
    birthday INTEGER
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY REFERENCES diagnoses,
    names NOT NULL TEXT
    descriptions TEXT
);