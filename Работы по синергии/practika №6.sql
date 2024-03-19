DROP DATABASE IF EXISTS vk;
CREATE DATABASE IF NOT EXISTS vk;
use vk;
CREATE TABLE IF NOT EXISTS users (
	id INT PRIMARY KEY auto_increment,
    username VARCHAR(30),
    password_hash VARCHAR(300),
    last_seen DATETIME
);
CREATE TABLE IF NOT EXISTS chats (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50),
    description VARCHAR(200),
    owner_id INT,
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS users_to_chats (
    user_id INT,
    chat_id INT,
    PRIMARY KEY (user_id, chat_id),
    enter_datetime DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (chat_id) REFERENCES chats(id)
);

INSERT INTO users(username) VALUES
('user 1'),
('user 2'),
('user 3'),
('user 4'),
('user 5'),
('user 6'),
('user 7'),
('user 8');

INSERT INTO chats(title, description, owner_id) VALUES
('chat  1', 'For car lovers', 1),
('chat  2', 'Anime is the best kino', 2),
('chat  3', '', 4);

INSERT INTO users_to_chats(user_id, chat_id, enter_datetime) VALUES
(1, 1, '2022-01-15 14:56:07'),
(2, 1, '2022-01-15 14:56:07'),
(3, 1, '2022-01-15 14:56:07'),
(4, 1, '2022-01-17 09:34:27'),
(1, 2, '2022-01-16 14:56:07'),
(2, 2, '2022-01-16 14:56:07'),
(4, 2, '2022-01-17 14:56:07'),
(5, 2, '2022-01-18 14:56:07'),
(7, 2, '2022-01-23 13:00:04'),
(8, 2, '2022-01-30 13:09:13'),
(3, 3, '2022-01-25 00:06:54'),
(4, 3, '2022-01-25 00:06:54');

-- 1. Вывести пользователей, которые не являются создателями чатов
SELECT * FROM users
WHERE id NOT IN (SELECT owner_id FROM chats);

-- 2. Вывести пользователей, которых нет ни в одном чате
SELECT * FROM users
WHERE id NOT IN (SELECT user_id FROM users_to_chats);

-- 3. Для каждого пользователя отдельно. 
-- Узнать названия и описание чатов, в которых они находятся. 
-- Упорядочить по названию чата в обратном порядке.
SELECT u.username, c.title, c.description
FROM users AS u
JOIN users_to_chats AS uc ON u.id = uc.user_id
JOIN chats AS c ON uc.chat_id = c.id
ORDER BY c.title DESC;

-- 4. Для каждого пользователя отдельно. 
-- Узнать название и дату вступления в чат, в которых они находятся. 
-- Упорядочить по дате вступления в чат/
SELECT u.username, c.title, uc.enter_datetime
FROM users AS u
JOIN users_to_chats AS uc ON u.id = uc.user_id
JOIN chats AS c ON uc.chat_id = c.id
ORDER BY uc.enter_datetime;
