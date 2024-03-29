DROP DATABASE IF EXISTS the_recruiter;
CREATE DATABASE the_recruiter;

\c the_recruiter

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  username VARCHAR(32),
  password_digest VARCHAR(60),
  player_user BOOLEAN,
  college_user BOOLEAN
);

CREATE TABLE states(
	id SERIAL PRIMARY KEY,
	code VARCHAR(32) NOT NULL,
	name VARCHAR(120) NOT NULL
);

CREATE TABLE colleges(
  id SERIAL PRIMARY KEY,
  name VARCHAR(32),
  school_name VARCHAR(255),
  state_code INTEGER REFERENCES states(id),
  city VARCHAR(255), 
  user_id INTEGER REFERENCES users(id)
);

CREATE TABLE players(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  school_name VARCHAR(255),
  city VARCHAR(255), 
  state_code INTEGER REFERENCES states(id),
  user_id INTEGER REFERENCES users(id)
);

CREATE TABLE positions(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE college_needs(
  id SERIAL PRIMARY KEY,
  college_id INTEGER REFERENCES colleges(id), 
  position_id INTEGER REFERENCES positions(id) 
                                                
 );
 
CREATE TABLE player_positions(
  id SERIAL PRIMARY KEY,
  player_id INTEGER REFERENCES players(id),
  position_id INTEGER REFERENCES positions(id) 
);

CREATE TABLE messages(
  id SERIAL PRIMARY KEY,
  title VARCHAR,
  content VARCHAR,
  user_id INTEGER REFERENCES users(id),
  from_id INTEGER REFERENCES users(id),
  deleted_by_user BOOLEAN,
  count_of_delete INTEGER
  
);

CREATE TABLE replies(
  id SERIAL PRIMARY KEY,
  content VARCHAR,
  message_id INTEGER REFERENCES messages(id),
  user_id INTEGER REFERENCES users(id)
  
);

CREATE TABLE relations(
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  user_id INTEGER REFERENCES users(id),
  other_user_if_college INTEGER REFERENCES colleges(id),
  other_user_if_player INTEGER REFERENCES players(id)
);



