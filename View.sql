USE Reservations_data;

--Crear una vista que muestre un reporte de las reservas realizadas en el día actual.
CREATE VIEW reporte_de_las_reservas_hoy AS
SELECT reservation_id,user_id,total_price
FROM reservations
WHERE check_in_date = CURRENT_DATE

--view que lista todos los usuarios con el role
CREATE VIEW user_list AS 
SELECT users.user_id,users.role_id,users.first_name,users.middle_name,roles.name_role
FROM users
JOIN roles ON roles.role_id = users.role_id

