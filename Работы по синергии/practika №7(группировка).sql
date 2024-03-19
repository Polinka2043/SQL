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

CREATE TABLE IF NOT EXISTS float_number (
    id INT PRIMARY KEY AUTO_INCREMENT,
    float_number DECIMAL(10, 4) NOT NULL
);

CREATE TABLE IF NOT EXISTS number (
    id INT PRIMARY KEY AUTO_INCREMENT,
    number DECIMAL(10, 3) NOT NULL
);

INSERT INTO float_number(float_number) VALUES
(-4),
(-2.2558),
(5.567),
(-4.43),
(1.67),
(4),
(-8),
(3.11);

INSERT INTO number(number) VALUES
(4),
(-2),
(5.666),
(-3.43),
(1.69),
(3.5),
(-8),
(3.47);

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

select * from users
join users_to_chats;
select * from users as u
join users_to_chats as utc on u.id = 1 AND utc.user_id = u.id;

select float_number from float_number;

select count(*) from users;
select count(*) from chats;
select count(*) from users_to_chats;

select count(*) from users as u
join users_to_chats as utc on u.id = 1 and utc.user_id = u.id;

select concat(title,'-', owner_id) as 'title-owner_id' from chats;
select concat(user_id,'-', chat_id) as 'user_id - chat_id' from users_to_chats;

select length(username) from users;
select length(id) from users;

select trim(username)as 'trim username' from users;
select trim(title)as 'trim title' from chats;

select substring(username, 5) as 'user number' from users;
select substring(enter_datetime, 12) as 'enter_time' from users_to_chats;

select substring(username, 1,4) as 'user name' from users;
select substring(enter_datetime, 1,10) as 'enter_date' from users_to_chats;

SELECT REVERSE( username) as 'revers user' from users;
SELECT REVERSE( enter_datetime) as 'revers datetime' from users_to_chats;

select lower( username) as 'username' from users;
select lower( description) as 'description' from chats;

select upper( username) as 'username' from users;
select upper( description) as 'description' from chats;
 
SELECT ROUND(float_number, 2) as 'float_number' from float_number;
SELECT ROUND(number, 2) as 'number' from number;

SELECT ROUND(float_number, -2) as 'float_number' from float_number;
SELECT ROUND(number, -2) as 'number' from number;

SELECT TRUNCATE(float_number, 2) as 'float_number' from float_number;
SELECT TRUNCATE(number, 2) as 'number' from number;

SELECT ABS(float_number) as 'float_number' from float_number;
SELECT ABS(number) as 'number' from number;

SELECT FLOOR(float_number) as 'float_number' from float_number;
SELECT FLOOR(number) as 'number' from number;

SELECT CEILING(float_number) as 'float_number' from float_number;
SELECT CEILING(number) as 'number' from number;

SELECT SQRT(POWER(float_number, 2)) as 'float_number' from float_number;
SELECT SQRT(POWER(number, 2)) as 'number' from number;

SELECT SIGN(float_number) as 'float_number' from float_number;
SELECT SIGN(number) as 'number' from number;


SELECT RAND(float_number) as 'float_number' from float_number;
SELECT RAND(number) as 'number' from number;

SELECT NOW(), SYSDATE(), SLEEP(5), NOW(), SYSDATE();
SELECT CURRENT_TIMESTAMP();
SELECT CURRENT_DATE();
SELECT CURDATE();

SELECT CURRENT_TIME();
SELECT CURTIME();

SELECT UTC_DATE();
SELECT UTC_TIME();


SELECT DAYOFMONTH(substring(enter_datetime, 1,10)) as 'enter_datetime' from users_to_chats where user_id = 1 and chat_id= 1;
SELECT DAYOFMONTH(substring(enter_datetime, 1,10)) as 'enter_datetime' from users_to_chats where user_id = 2 and chat_id= 2;

SELECT DAYOFWEEK(substring(enter_datetime, 1,10)) as 'enter_datetime' from users_to_chats where user_id = 1 and chat_id= 1;
SELECT DAYOFWEEK(substring(enter_datetime, 1,10)) as 'enter_datetime' from users_to_chats where user_id = 2 and chat_id= 2;

