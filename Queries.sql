USE Reservations_data;

SELECT 
    hotels.hotel_name,
    rooms.room_number,
    rooms.hotel_id,
    reservations.check_out_date
FROM 
    rooms
JOIN 
    room_reservation ON rooms.room_id = room_reservation.room_id
JOIN 
    reservations ON room_reservation.reservation_id = reservations.reservation_id
JOIN
    hotels ON rooms.hotel_id = hotels.hotel_id 
WHERE 
    reservations.check_out_date > CURRENT_DATE AND rooms.hotel_id = 1;

--1 Consulta para obtener los hoteles con mayor número de reservas.
SELECT hotels.hotel_name,COUNT(rooms.hotel_id) AS total_reservaciones
FROM rooms
JOIN room_reservation ON rooms.room_id = room_reservation.room_id
JOIN reservations ON room_reservation.reservation_id = reservations.reservation_id
JOIN hotels ON rooms.hotel_id = hotels.hotel_id 
GROUP BY hotels.hotel_name
ORDER BY total_reservaciones DESC

--2 Consulta para contar cuántas habitaciones disponibles hay en un hotel específico en una fecha dada.
SELECT hotels.hotel_name,COUNT(rooms.hotel_id) AS Habitaciones_disponibles
FROM rooms
JOIN room_reservation ON rooms.room_id = room_reservation.room_id
JOIN reservations ON room_reservation.reservation_id = reservations.reservation_id
JOIN hotels ON rooms.hotel_id = hotels.hotel_id 
WHERE "2024-08-01" NOT BETWEEN reservations.check_in_date  AND reservations.check_out_date AND rooms.hotel_id = 1;

--3 Consulta para buscar hoteles por nombre.
SELECT hotel_name,location,rooms_number
FROM hotels
WHERE hotel_name = "Hotel Plaza"

--4 Consulta para buscar hoteles cuya ubicación comienza con un texto específico
SELECT hotel_name,location,rooms_number
FROM hotels
WHERE location LIKE  'a%'

--5 Consulta para buscar hoteles cuya ubicación termina con un texto específico.
SELECT hotel_name,location,rooms_number
FROM hotels
WHERE location LIKE  '%a'

--6 Consulta para obtener las reservas de un cliente (por email) realizadas en el mes anterior.
SELECT reservation_id
FROM reservations
JOIN users ON reservations.user_id = users.user_id
WHERE
users.email = "martinez@example.com"
AND MONTH(reservations.reservation_date) = MONTH(DATE_SUB(CURDATE(),INTERVAL 1 MONTH));

--7 Consulta para calcular el promedio de reservas diarias en un hotel
SELECT reservations.reservation_id AS total_reservations,
COUNT(DISTINCT reservations.reservation_id)
FROM room_reservation
JOIN reservations ON room_reservation.reservation_id = reservations.reservation_id
WHERE reservations.reservation_date = '2024-08-25'
GROUP BY reservations.reservation_id

--8 Consulta para identificar el hotel con la mayor ocupación en el mes anterior.
SELECT hotels.hotel_name, COUNT(room_reservation.room_id) AS total_occupancy
FROM rooms
JOIN room_reservation ON room_reservation.room_id = rooms.room_id
JOIN reservations ON room_reservation.reservation_id = reservations.reservation_id
JOIN hotels ON hotels.hotel_id = rooms.hotel_id
WHERE reservations.reservation_date BETWEEN DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), '%Y-%m-01') AND LAST_DAY(DATE_SUB(CURDATE(), INTERVAL 1 MONTH))
GROUP BY hotels.hotel_id
ORDER BY total_occupancy DESC
LIMIT 1;

--9 Consulta para listar los hoteles que tienen habitaciones disponibles pero no han sido reservadas en el último mes.
SELECT DISTINCT hotels.hotel_name
FROM hotels
JOIN rooms ON hotels.hotel_id = rooms.hotel_id
LEFT JOIN room_reservation ON rooms.room_id = room_reservation.room_id
LEFT JOIN reservations ON room_reservation.reservation_id = reservations.reservation_id AND reservations.reservation_date BETWEEN DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), '%Y-%m-01') AND LAST_DAY(DATE_SUB(CURDATE(), INTERVAL 1 MONTH))
WHERE reservations.reservation_id IS NULL;

