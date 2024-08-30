USE Reservations_data;

--============================================== actualizar estado habitacion =====================================================
CREATE TRIGGER actualizar_estado_habitacion
AFTER INSERT ON Room_reservation
FOR EACH ROW
BEGIN
    UPDATE Rooms
    SET occupied = TRUE
    WHERE room_id = NEW.room_id;
END;

--============================================== actualizar estado habitacion libre =====================================================
CREATE TRIGGER actualizar_estado_habitacion_libre
AFTER DELETE ON Room_reservation
FOR EACH ROW
BEGIN
    UPDATE Rooms
    SET occupied = TRUE
    WHERE room_id = OLD.room_id;
END;

--============================================== Precio total reserva =====================================================

DELIMITER //
CREATE TRIGGER Precio_total_reserva
AFTER INSERT ON room_reservation
FOR EACH ROW
BEGIN
    DECLARE costo_total DECIMAL(10,2);
    DECLARE Noches INT;

    SELECT DATEDIFF(reservations.check_out_date, reservations.check_in_date)
    INTO Noches
    FROM reservations 
    WHERE reservations.reservation_id = NEW.reservation_id;

    SELECT SUM(type_room.cost_per_night * Noches)
    INTO costo_total
    FROM rooms
    JOIN type_room ON rooms.type_id = type_room.type_id
    JOIN room_reservation ON rooms.room_id = room_reservation.room_id
    WHERE room_reservation.reservation_id = NEW.reservation_id;

    UPDATE reservations
    SET total_price = costo_total
    WHERE reservation_id = NEW.reservation_id;
END//
DELIMITER ;

--============================================== Limitar fechas de reserva al actualizar =====================================================

DELIMITER //
CREATE TRIGGER Limitar_fechas_de_reserva_al_actualizar
BEFORE UPDATE ON reservations
FOR EACH ROW
BEGIN
    DECLARE MESSAGE_TEXT TEXT;
    IF NEW.reservation_date <= CURDATE() OR NEW.check_in_date <= CURDATE() OR NEW.check_out_date <= CURDATE() THEN
        SET MESSAGE_TEXT = 'La fecha de la reserva debe ser mayor o igual a la fecha actual';
    END IF;
END//
DELIMITER;

--============================================== Limitar fechas de reserva =====================================================

DELIMITER//
CREATE TRIGGER Limitar_fechas_de_reserva
BEFORE INSERT ON reservations
FOR EACH ROW
BEGIN
    DECLARE MESSAGE_TEXT TEXT;
    IF NEW.reservation_date <= CURDATE() OR NEW.check_in_date <= CURDATE() OR NEW.check_out_date <= CURDATE() THEN
        SET MESSAGE_TEXT = 'La fecha de la reserva debe ser mayor o igual a la fecha actual';
    END IF;
END;
DELIMITER;

--============================================== editar room reservation =====================================================

DELIMITER//
CREATE TRIGGER editar_room_reservation
BEFORE UPDATE ON reservations
FOR EACH ROW
BEGIN
    IF NEW.reservation_state_id = 3 THEN
        DELETE FROM room_reservation WHERE reservation_id = NEW.reservation_id;
    END IF;
END;
DELIMITER;


DROP TRIGGER Limitar_fechas_de_reserva;
