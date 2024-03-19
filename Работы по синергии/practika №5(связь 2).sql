drop database if exists vk;
create database if not exists vk;
use vk;
create table if not exists users(
 id int PRIMARY KEY AUTO_INCREMENT,
 username varchar(30),
 password_hash varchar(300),
 last_seen datetime
);
create table if not exists chats(
 id int PRIMARY KEY AUTO_INCREMENT,
 title varchar(50),
 description varchar(200),
 owner_id int,
 FOREIGN KEY (owner_id) REFERENCES users(id)
);
create table if not exists users_to_chats(
user_id int,
chat_id int,
PRIMARY KEY(user_id, chat_id),
enter_datatime DATETIME,
FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (chat_id) REFERENCES chats(id)
);
insert into users(username) values
('user 1'),
('user 2'),
('user 3');
insert into chats(title,description,owner_id ) values
('chat 1', 'for car lovers',1),
('chat 2','anime is the best kino',2),
('chat 3','',3);
insert into users_to_chats values
(1,1,'2022-01-01 00:00:15'),
(1,2,'2022-01-01 00:03:07'),
(1,3,'2022-01-05 10:03:47'),
(2,1,'2022-01-01 00:00:15'),
(2,3,'2022-01-03 17:56:37'),
(3,1,'2022-01-06 18:19:43'),
(3,2,'2022-01-05 12:19:57');
select u.username, c.title,utc.user_id as userid, utc.chat_id as chatid from users as u, chats as c, users_to_chats as utc
where u.id=utc.user_id and utc.chat_id=c.id and u.username='user 1'
order by c.description DESC;
select u.username, c.title,utc.user_id as userid, utc.chat_id as chatid from users as u, chats as c, users_to_chats as utc
where u.id=utc.user_id and utc.chat_id=c.id and u.username='user 2'
order by c.description DESC;
select u.username, c.title,utc.user_id as userid, utc.chat_id as chatid from users as u, chats as c, users_to_chats as utc
where u.id=utc.user_id and utc.chat_id=c.id and u.username='user 3'
order by c.description DESC;

select u.username, c.title,c.description, utc.enter_datatime as datatime from users as u, chats as c, users_to_chats as utc
where u.id=utc.user_id and utc.chat_id=c.id and u.username='user 1'
order by datatime;
select u.username, c.title,c.description, utc.enter_datatime as datatime from users as u, chats as c, users_to_chats as utc
where u.id=utc.user_id and utc.chat_id=c.id and u.username='user 2'
order by datatime;
select u.username, c.title,c.description, utc.enter_datatime as datatime from users as u, chats as c, users_to_chats as utc
where u.id=utc.user_id and utc.chat_id=c.id and u.username='user 3'
order by datatime;

select u.username, c.title, c.description, utc. *
from users AS u, chats AS c, users_to_chats AS utc
where u.username = 'user 1' = utc.user_id AND c.description = 'for car lovers' 
ORDER BY utc.enter_datatime ASC limit 1;

select u.username, c.title, c.description, utc. *
from users AS u, chats AS c, users_to_chats AS utc
where u.username = 'user 2' and utc.chat_id=2 AND c.description = 'anime is the best kino' 
ORDER BY utc.enter_datatime limit 1;

select u.username, c.title, c.description, utc. *
from users AS u, chats AS c, users_to_chats AS utc
where u.username = 'user 3' and  utc.chat_id=3 AND c.description = '' 
ORDER BY utc.enter_datatime limit 1;

