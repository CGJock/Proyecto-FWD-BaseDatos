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
JOIN users ON reserevatons.user_id = users.user_id
WHERE
users.mail = "martinez@example.com"
AND MONTH(reservations.reservation_date) MONTH(DATE_SUB(CURRENT_DATE,INTERVAL 1, MONTH))
AND YEAR(reserations.reservation_date) YEAR(DATE_SUB(CURRENT_DATE, INTERVAL 1, YEAR));

--7 Consulta para calcular el promedio de reservas diarias en un hotel

SELECT reservations.reservation_id AS total_reservations,
COUNT(DISTINCT reservations.reservation_id)
FROM room_reservation
JOIN reservations ON room_reservation.reservation_id = reservations.reservation_id
WHERE reservations.reservation_date = '2024-08-25'
GROUP BY reservations.reservation_id





JOIN room_reservation  ON reservations.reservation_id = room_reservation.reservation_id
JOIN rooms ON reservations.reservation_id = reservations.reservation_id
JOIN hotels ON rooms.hotel_id = hotels.hotel_id


