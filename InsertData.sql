USE Reservations_data;
DELIMITER //

CREATE PROCEDURE insert_all_data()
BEGIN
INSERT INTO Roles (role_id, name_role) VALUES
(1, 'Admin'),
(2, 'Client');

INSERT INTO Subscription (sub_id, sub_type) VALUES
(1, 'Básic'),
(2, 'Premium'),
(3, 'VIP');

INSERT INTO Pay_method (pay_id, pay_type) VALUES
(1, 'Tarjeta de Crédito'),
(2, 'Transferencia Bancaria'),
(3, 'Efectivo');

INSERT INTO Type_room (type_id, category, capacity, cost_per_night) VALUES
(1, 'Estándar', 2, 100),
(2, 'Doble', 4, 150),
(3, 'Suite', 2, 300);

INSERT INTO Users (user_id, role_id, sub_id, pay_id, first_name, middle_name, last_name, email, birth_date) VALUES
(845672, 1, 1, 1, 'Ana', 'Maria', 'Gonzalez', 'gonzalez@example.com', '1985-04-12'),
(193847, 2, 2, 2, 'Luis', 'Fernando', 'Pérez', 'perez@example.com', '1990-06-22'),
(560321, 1, 1, 3, 'Marta', 'Isabel', 'Martínez', 'martinez@example.com', '1978-08-30'),
(780245, 2, 2, 1, 'Carlos', 'Andrés', 'Ramírez', 'ramirez@example.com', '1982-11-17'),
(439287, 1, 1, 2, 'Lucía', 'Fernández', 'Hernández', 'hernandez@example.com', '1995-12-05'),
(612394, 2, 3, 3, 'Jorge', 'Alberto', 'García', 'garcia@example.com', '1988-03-23'),
(284756, 1, 1, 1, 'Valeria', 'Diana', 'Pinto', 'pinto@example.com', '1991-09-14'),
(957203, 2, 2, 2, 'Andrés', 'Felipe', 'Suárez', 'suarez@example.com', '1983-07-19'),
(103684, 1, 3, 3, 'Natalia', 'María', 'Gómez', 'gomez@example.com', '1994-02-28'),
(674921, 2, 1, 1, 'Ricardo', 'Alejandro', 'Rodríguez', 'rodriguez@example.com', '1979-10-09');

INSERT INTO Hotels (hotel_id, hotel_name, location, rooms_number, calification_hotel) VALUES
(1, 'Hotel Plaza', 'San Jose', 10, 5),
(2, 'Hotel Central', 'Alajuela', 20, 5),
(3, 'Hotel Riviera', 'Puntarenas', 10, 5),
(4, 'Hotel Boutique', 'Heredia', 50, 5),
(5, 'Hotel Del Mar', 'Guanacaste', 30, 5);

