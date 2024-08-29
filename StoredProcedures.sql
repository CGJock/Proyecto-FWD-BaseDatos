USE Reservations_data;

--Consultar disponibilidad de una habitacion de acuerdo a una fecha
DELIMITER//

CREATE PROCEDURE consult_room_by_date(
IN room_book_id INT,
IN actual_date DATE,
OUT avaliable_room BOOL
)
BEGIN 
    IF EXISTS(
        SELECT 1
        FROM reservations
        JOIN rooms ON rooms.room_id 
        WHERE rooms.room_id = room_id
        AND
        actual_date BETWEEN reservations.check_in_date  AND reservations.check_out_date
    ) THEN
        SET avaliable_room = FALSE;
    ELSE
        SET avaliable_room = TRUE;
    END IF;
    END//
    DELIMITER ;

    CALL consult_room_by_date(4,'2024-10-08', @avaliable_room );
    SELECT @avaliable_room

DELIMITER//

--consultar el promedio de ocupacion del hotel en un rango estimado 
CREATE PROCEDURE calculate_hotel_ocupation_by_date(
    IN date_start DATE,
    IN date_end DATE,
    IN hotel_consult INT,
    OUT result DECIMAL(5,2)
)
BEGIN
    DECLARE number_of_rooms INT;
    DECLARE total_days INT;
    DECLARE occupied_sum INT;
    
    
    SELECT rooms_number INTO number_of_rooms
    FROM hotels
    WHERE hotel_consult = hotel_id;

    
    SET total_days = DATEDIFF(date_end, date_start) + 1;

    
    SELECT COUNT(*) INTO occupied_sum
    FROM reservations
    JOIN room_reservation ON reservations.reservation_id = room_reservation.reservation_id
    JOIN rooms ON room_reservation.room_id = rooms.room_id
    WHERE rooms.occupied = TRUE AND hotel_id = hotel_consult
    AND (reservations.check_in_date <= date_end AND reservations.check_out_date  >= date_start);
    
    
    
    SET result =(occupied_sum/(number_of_rooms*total_days))*100;

END//

DELIMITER ;

CALL calculate_hotel_ocupation_by_date('2024-09-01','2024-12-07', 2,@result);



SELECT @result