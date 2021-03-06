-- 1. What query would you run to get all tweets from the user id of 1?
SELECT * FROM users
LEFT JOIN tweets
ON users.id = tweets.user_id
WHERE users.id = 1;

-- You can just grab the tweets by
SELECT tweets.tweet AS kobe_tweets FROM users
LEFT JOIN tweets
ON users.id = tweets.user_id
WHERE users.id = 1;

-- 2. What query would return all the tweets that the user with id 2 has tagged as favorites?
SELECT CONCAT_WS('  ', users.first_name, users.last_name) AS 'User Name', tweets.tweet FROM users
LEFT JOIN faves
ON users.id = faves.user_id
LEFT JOIN tweets
ON faves.tweet_id = tweets.id
WHERE users.id = 2;

-- 3. What query would you run to get all the tweets that user with id 2, or user with id 1, has tagged as favorites?

SELECT CONCAT_WS('  ', users.first_name, users.last_name) AS 'User Name', tweets.tweet FROM users
LEFT JOIN faves
ON users.id = faves.user_id
LEFT JOIN tweets
ON faves.tweet_id = tweets.id
WHERE users.id = 1 OR users.id = 2;

-- 4. What query would you run to get all the users that are following the user with id 1?
SELECT users.first_name AS followed, users2.first_name AS follower FROM users 
LEFT JOIN follows
ON users.id = follows.followed_id
LEFT JOIN users AS users2
ON users2.id = follows.follower_id
WHERE users.id = 1;

-- 5. What query would you run to get all users that are not following the user with id of 2?
SELECT * FROM users 
WHERE users.id 
NOT IN (SELECT follower_id FROM follows WHERE followed_id = 2) 
AND users.id != 2;

SELECT users.first_name as user, GROUP_CONCAT(' ', users2.first_name) as 'Accounts Following'
FROM users
LEFT JOIN follows
ON users.id = follows.followed_id
LEFT JOIN users as users2
ON users2.id = follows.follower_id
WHERE users.id = 1
GROUP BY users.id;

-- CRUD Create, Review, Update, Delete



-- INSERT (Create)-- 
-- INSERT INTO table_name (column_name1, column_name2) 
-- VALUES('column1_value', 'column2_value');SERT INTO table_name (column_name1, column_name2)  VALUES('c
-- INSERT INTO `users` (`id`, `first_name`, `last_name`, `handle`, `birthday`, `created_at`, `updated_at`) VALUES ('7', 'Mike', 'Like', 'Mike1', '1989-10-05', NOW(),NOW());

-- View All (Review)
-- SELECT * FROM users;

-- UPDATE --
-- UPDATE table_name SET column_name1 = 'some_value', column_name2='another_value' WHERE condition(s)
-- UPDATE `users` SET `updated_at`= NOW() WHERE `id`='6';

-- DELETE
-- DELETE FROM table_name WHERE condition(s)
-- DELETE FROM `users` WHERE `id`='6';
-- DELETE FROM `users` WHERE `id` = '7';



