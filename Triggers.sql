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

DROP TRIGGER actualizar_estado_habitacion;
