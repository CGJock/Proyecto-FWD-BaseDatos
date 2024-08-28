USE Reservations_data;

--Crear una vista que muestre un reporte de las reservas realizadas en el día actual.
CREATE VIEW reporte_de_las_reservas_hoy AS
SELECT reservation_id,user_id,total_price
FROM reservations
WHERE check_in_date = CURRENT_DATE