SELECT DAYOFYEAR(substring(enter_datetime, 1,10)) as 'enter_datetime' from users_to_chats where user_id = 1 and chat_id= 1;
SELECT DAYOFYEAR(substring(enter_datetime, 1,10)) as 'enter_datetime' from users_to_chats where user_id = 2 and chat_id= 2;

SELECT MONTH(substring(enter_datetime, 1,10)) as 'enter_datetime' from users_to_chats where user_id = 1 and chat_id= 1;
SELECT MONTH(substring(enter_datetime, 1,10)) as 'enter_datetime' from users_to_chats where user_id = 2 and chat_id= 2;

SELECT YEAR(substring(enter_datetime, 1,10)) as 'enter_datetime' from users_to_chats where user_id = 1 and chat_id= 1;
SELECT YEAR(substring(enter_datetime, 1,10)) as 'enter_datetime' from users_to_chats where user_id = 2 and chat_id= 2;

SELECT QUARTER(substring(enter_datetime, 1,10)) as 'enter_datetime' from users_to_chats where user_id = 1 and chat_id= 1;
SELECT QUARTER(substring(enter_datetime, 1,10)) as 'enter_datetime' from users_to_chats where user_id = 2 and chat_id= 2;

SELECT WEEK(substring(enter_datetime, 1,10)) as 'enter_datetime' from users_to_chats where user_id = 1 and chat_id= 1;
SELECT WEEK(substring(enter_datetime, 1,10)) as 'enter_datetime' from users_to_chats where user_id = 2 and chat_id= 2;

SELECT LAST_DAY(substring(enter_datetime, 1,10)) as 'enter_datetime' from users_to_chats where user_id = 1 and chat_id= 1;
SELECT LAST_DAY(substring(enter_datetime, 1,10)) as 'enter_datetime' from users_to_chats where user_id = 2 and chat_id= 2;

SELECT DAYNAME(substring(enter_datetime, 1,10)) as 'enter_datetime' from users_to_chats where user_id = 1 and chat_id= 1;
SELECT DAYNAME(substring(enter_datetime, 1,10)) as 'enter_datetime' from users_to_chats where user_id = 2 and chat_id= 2;

SELECT MONTHNAME(substring(enter_datetime, 1,10)) as 'enter_datetime' from users_to_chats where user_id = 1 and chat_id= 1;
SELECT MONTHNAME(substring(enter_datetime, 1,10)) as 'enter_datetime' from users_to_chats where user_id = 2 and chat_id= 2;



SELECT HOUR(substring(enter_datetime, 11,9)) as 'enter_datetime' from users_to_chats where user_id = 1 and chat_id= 1;
SELECT HOUR(substring(enter_datetime, 11,9)) as 'enter_datetime' from users_to_chats where user_id = 2 and chat_id= 2;

SELECT MINUTE(substring(enter_datetime, 11,9)) as 'enter_datetime' from users_to_chats where user_id = 1 and chat_id= 1;
SELECT MINUTE(substring(enter_datetime, 11,9)) as 'enter_datetime' from users_to_chats where user_id = 2 and chat_id= 2;

SELECT SECOND(substring(enter_datetime, 11,9)) as 'enter_datetime' from users_to_chats where user_id = 1 and chat_id= 1;
SELECT SECOND(substring(enter_datetime, 11,9)) as 'enter_datetime' from users_to_chats where user_id = 2 and chat_id= 2;

SELECT DATE_ADD(substring(enter_datetime, 1,10), INTERVAL 1 DAY) as 'enter_datetime' from users_to_chats where user_id = 1 and chat_id= 1;
SELECT DATE_ADD(substring(enter_datetime, 1,10), INTERVAL 1 DAY) as 'enter_datetime' from users_to_chats where user_id = 2 and chat_id= 2;

