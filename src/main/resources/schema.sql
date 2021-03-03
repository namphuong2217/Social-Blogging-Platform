--DROP DATABASE IF EXISTS socialbloggingdb;
--CREATE DATABASE socialbloggingdb;
CREATE SEQUENCE IF NOT EXISTS hibernate_sequence START 99;
CREATE SEQUENCE IF NOT EXISTS user_seq;
CREATE SEQUENCE IF NOT EXISTS post_seq;
CREATE SEQUENCE IF NOT EXISTS community_seq;
CREATE SEQUENCE IF NOT EXISTS refresh_token_seq;
CREATE TABLE IF NOT EXISTS my_user (

user_id BIGINT NOT NULL DEFAULT nextval('user_seq') PRIMARY KEY,
email VARCHAR(100) NOT NULL UNIQUE,
username VARCHAR(100) NOT NULL,
password VARCHAR(100) NOT NULL,
created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
enabled BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS community (

community_id BIGINT NOT NULL DEFAULT nextval('community_seq') PRIMARY KEY,
community_name VARCHAR(100) NOT NULL,
description VARCHAR(255),
user_id BIGINT NOT NULL REFERENCES my_user,
created_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS post (

post_id BIGINT NOT NULL DEFAULT nextval('post_seq') PRIMARY KEY,
post_name VARCHAR(100) NOT NULL,
url VARCHAR(100) NOT NULL,
description VARCHAR(255),
vote_count INT NOT NULL DEFAULT 9,
user_id BIGINT NOT NULL REFERENCES my_user,
community_id BIGINT NOT NULL REFERENCES community,
created_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS refresh_token (
id BIGINT NOT NULL DEFAULT nextval('refresh_token_seq') PRIMARY KEY,
token VARCHAR(255) NOT NULL,
created_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);