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

   