SELECT DATE_SUB(substring(enter_datetime, 1,10), INTERVAL 4 DAY) as 'enter_datetime' from users_to_chats where user_id = 1 and chat_id= 1;
SELECT DATE_SUB(substring(enter_datetime, 1,10), INTERVAL 4 DAY) as 'enter_datetime' from users_to_chats where user_id = 2 and chat_id= 2;



SELECT (substring(enter_datetime, 1,10)) as 'enter_datetime' from users_to_chats where user_id = 1 and chat_id= 1;
SELECT (substring(enter_datetime, 11,9)) as 'enter_datetime' from users_to_chats where user_id = 2 and chat_id= 2;

SELECT DATEDIFF((substring(enter_datetime, 1,10)) , (substring(enter_datetime, 1,10))  )as 'enter_datetime' from users_to_chats where user_id = 1 and chat_id= 1;
SELECT DATEDIFF((substring(enter_datetime, 1,10)) , (substring(enter_datetime, 1,10))  )as 'enter_datetime' from users_to_chats where user_id = 2 and chat_id= 2;

SELECT DATE_FORMAT(enter_datetime, '%m') as 'enter_datetime' from users_to_chats where user_id = 1 and chat_id= 1;
SELECT DATE_FORMAT(enter_datetime, '%c') as 'enter_datetime' from users_to_chats where user_id = 1 and chat_id= 1;
SELECT TIME_FORMAT(enter_datetime, '%m') as 'enter_datetime' from users_to_chats where user_id = 1 and chat_id= 1;
SELECT TIME_FORMAT(enter_datetime, '%c') as 'enter_datetime' from users_to_chats where user_id = 1 and chat_id= 1;

DROP DATABASE IF EXISTS finances;
CREATE DATABASE IF NOT EXISTS finances;
use finances;

CREATE TABLE IF NOT EXISTS phones (
	id INT PRIMARY KEY AUTO_INCREMENT,
    factory VARCHAR(30),
	title VARCHAR(30),
	price INT
);

INSERT INTO phones(factory,title, price) VALUES
('Apple','Apple iPhone 10', 49999),
('Apple','Apple iPhone 10 Pro', 59500),
('Apple','Apple iPhone 10 Pro Maxi',78999),
('Apple','Apple iPhone 11', 62300),
('Apple','Apple iPhone 11 Pro', 73499),
('Apple','Apple iPhone 11 Pro Max', 88950),
('Samsung','Samsung Galaxy Note 8', 67320),
('Samsung','Samsung Galaxy Note 8 Pro', 75800),
('Samsung','Samsung Galaxy Note 9', 71460),
('Samsung','Samsung Galaxy Note 9 Pro', 79820),
('OnePlus','OnePlus 7', 45670),
('OnePlus','OnePlus 7T', 49000),
('OnePlus','OnePlus 8', 55550),
('OnePlus','OnePlus 9T', 66250),
('Huawei','Huawei P Smart 2019', 17890),
('Honor','Honor 20S',21450), 
('Razor',' Razor Phone', 68900);

SELECT COUNT(*) FROM phones;
SELECT floor(AVG(price)) AS "middle price" FROM phones;
SELECT MAX(price), MIN(price), SUM(price) FROM phones;
SELECT AVG(price), SUM(price) / COUNT(price) FROM phones;

SELECT COUNT(*) FROM phones 
GROUP BY factory;

SELECT COUNT(*), factory FROM phones 
GROUP BY factory;

SELECT COUNT(*), title FROM phones 
GROUP BY factory;

SELECT COUNT(*), CONCAT(factory, '', title) FROM phones 
GROUP BY factory;

select count(*), ROUND (AVG(price), 2) from phones
group by factory;

select factory, count(*) as ' count', ROUND (AVG(price), 2) as avg_price from phones
group by factory;

select factory, count(*) as ' count', ROUND (AVG(price), 2) as avg_price from phones
group by factory
order by factory desc;

select factory, count(*) as ' count', ROUND (AVG(price), 2) as avg_price from phones
where price > 65000
group by factory;

select factory, count(*) as ' count', ROUND (AVG(price), 2) as avg_price from phones
group by factory
having ROUND(AVG(price), 2) >65000;

select factory, title, price from phones
