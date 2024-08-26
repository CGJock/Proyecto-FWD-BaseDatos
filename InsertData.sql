USE Reservations_data;

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
(1, 1, 1, 1, 'Ana', 'Maria', 'Gonzalez', 'gonzalez@example.com', '1985-04-12'),
(2, 2, 2, 2, 'Luis', 'Fernando', 'Pérez', 'perez@example.com', '1990-06-22'),
(3, 1, 1, 3, 'Marta', 'Isabel', 'Martínez', 'martinez@example.com', '1978-08-30'),
(4, 2, 2, 1, 'Carlos', 'Andrés', 'Ramírez', 'ramirez@example.com', '1982-11-17'),
(5, 1, 1, 2, 'Lucía', 'Fernández', 'Hernández', 'hernandez@example.com', '1995-12-05'),
(6, 2, 3, 3, 'Jorge', 'Alberto', 'García', 'garcia@example.com', '1988-03-23'),
(7, 1, 1, 1, 'Valeria', 'Diana', 'Pinto', 'pinto@example.com', '1991-09-14'),
(8, 2, 2, 2, 'Andrés', 'Felipe', 'Suárez', 'suarez@example.com', '1983-07-19'),
(9, 1, 3, 3, 'Natalia', 'María', 'Gómez', 'gomez@example.com', '1994-02-28'),
(10, 2, 1, 1, 'Ricardo', 'Alejandro', 'Rodríguez', 'rodriguez@example.com', '1979-10-09');

INSERT INTO Hotels (hotel_id, hotel_name, location, rooms_number) VALUES
(1, 'Hotel Plaza', 'Ciudad A', 100),
(2, 'Hotel Central', 'Ciudad B', 150),
(3, 'Hotel Riviera', 'Ciudad C', 75),
(4, 'Hotel Boutique', 'Ciudad D', 50),
(5, 'Hotel Del Mar', 'Ciudad E', 120),
(6, 'Hotel Ejecutivo', 'Ciudad F', 200),
(7, 'Hotel Lux', 'Ciudad G', 90),
(8, 'Hotel Nacional', 'Ciudad H', 60),
(9, 'Hotel Vista', 'Ciudad I', 80),
(10, 'Hotel Continental', 'Ciudad J', 110);

INSERT INTO Rooms (room_id, room_number, hotel_id, type_id, occupied) VALUES
(1, 101, 1, 1, FALSE),
(2, 102, 1, 2, FALSE),
(3, 103, 2, 1, FALSE),
(4, 104, 2, 3, FALSE),
(5, 105, 3, 2, FALSE),
(6, 106, 3, 3, FALSE),
(7, 107, 4, 1, FALSE),
(8, 108, 4, 2, FALSE),
(9, 109, 5, 3, FALSE),
(10, 110, 5, 1, FALSE);
