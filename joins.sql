\c has_many_blogs;

-- Create a query to get all fields from the users table
SELECT *
  FROM users;

-- Create a query to get all fields from the posts table where the user_id is 100
SELECT *
  FROM posts
  WHERE user_id = '100';

-- Create a query to get all posts fields, the user's first name, and the user's
-- last name, from the posts table where the user's id is 200
SELECT posts.*, users.first_name, users.last_name
  FROM posts
  INNER JOIN users ON posts.user_id = users.id
  WHERE posts.user_id = 200;

-- Create a query to get all posts fields, and the user's username, from the
-- posts table where the user's first name is 'Norene' and the user's
-- last_name is 'Schmitt'
SELECT posts.*, users.username
  FROM posts
  INNER JOIN users ON posts.user_id = users.id
  WHERE users.first_name = 'Norene'
  AND users.last_name = 'Schmitt';

-- Create a query to get usernames from the users table where the user
-- has created a post after January 1, 2015
