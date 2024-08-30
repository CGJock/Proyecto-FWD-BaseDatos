--Se creo este index porque los usuarios pueden hacer muchas consultas al mismo tiempo
--entonces se puede indexar la fila de location para hacelerar esas busquedas
CREATE INDEX idx_hotel_location
ON hotels(location);

drop INDEX idx_hotel_location on hotels

SELECT * FROM hotels USE INDEX (idx_hotel_location)
    WHERE hotels.location = "Puntarenas"

