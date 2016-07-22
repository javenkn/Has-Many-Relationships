DROP USER IF EXISTS has_many_user;
-- Create a new postgres user named has_many_user
CREATE USER has_many_user;

DROP DATABASE IF EXISTS has_many_blogs;
-- Create a new database named has_many_blogs owned by has_many_user
CREATE DATABASE has_many_blogs;
ALTER DATABASE has_many_blogs OWNER TO has_many_user;

-- Before each create table statement, add a drop table if exists statement.
-- In has_many_blogs.sql Create the tables (including any PKs, Indexes, and Constraints that you may need) to fulfill
-- the requirements of the has_many_blogs schema below.

\c has_many_blogs;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  username character varying(90) NOT NULL,
  first_name character varying(90) NULL DEFAULT NULL,
  last_name character varying(90) NULL DEFAULT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NOT NULL DEFAULT now()
);

DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
  id SERIAL PRIMARY KEY NOT NULL,
  title character varying(180) NULL DEFAULT NULL,
  url character varying(510) NULL DEFAULT NULL,
  content text NULL DEFAULT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NOT NULL DEFAULT now(),
  user_id INTEGER REFERENCES users(id)
);

DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
  id SERIAL PRIMARY KEY NOT NULL,
  body character varying(510) NULL DEFAULT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NOT NULL DEFAULT now(),
  user_id INTEGER REFERENCES users(id),
  post_id INTEGER REFERENCES posts(id)
);

CREATE INDEX index_for_users
  ON users (first_name, last_name);

CREATE INDEX index_for_posts
  ON posts (title, url, content);

CREATE INDEX index_for_comments
  ON comments (body);

\i scripts/blog_data.sql;