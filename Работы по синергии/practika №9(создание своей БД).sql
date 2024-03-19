DROP DATABASE IF EXISTS Salon;
CREATE DATABASE IF NOT EXISTS Salon;
use Salon;
CREATE TABLE IF NOT EXISTS Salon (
    ID_salon INT PRIMARY KEY,
    Name VARCHAR(100) not null,
    Schedule VARCHAR(100) not null,
    Address VARCHAR(100) not null,
    Phone_number VARCHAR(15) not null
);

CREATE TABLE IF NOT EXISTS Master (
    ID_master INT PRIMARY KEY,
    Name VARCHAR(50) not null,
    Specialization VARCHAR(50) not null,
    ID_salon INT
);

CREATE TABLE IF NOT EXISTS Client (
    ID_Client INT PRIMARY KEY,
    Name VARCHAR(50) not null,
    Phone_number VARCHAR(15) not null
);

CREATE TABLE IF NOT EXISTS Session (
    ID_session INT PRIMARY KEY,
    Date_Time DATETIME,
    ID_master INT not null,
    ID_client INT not null,
    FOREIGN KEY (ID_master) REFERENCES Master(ID_master),
    FOREIGN KEY (ID_client) REFERENCES Client(ID_client)
);

CREATE TABLE IF NOT EXISTS Equipment (
    ID_equipment INT PRIMARY KEY,
    Name VARCHAR(50) not null,
    Quantity INT ,
    ID_salon INT,
    FOREIGN KEY (ID_salon) REFERENCES Salon(ID_salon)
);

CREATE TABLE IF NOT EXISTS Reviews(
    ID_review INT PRIMARY KEY,
    Review TEXT,
    Rating INT,
    ID_client INT,
    FOREIGN KEY (ID_client) REFERENCES Client(ID_client)
);




INSERT INTO Salon (ID_salon, Name, Schedule, Address, Phone_number) VALUES
(1, 'Салон красоты 1', '9:00 - 19:00', 'Адрес 1', '+7 123 456 7890'),
(2, 'Салон красоты 2', '8:00 - 18:00', 'Адрес 2', '+7 098 765 4321');

INSERT INTO Master (ID_master, Name, Specialization, ID_salon) VALUES
(1, 'Мастер 1', 'Маникюр', 1),
(2, 'Мастер 2', 'Педикюр', 2);

INSERT INTO Client (ID_client, Name, Phone_number) VALUES
(1, 'Клиент 1', '+7 111 222 3333'),
(2, 'Клиент 2', '+7 444 555 6666');

INSERT INTO Session (ID_session, Date_Time, ID_master, ID_client) VALUES
(1, '2023-11-01 10:00:00', 1, 1),
(2, '2023-11-01 14:00:00', 2, 2);

INSERT INTO Equipment (ID_equipment, Name, Quantity, ID_salon) VALUES
(1, 'Оборудование 1', 5, 1),
(2, 'Оборудование 2', 3, 2);

INSERT INTO Reviews (ID_review, Review, Rating, ID_client) VALUES
(1, 'ВАУ!', 5, 1),
(2, 'Приветливые работники!', 3, 2);

-- Добавим ссылку на таблицу
alter table Master
add constraint master_fk
foreign key (ID_salon) references Salon(ID_salon);