INSERT INTO Rooms (room_id, room_number, hotel_id, type_id, occupied) VALUES
(1, 101, 1, 1, FALSE),
(2, 102, 1, 2, FALSE),
(3, 103, 1, 1, FALSE),
(4, 104, 1, 2, FALSE),
(5, 105, 1, 1, FALSE),
(6, 106, 1, 3, FALSE),
(7, 107, 1, 1, FALSE),
(8, 108, 1, 2, FALSE),
(9, 109, 1, 3, FALSE),
(10, 110, 1, 1, FALSE),
(11, 201, 2, 1, FALSE),
(12, 202, 2, 2, FALSE),
(13, 203, 2, 1, FALSE),
(14, 204, 2, 3, FALSE),
(15, 205, 2, 2, FALSE),
(16, 206, 2, 3, FALSE),
(17, 207, 2, 1, FALSE),
(18, 208, 2, 2, FALSE),
(19, 209, 2, 3, FALSE),
(20, 210, 2, 1, FALSE),
(21, 211, 2, 1, FALSE),
(22, 212, 2, 2, FALSE),
(23, 213, 2, 1, FALSE),
(24, 214, 2, 3, FALSE),
(25, 215, 2, 2, FALSE),
(26, 216, 2, 3, FALSE),
(27, 217, 2, 1, FALSE),
(28, 218, 2, 2, FALSE),
(29, 219, 2, 3, FALSE),
(30, 220, 2, 1, FALSE),
(31, 301, 3, 1, FALSE),
(32, 302, 3, 2, FALSE),
(33, 303, 3, 1, FALSE),
(34, 304, 3, 3, FALSE),
(35, 305, 3, 2, FALSE),
(36, 306, 3, 3, FALSE),
(37, 307, 3, 1, FALSE),
(38, 308, 3, 2, FALSE),
(39, 309, 3, 3, FALSE),
(40, 310, 3, 1, FALSE),
(41, 401, 4, 1, FALSE),
(42, 402, 4, 2, FALSE),
(43, 403, 4, 1, FALSE),
(44, 404, 4, 3, FALSE),
(45, 405, 4, 2, FALSE),
(46, 406, 4, 3, FALSE),
(47, 407, 4, 1, FALSE),
(48, 408, 4, 2, FALSE),
(49, 409, 4, 3, FALSE),
(50, 410, 4, 1, FALSE),
(51, 411, 4, 1, FALSE),
(52, 412, 4, 2, FALSE),
(53, 413, 4, 1, FALSE),
(54, 414, 4, 3, FALSE),
(55, 415, 4, 2, FALSE),
(56, 416, 4, 3, FALSE),
(57, 417, 4, 1, FALSE),
(58, 418, 4, 2, FALSE),
(59, 419, 4, 3, FALSE),
(60, 420, 4, 1, FALSE),
(61, 421, 4, 1, FALSE),
(62, 422, 4, 2, FALSE),
(63, 423, 4, 1, FALSE),
(64, 424, 4, 3, FALSE),
(65, 425, 4, 2, FALSE),
(66, 426, 4, 3, FALSE),
(67, 427, 4, 1, FALSE),
(68, 428, 4, 2, FALSE),
(69, 429, 4, 3, FALSE),
(70, 430, 4, 1, FALSE),
(71, 431, 4, 1, FALSE),
(72, 432, 4, 2, FALSE),
(73, 433, 4, 1, FALSE),
(74, 434, 4, 3, FALSE),
(75, 435, 4, 2, FALSE),
(76, 436, 4, 3, FALSE),
(77, 437, 4, 1, FALSE),
(78, 438, 4, 2, FALSE),
(79, 439, 4, 3, FALSE),
(80, 440, 4, 1, FALSE),
(81, 441, 4, 1, FALSE),
(82, 442, 4, 2, FALSE),
(83, 443, 4, 1, FALSE),
(84, 444, 4, 3, FALSE),
(85, 445, 4, 2, FALSE),
(86, 446, 4, 3, FALSE),
(87, 447, 4, 1, FALSE),
(88, 448, 4, 2, FALSE),
(89, 449, 4, 3, FALSE),
(90, 450, 4, 1, FALSE),
(91, 501, 5, 1, FALSE),
(92, 502, 5, 2, FALSE),
(93, 503, 5, 1, FALSE),
(94, 504, 5, 3, FALSE),
(95, 505, 5, 2, FALSE),
(96, 506, 5, 3, FALSE),
(97, 507, 5, 1, FALSE),
(98, 508, 5, 2, FALSE),
(99, 509, 5, 3, FALSE),
(100, 510, 5, 1, FALSE),
(101, 511, 5, 1, FALSE),
(102, 512, 5, 2, FALSE),
(103, 513, 5, 1, FALSE),
(104, 514, 5, 3, FALSE),
(105, 515, 5, 2, FALSE),
(106, 516, 5, 3, FALSE),
(107, 517, 5, 1, FALSE),
(108, 518, 5, 2, FALSE),
(109, 519, 5, 3, FALSE),
(110, 520, 5, 1, FALSE),
(111, 521, 5, 1, FALSE),
(112, 522, 5, 2, FALSE),
(113, 523, 5, 1, FALSE),
(114, 524, 5, 3, FALSE),
(115, 525, 5, 2, FALSE),
(116, 526, 5, 3, FALSE),
(117, 527, 5, 1, FALSE),
(118, 528, 5, 2, FALSE),
(119, 529, 5, 3, FALSE),
(120, 530, 5, 1, FALSE);

INSERT INTO Reservation_state(reservation_state_id, reservation_state_name) VALUES
(1,'active'),
(2,'inactive'),
(3,'cancelle');

INSERT INTO Reservations (user_id, reservation_date, check_in_date, check_out_date, number_visitors, total_price) VALUES
(845672,'2024-08-25', '2024-09-01', '2024-09-05', 2, 500),
(193847,'2024-09-01', '2024-09-10', '2024-09-12', 1, 200),
(560321, '2024-09-15', '2024-10-01', '2024-10-10', 4, 1200),
(780245, '2024-10-20', '2024-11-15', '2024-11-20', 3, 700),
(439287,'2024-11-15', '2024-12-01', '2024-12-07', 2, 600),
(612394, '2024-07-25', '2024-07-26', '2024-07-29', 2, 550),
(284756, '2024-07-24', '2024-07-26', '2024-07-29', 1, 300),
(957203, '2024-07-23', '2024-07-26', '2024-07-29', 2, 400),
(103684, '2024-12-01', '2024-12-15', '2024-12-20', 4, 1000),
(674921, '2024-12-15', '2024-12-25', '2024-12-30', 2, 450);

INSERT INTO Room_reservation (reservation_id, room_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(3, 5),
(4, 6),
(4, 7),
(5, 8),
(6, 9),
(7, 10);

END//
DELIMITER;

CALL insert_all_data();




