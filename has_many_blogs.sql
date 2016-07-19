DROP USER IF EXISTS has_many_user;
-- Create a new postgres user named has_many_user
CREATE USER has_many_user;

DROP DATABASE IF EXISTS has_many_blogs;
-- Create a new database named has_many_blogs owned by has_many_user
CREATE DATABASE has_many_blogs;
ALTER DATABASE has_many_blogs OWNER TO has_many_user;

CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  username character varying(90) NOT NULL,
  first_name character varying(90) NULL DEFAULT NULL,
  last_name character varying(90) NULL DEFAULT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NOT NULL DEFAULT now()
)

CREATE TABLE posts (
  id SERIAL PRIMARY KEY NOT NULL,
  title character varying(180) NULL DEFAULT NULL,
  url character varying(510) NULL DEFAULT NULL,
  content text NULL SET DEFAULT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NOT NULL DEFAULT now()
)

CREATE TABLE comments (
  id SERIAL PRIMARY KEY NOT NULL,
  body  character varying(510) NULL DEFAULT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NOT NULL DEFAULT now()
)

\i scripts/blog_data.sql;