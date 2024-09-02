El proyecto consiste en la creacion de un base de datos para un hotel, se le dio un enfoque como si fuese una aplicacion web, donde administradores pueden crear tareas administrativas y los usuarios regulares crear reservaciones

Se aplicaron la normalizacion de la siguiente manera:

Normalizacion N1:
-Se mantuvieron los datos en columnas serparadaspara mantenerlos indivisibles, esto se hizo por ejemplo en la tabla de user con el datos de check in y check out, que se manejo la informacion en columnas separadas en vez de 
tenerlo en una sola.
-los datos relaccionados se mantienen en tablas separadas como podrian serlo las tablas que refieren a los hoteles y sus habitacones que contien informacion de manera separa pero los relacionan con un id y el mismo caso 
con la tabla users y informacion relacionada a estos como el tipo de usuario y el metodo de pago
-Las tablas tienen una llave primaria en el caso de que la necesiten

Normalizacion N2:
-Se cumplen con las reglas de la primera forma
-Los valores de las tablas dependen de la llave primaria, por ejemplo en users el PK es user_id y este datos es crucial para los demas datos de la tabla ya que nos permite sabes que que usuario se habla, entonces
estan directamente relacionados a esa llave primaria
-En caso de no cumplirse la regla 2 se deberan meter los datos en tablas mas chicas, como lo fue en la tabla reservations donde los datos dependeia totalmente de llaves foraneas entonces se decidio crear una 
subtabla

Normalizacion N3:
-Los datos que no son ni Pk ni Fk solo dependen de la llave primaria, ninguan dato que no tenga relacion con la llave primaria en la tabla que esta se mantiene
-De igual manera no hay valores que no dependan de la llave primaria

El proyecto cuenta con :

StoredProcedures:
-consultar habitacion por fecha
-calcualar la ocupacion del hotel por fecha
-agregar usuarios
-crear reservacion
-registar una habitacion al hotel
-cancelar reservacion

Triggers:
-actualizar el estado de la habitacion
-actualizar el estado de la habitacion libre
-calcular el precio total de una reservacion 
-validacion de las fechas posibles al hacer una reservacion 

Views:
-Se muestran las reservas en el dia actual
-Se ve la lista de todos los usuarios

Idexacion:
-Se creo una indexacion en la localizacion de los hoteles ya que es un dato que podria manejar una gran cantidad de busquedas de parte de los usuarios y seria pertinente optimizar ese proceso

Queries:
-consulta al hotel con el mayor numero de reservas
-habitaciones dispobibles de un hotel en una fecha
-buscar hoteles por nombre
-hoteles cuyo nombre termine con letras especificas
-reservas de un cliente en el mes anterior por mail
-calcular promedio de reservas diarias de un hotel 
-identificar el hotel con mayor numero de ocupaciones la fecha anterior
-listado de hoteles con habitaciones libres que no hayan sido listadas el mes anterior

