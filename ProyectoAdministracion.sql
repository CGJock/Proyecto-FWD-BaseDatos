CREATE DATABASE Reservations_data 
    DEFAULT CHARACTER SET = 'utf8mb4';

USE Reservations_data;

CREATE TABLE Roles(
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    name_role VARCHAR(25) NOT NULL UNIQUE
);

CREATE TABLE Subscription(
    sub_id INT PRIMARY KEY AUTO_INCREMENT,
    sub_type VARCHAR(25) NOT NULL UNIQUE
);

CREATE Table Pay_method(
    pay_id INT PRIMARY KEY AUTO_INCREMENT,
    pay_type VARCHAR(25) NOT NULL UNIQUE
);

CREATE TABLE Users(
    user_id INT NOT NULL,
    role_id INT NOT NULL,
    sub_id  INT NOT NULL,
    pay_id INT NOT NULL,
    first_name VARCHAR(25),
    middle_name VARCHAR(25),
    last_name VARCHAR(25),
    email VARCHAR(25) CHECK(email LIKE '%@%.%') UNIQUE,
    birth_date DATE,
    PRIMARY KEY(user_id),
    FOREIGN KEY(role_id)  REFERENCES Roles(role_id) ON DELETE CASCADE,
    FOREIGN KEY (sub_id)  REFERENCES Subscription(sub_id) ON DELETE CASCADE,
    FOREIGN KEY(pay_id) REFERENCES Pay_method(pay_id) ON DELETE CASCADE
);


CREATE TABLE Hotels(
    hotel_id INT AUTO_INCREMENT,
    hotel_name VARCHAR(25) NOT NULL,
    location VARCHAR(25) NOT NULL,
    rooms_number INT CHECK(rooms_number > 0) NOT NULL,
    calification_hotel INT CHECK (calification_hotel >= 0 AND calification_hotel <= 5),
    PRIMARY KEY(hotel_id)
)


CREATE TABLE Feedback_user(
    feed_id INT,
    user_id INT NOT NULL,
    hotel_id INT NOT NULL,
    message VARCHAR(100),
    calification_feedback INT CHECK(calification_feedback >= 0 AND calification_feedback <= 5) NOT NULL,
    PRIMARY KEY(feed_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY(hotel_id) REFERENCES hotels(hotel_id) ON DELETE CASCADE
)

CREATE TABLE Type_room(
    type_id INT AUTO_INCREMENT,
    category VARCHAR(25) NOT NULL,
    capacity INT CHECK(capacity > 0) NOT NULL,
    cost_per_night INT CHECK(cost_per_night >= 0)NOT NULL,
    PRIMARY KEY(type_id)
)

CREATE TABLE Rooms(
    room_id INT,
    room_number INT NOT NULL,
    hotel_id INT NOT NULL,
    type_id INT NOT NULL,
    occupied BOOLEAN DEFAULT FALSE,
    PRIMARY KEY(room_id),
    FOREIGN KEY(hotel_id) REFERENCES Hotels(hotel_id) ON DELETE CASCADE,
    FOREIGN key(type_id) REFERENCES Type_room(type_id) ON DELETE CASCADE
)

CREATE Table Reservation_state(
    reservation_state_id INT,
    reservation_state_name VARCHAR(50) NOT NULL,
    PRIMARY KEY(reservation_state_id)
)


CREATE TABLE Reservations(
    reservation_id INT AUTO_INCREMENT,
    user_id INT NOT NULL,
    reservation_state_id INT NOT NULL DEFAULT 1,
    reservation_date DATE NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    number_visitors INT CHECK(number_visitors > 0) NOT NULL,
    total_price INT CHECK(total_price >= 0)  DEFAULT 0,
    PRIMARY KEY(reservation_id),
    FOREIGN KEY(user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY(reservation_state_id) REFERENCES Reservation_state(reservation_state_id) ON DELETE CASCADE
);


CREATE TABLE Room_reservation(
    reservation_id INT NOT NULL,
    room_id INT NOT NULL,
    PRIMARY KEY(reservation_id,room_id),
    FOREIGN KEY(reservation_id) REFERENCES Reservations(reservation_id) ON DELETE CASCADE,
    FOREIGN KEY(room_id) REFERENCES Rooms(room_id) ON DELETE CASCADE
    
);

DROP DATABASE reservations_data;

