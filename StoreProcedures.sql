USE Reservations_data;

--Consultar disponibilidad de una habitacion de acuerdo a una fecha
DELIMITER//

CREATE PROCEDURE consult_room_by_date(
IN room_id INT,
IN check_out_date DATE,
IN check_in_date DATE,
IN actual_date DATE,
OUT check_room BOOL
)
BEGIN 
    DECLARE room_aviavility INT;
    SELECT COUNT(*) INTO room_aviavility
    FROM rooms 
    WHERE (actual_date > check_out_date) 
    AND (actual_date < check_in_date);
    
    IF room_aviavility > 0 THEN
        SET check_room = FALSE;
    ELSE
        SET check_room = TRUE;
    END IF;
    END//
    DELIMITER ;

    CALL consult_room_by_date(1,'2024-06-15','2024-06-20','2024-06-17', @check_room );
    SELECT @check_room


