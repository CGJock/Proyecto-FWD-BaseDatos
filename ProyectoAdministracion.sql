CREATE DATABASE Reservations_data 
    DEFAULT CHARACTER SET = 'utf8mb4';

USE Reservations_data;

CREATE TABLE Roles(
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    name_role VARCHAR(25)
);

CREATE TABLE Subscription(
    sub_id INT PRIMARY KEY AUTO_INCREMENT,
    sub_type VARCHAR(25)
);

CREATE Table Pay_method(
    pay_id INT PRIMARY KEY AUTO_INCREMENT,
    pay_type VARCHAR(25)
);

CREATE TABLE Users(
    user_id INT,
    role_id INT ,
    sub_id  INT ,
    pay_id INT,
    first_name VARCHAR(25),
    middle_name VARCHAR(25),
    last_name VARCHAR(25),
    email VARCHAR(25) UNIQUE,
    birth_date DATE,
    PRIMARY KEY(user_id),
    FOREIGN KEY(role_id) INT REFERENCES Roles(role_id),
    FOREIGN KEY (sub_id)  INT REFERENCES Subcription(sub_id),
    FOREIGN KEY(pay_id) INT REFERENCES Pay_method(pay_id)
);

CREATE TABLE Hotels(
    hotel_id INT AUTO_INCREMENT,
    hotel_name VARCHAR(25),
    location VARCHAR(25),
    rooms_number INT,
    PRIMARY KEY(hotel_id)
)

