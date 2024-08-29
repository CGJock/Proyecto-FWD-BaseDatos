USE Reservations_data;

CREATE TRIGGER actualizar_estado_habitacion
AFTER INSERT ON Room_reservation
FOR EACH ROW
BEGIN
    UPDATE Rooms
    SET occupied = TRUE
    WHERE room_id = NEW.room_id;
END;

CREATE TRIGGER actualizar_estado_habitacion_libre
AFTER DELETE ON Room_reservation
FOR EACH ROW
BEGIN
    UPDATE Rooms
    SET occupied = TRUE
    WHERE room_id = OLD.room_id;
END;

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

DROP TRIGGER actualizar_estado_habitacion;
