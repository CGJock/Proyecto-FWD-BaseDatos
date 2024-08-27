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
