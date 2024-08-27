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
    IN hotel_id INT
)
BEGIN
    DECLARE number_of_rooms INT;

    SELECT rooms_number INTO number_of_rooms
    FROM hotels
    WHERE hotel_id = hotel_id;

    
    FROM rooms
    JOIN reservations ON rooms.room_id = reservations.room_id
    WHERE reservations.hotel_id = hotel_id
    AND reservations.check_out_date BETWEEN date_start AND date_end;

END//

DELIMITER ;

CALL calculate_hotel_ocupation_by_date('2024-09-01','2024-12-07',1);







