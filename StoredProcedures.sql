USE Reservations_data;

--Procedure para consultar disponibilidad de una habitacion de acuerdo a una fecha
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

DELIMITER//

CREATE PROCEDURE add_user(
    IN user_id INT,
    IN role_id INT,
    IN sub_id INT,
    IN pay_id INT,
    IN first_name VARCHAR(30),
    IN middle_name VARCHAR(30),
    IN last_name VARCHAR(30),
    IN email VARCHAR(50),
    IN birth_date DATE,
    OUT message text
)
    BEGIN
        DECLARE actual_role TEXT;
        SELECT  name_role INTO actual_role
        FROM user_list
        WHERE role_id = 1
        LIMIT 1;
        
        IF actual_role = 'Admin' THEN
            INSERT INTO users(user_id,role_id,sub_id,pay_id,first_name,middle_name,last_name,email,birth_date)
            VALUES(user_id,role_id,sub_id,pay_id,first_name,middle_name,last_name,email,birth_date);
            SET message = 'insertado con exito';
        ELSE
            SET message = "Solo admin pueden agregar los admin";
        END IF;
END//

DELIMITER ;

CALL add_user(6999888,1,1,1,"juan",'fernandez','coronado','coronado@example.com','1990-07-01',@message)
      

SELECT @message

drop PROCEDURE add_user

--procedure para insertar una habitacion
DELIMITER//

CREATE PROCEDURE insertar_reservation(
    IN user_id INT,
    IN reservation_state_id INT,
    IN reservation_date DATE,
    IN check_in_date DATE,
    IN check_out_date DATE,
    IN number_visitors INT,
    IN room_id INT
    )
    BEGIN
    DECLARE last_reservation_id INT;

    INSERT INTO reservations(user_id,reservation_state_id,reservation_date,check_in_date,check_out_date,number_visitors)
    VALUES(user_id,reservation_state_id,reservation_date,check_in_date,check_out_date,number_visitors);

    
    SET last_reservation_id = LAST_INSERT_ID();

    INSERT INTO room_reservation(reservation_id,room_id)
    VALUES(last_reservation_id,room_id);
END//

DELIMITER ;

CALL insertar_reservation(6999888,2,'2024-08-29','2024-08-30','2024-09-05',2,5)


DELIMITER//

CREATE PROCEDURE insert_room_procedure(
    IN room_id INT,
    IN room_number INT,
    IN hotel_id INT,
    IN type_id INT,
    IN user_id INT,
    OUT message text
)
    BEGIN
        DECLARE actual_role TEXT;
        SELECT  name_role INTO actual_role
        FROM user_list
        WHERE user_id = user_list.user_id;
        
        IF actual_role = 'Admin' THEN
            INSERT INTO rooms(room_id,room_number,hotel_id,type_id)
            VALUES(room_id,room_number,hotel_id,type_id);
            SET message = 'insertado con exito';
        ELSE
            SET message = "No se puede crear no es admin";
        END IF;
END//

DELIMITER ;

CALL insert_room_procedure(22,200,3,1,2,@message)

SELECT @message






