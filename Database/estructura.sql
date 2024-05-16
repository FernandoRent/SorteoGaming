CREATE TABLE usuario (
	id_usuario INT NOT NULL,
    PRIMARY KEY (id_usuario),
    tipo_usuario VARCHAR(16) NOT NULL
);

CREATE TABLE login_usuario (
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    username VARCHAR(16) NOT NULL,
    user_password VARCHAR(16) NOT NULL,
    fechanacimiento DATE NOT NULL,
    user_email VARCHAR(50),
    nombre_usuario VARCHAR(20) NOT NULL,
    apellido_paterno VARCHAR(20) NOT NULL,
    apellido_materno VARCHAR(20) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    telefono_movil VARCHAR(20) NOT NULL,
    fecha_de_registro DATE NOT NULL,
    ultima_conexion DATE NOT NULL
);


CREATE TABLE vidas (
	id_usuario INT NOT NULL,
	FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    id_vidas INT NOT NULL,
    PRIMARY KEY (id_vidas),
    nr_vidas INT NOT NULL
);

CREATE TABLE wallet (
	id_usuario INT NOT NULL,
	FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    id_wallet INT NOT NULL,
    PRIMARY KEY (id_wallet),
    saldo DECIMAL NOT NULL
);

CREATE TABLE transacciones (
	id_transaccion INT NOT NULL,
    PRIMARY KEY (id_transaccion),
    id_wallet INT NOT NULL,
    FOREIGN KEY (id_wallet) REFERENCES wallet(id_wallet),
    id_vidas INT NOT NULL,
    FOREIGN KEY (id_vidas) REFERENCES vidas(id_vidas),
    tipo_transaccion VARCHAR(50) NOT NULL,
    importe DECIMAL NOT NULL,
    cant INT NOT NULL,
    tipo_pago VARCHAR(16),
    producto VARCHAR(16)
);

CREATE TABLE user_puntos (
	id_usuario INT NOT NULL,
	FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    nr_puntos INT NOT NULL
);

CREATE TABLE desafios(
	id_desafio INT NOT NULL,
	PRIMARY KEY (id_desafio),
    description_desafio VARCHAR(50),
    start_date DATETIME,
    end_date DATETIME,
    importe_premio DECIMAL NOT NULL
);

CREATE TABLE user_desafios (
	id_desafio INT NOT NULL,
    FOREIGN KEY (id_desafio) REFERENCES desafios (id_desafio),
	id_usuario INT NOT NULL,
	FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    completed BOOL
);


CREATE TABLE leaderboard (
	id_usuario INT NOT NULL,
	FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    nr_puntos INT NOT NULL,
    FOREIGN KEY(nr_puntos) REFERENCES user_puntos(nr_puntos),
    ranking_position INT NOT NULL
);

CREATE TABLE catalogo (
	id_videojuego int not null,
    nombre_videojuego int not null);

CREATE TABLE game_plinko (
	id_usuario INT NOT NULL,
	FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    start_time DATETIME,
    end_time DATETIME,
    importe INT NOT NULL,
    premio INT NOT NULL
);

CREATE TABLE game_borregovaliente (
	id_usuario INT NOT NULL,
	FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    start_time DATETIME,
    end_time DATETIME,
    importe INT NOT NULL,
    premio INT NOT NULL
);

CREATE TABLE game_conduceygana (
	id_usuario INT NOT NULL,
	FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    start_time DATETIME,
    end_time DATETIME,
	nivel_juego INT,
    id_vidas INT NOT NULL,
    puntos_ganados INT NOT NULL,
    nr_puntos INT NOT NULL,
    FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_vidas) REFERENCES vidas(id_vidas)
);

INSERT INTO usuario (id_usuario, tipo_usuario) VALUES (1, 'Jugador');
INSERT INTO usuario (id_usuario, tipo_usuario) VALUES (2, 'Administrador');
INSERT INTO usuario (id_usuario, tipo_usuario) VALUES (3, 'Jugador');
INSERT INTO usuario (id_usuario, tipo_usuario) VALUES (4, 'Jugador');
INSERT INTO usuario (id_usuario, tipo_usuario) VALUES (5, 'Administrador');
INSERT INTO usuario (id_usuario, tipo_usuario) VALUES (6, 'Jugador');
INSERT INTO usuario (id_usuario, tipo_usuario) VALUES (7, 'Jugador');
INSERT INTO usuario (id_usuario, tipo_usuario) VALUES (8, 'Administrador');
INSERT INTO usuario (id_usuario, tipo_usuario) VALUES (9, 'Jugador');
INSERT INTO usuario (id_usuario, tipo_usuario) VALUES (10, 'Administrador');
INSERT INTO usuario (id_usuario, tipo_usuario) VALUES (11, 'Jugador');
INSERT INTO usuario (id_usuario, tipo_usuario) VALUES (12, 'Jugador');
INSERT INTO usuario (id_usuario, tipo_usuario) VALUES (13, 'Administrador');
INSERT INTO usuario (id_usuario, tipo_usuario) VALUES (14, 'Jugador');
INSERT INTO usuario (id_usuario, tipo_usuario) VALUES (15, 'Jugador');
INSERT INTO usuario (id_usuario, tipo_usuario) VALUES (16, 'Administrador');
INSERT INTO usuario (id_usuario, tipo_usuario) VALUES (17, 'Jugador');
INSERT INTO usuario (id_usuario, tipo_usuario) VALUES (18, 'Jugador');
INSERT INTO usuario (id_usuario, tipo_usuario) VALUES (19, 'Administrador');
INSERT INTO usuario (id_usuario, tipo_usuario) VALUES (20, 'Jugador');


INSERT INTO login_usuario (id_usuario, username, user_password, fechanacimiento, user_email, nombre_usuario, apellido_paterno, apellido_materno, ciudad, estado, telefono_movil, fecha_de_registro, ultima_conexion) VALUES
(1, 'MarceloCardenas03', 'I3OQP9TFH', '2003-03-13', 'marcelocardenas3003@gmail.com', 'Marcelo', 'Cardenas', 'Leal', 'Monterrey', 'Nuevo Leon', '+528130001001', '2024-03-14', '2024-03-14'),
(2, 'RicardoChapaPerez', 'RCP220032', '2003-01-22', 'rchp03@gmail.com', 'Ricardo', 'Chapa', 'Perez', 'Monterrey', 'Nuevo León', '+528130001002', '2024-03-14', '2024-03-14'),
(3, 'LauraGarciaLopez', 'LGL200340', '2003-04-20', 'lauragl03@hotmail.com', 'Laura', 'Garcia', 'Lopez', 'Puebla', 'Puebla', '+528130001003', '2024-03-14', '2024-03-14'),
(4, 'PabloMartinez01', 'PMRTZ0703', '2001-07-03', 'pablomtz01@yahoo.com', 'Pablo', 'Martinez', 'Perez', 'Querétaro', 'Querétaro', '+528130001004', '2024-03-14', '2024-03-14'),
(5, 'AnaSantos', 'AS070919', '2001-09-07', 'anasantos@gmail.com', 'Ana', 'Santos', 'Gonzalez', 'Mérida', 'Yucatán', '+528130001005', '2024-03-14', '2024-03-14'),
(6, 'DavidLuna88', 'DL880422', '1988-04-22', 'davidluna88@hotmail.com', 'David', 'Luna', 'Ochoa', 'Tijuana', 'Baja California', '+528130001006', '2024-03-14', '2024-03-14'),
(7, 'SofiaPerez77', 'SP770831', '1977-08-31', 'sofiaperez77@yahoo.com', 'Sofia', 'Perez', 'Hernandez', 'Chihuahua', 'Chihuahua', '+528130001007', '2024-03-14', '2024-03-14'),
(8, 'CarlosRamirez', 'CR123456', '1990-12-25', 'cramirez@gmail.com', 'Carlos', 'Ramirez', 'Quiroga', 'Cancún', 'Quintana Roo', '+528130001008', '2024-03-14', '2024-03-14'),
(9, 'LuisaGomez22', 'LG220510', '2022-05-10', 'lgomez22@gmail.com', 'Luisa', 'Gomez', 'Marcos', 'Oaxaca', 'Oaxaca', '+528130001009', '2024-03-14', '2024-03-14'),
(10, 'DiegoLopez', 'DL200120', '2001-01-20', 'diegolopez@hotmail.com', 'Diego', 'Lopez', 'Colorado', 'Morelia', 'Michoacán', '+528130001010', '2024-03-14', '2024-03-14'),
(11, 'MariaFlores', 'MF140890', '1990-08-14', 'mflores@yahoo.com', 'Maria', 'Flores', 'Benavides', 'Guadalajara', 'Jalisco', '+528130001011', '2024-03-14', '2024-03-14'),
(12, 'PedroAlvarez', 'PA271286', '1986-12-27', 'pedroalvarez@hotmail.com', 'Pedro', 'Alvarez', 'Gonzalez', 'Saltillo', 'Coahuila', '+528130001012', '2024-03-14', '2024-03-14'),
(13, 'CamilaDiaz', 'CD010399', '1999-03-01', 'camiladiaz@gmail.com', 'Camila', 'Diaz', 'Ochoa', 'Toluca', 'Estado de México', '+528130001013', '2024-03-14', '2024-03-14'),
(14, 'FernandoGonzalez', 'FG080775', '1975-07-08', 'fergonzalez@yahoo.com', 'Fernando', 'Gonzalez', 'Tenorio', 'Acapulco', 'Guerrero', '+528130001014', '2024-03-14', '2024-03-14'),
(15, 'MonicaHernandez', 'MH200292', '1992-02-20', 'monhernandez@hotmail.com', 'Monica', 'Hernandez', 'Sanchez', 'San Luis Potosí', 'San Luis Potosí', '+528130001015', '2024-03-14', '2024-03-14'),
(16, 'JavierTorres', 'JT190484', '1984-04-19', 'javitorres@gmail.com', 'Javier', 'Torres', 'Perez', 'Hermosillo', 'Sonora', '+528130001016', '2024-03-14', '2024-03-14'),
(17, 'GabrielaRamos', 'GR300998', '1998-09-30', 'gabriela.ramos@yahoo.com', 'Gabriela', 'Ramos', 'Rodriguez', 'Villahermosa', 'Tabasco', '+528130001017', '2024-03-14', '2024-03-14'),
(18, 'AlejandroSanchez', 'AS100175', '1975-01-10', 'asanchez@hotmail.com', 'Alejandro', 'Sanchez', 'Cantu', 'Durango', 'Durango', '+528130001018', '2024-03-14', '2024-03-14'),
(19, 'ValeriaJimenez', 'VJ131199', '1999-11-13', 'vjimenez@gmail.com', 'Valeria', 'Jimenez', 'Salazar', 'Zacatecas', 'Zacatecas', '+528130001019', '2024-03-14', '2024-03-14'),
(20, 'RobertoGomez', 'RG200395', '1995-03-20', 'rgomez@yahoo.com', 'Roberto', 'Gomez', 'Dominguez', 'Aguascalientes', 'Aguascalientes', '+528130001020', '2024-03-14', '2024-03-14');


INSERT INTO vidas (id_usuario, id_vidas, nr_vidas) VALUES (1, 1, 5);
INSERT INTO vidas (id_usuario, id_vidas, nr_vidas) VALUES (2, 2, 3);
INSERT INTO vidas (id_usuario, id_vidas, nr_vidas) VALUES (3, 3, 4);
INSERT INTO vidas (id_usuario, id_vidas, nr_vidas) VALUES (4, 4, 6);
INSERT INTO vidas (id_usuario, id_vidas, nr_vidas) VALUES (5, 5, 7);
INSERT INTO vidas (id_usuario, id_vidas, nr_vidas) VALUES (6, 6, 2);
INSERT INTO vidas (id_usuario, id_vidas, nr_vidas) VALUES (7, 7, 3);
INSERT INTO vidas (id_usuario, id_vidas, nr_vidas) VALUES (8, 8, 5);
INSERT INTO vidas (id_usuario, id_vidas, nr_vidas) VALUES (9, 9, 4);
INSERT INTO vidas (id_usuario, id_vidas, nr_vidas) VALUES (10, 10, 6);
INSERT INTO vidas (id_usuario, id_vidas, nr_vidas) VALUES (11, 11, 3);
INSERT INTO vidas (id_usuario, id_vidas, nr_vidas) VALUES (12, 12, 2);
INSERT INTO vidas (id_usuario, id_vidas, nr_vidas) VALUES (13, 13, 4);
INSERT INTO vidas (id_usuario, id_vidas, nr_vidas) VALUES (14, 14, 5);
INSERT INTO vidas (id_usuario, id_vidas, nr_vidas) VALUES (15, 15, 6);
INSERT INTO vidas (id_usuario, id_vidas, nr_vidas) VALUES (16, 16, 3);
INSERT INTO vidas (id_usuario, id_vidas, nr_vidas) VALUES (17, 17, 4);
INSERT INTO vidas (id_usuario, id_vidas, nr_vidas) VALUES (18, 18, 5);
INSERT INTO vidas (id_usuario, id_vidas, nr_vidas) VALUES (19, 19, 6);
INSERT INTO vidas (id_usuario, id_vidas, nr_vidas) VALUES (20, 20, 7);


-- Insertar datos en la tabla 'wallet'
INSERT INTO wallet (id_usuario, id_wallet, saldo) VALUES (1, 1, 100.00);
INSERT INTO wallet (id_usuario, id_wallet, saldo) VALUES (2, 2, 150.00);
INSERT INTO wallet (id_usuario, id_wallet, saldo) VALUES (3, 3, 200.00);
INSERT INTO wallet (id_usuario, id_wallet, saldo) VALUES (4, 4, 120.00);
INSERT INTO wallet (id_usuario, id_wallet, saldo) VALUES (5, 5, 180.00);
INSERT INTO wallet (id_usuario, id_wallet, saldo) VALUES (6, 6, 90.00);
INSERT INTO wallet (id_usuario, id_wallet, saldo) VALUES (7, 7, 110.00);
INSERT INTO wallet (id_usuario, id_wallet, saldo) VALUES (8, 8, 130.00);
INSERT INTO wallet (id_usuario, id_wallet, saldo) VALUES (9, 9, 140.00);
INSERT INTO wallet (id_usuario, id_wallet, saldo) VALUES (10, 10, 160.00);
INSERT INTO wallet (id_usuario, id_wallet, saldo) VALUES (11, 11, 70.00);
INSERT INTO wallet (id_usuario, id_wallet, saldo) VALUES (12, 12, 85.00);
INSERT INTO wallet (id_usuario, id_wallet, saldo) VALUES (13, 13, 180.00);
INSERT INTO wallet (id_usuario, id_wallet, saldo) VALUES (14, 14, 200.00);
INSERT INTO wallet (id_usuario, id_wallet, saldo) VALUES (15, 15, 210.00);
INSERT INTO wallet (id_usuario, id_wallet, saldo) VALUES (16, 16, 95.00);
INSERT INTO wallet (id_usuario, id_wallet, saldo) VALUES (17, 17, 125.00);
INSERT INTO wallet (id_usuario, id_wallet, saldo) VALUES (18, 18, 145.00);
INSERT INTO wallet (id_usuario, id_wallet, saldo) VALUES (19, 19, 170.00);
INSERT INTO wallet (id_usuario, id_wallet, saldo) VALUES (20, 20, 190.00);

-- Insertar datos en la tabla 'transacciones'
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (1, 1, 1, 'Compra', 30.00, 3, 'Transferencia', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (2, 2, 2, 'Compra', 50.00, 5, 'Efectivo', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (3, 3, 3, 'Compra', 30.00, 3, 'Tarjeta', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (4, 4, 4, 'Compra', 10.00, 1, 'Transferencia', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (5, 5, 5, 'Compra', 50.00, 5, 'Efectivo', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (6, 6, 6, 'Compra', 30.00, 3, 'Tarjeta', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (7, 7, 7, 'Compra', 50.00, 5, 'Tarjeta', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (8, 8, 8, 'Compra', 30.00, 3, 'Transferencia', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (9, 9, 9, 'Compra', 20.00, 2, 'Transferencia', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (10, 10, 10, 'Compra', 40.00, 4, 'Efectivo', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (11, 11, 11, 'Compra', 40.00, 4, 'Transferencia', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (12, 12, 12, 'Compra', 40.00, 4, 'Tarjeta', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (13, 13, 13, 'Compra', 50.00, 5, 'Tarjeta', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (14, 14, 14, 'Compra', 10.00, 1, 'Tarjeta', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (15, 15, 15, 'Compra', 20.00, 2, 'Tarjeta', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (16, 16, 16, 'Compra', 50.00, 5, 'Efectivo', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (17, 17, 17, 'Compra', 50.00, 5, 'Tarjeta', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (18, 18, 18, 'Compra', 10.00, 1, 'Tarjeta', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (19, 19, 19, 'Compra', 20.00, 2, 'Efectivo', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (20, 20, 20, 'Compra', 50.00, 5, 'Transferencia', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (21, 1, 1, 'Compra', 30.00, 3, 'Efectivo', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (22, 2, 2, 'Compra', 40.00, 4, 'Transferencia', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (23, 3, 3, 'Compra', 20.00, 2, 'Efectivo', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (24, 4, 4, 'Compra', 20.00, 2, 'Efectivo', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (25, 5, 5, 'Compra', 50.00, 5, 'Efectivo', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (26, 6, 6, 'Compra', 50.00, 5, 'Tarjeta', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (27, 7, 7, 'Compra', 50.00, 5, 'Tarjeta', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (28, 8, 8, 'Compra', 30.00, 3, 'Efectivo', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (29, 9, 9, 'Compra', 20.00, 2, 'Tarjeta', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (30, 10, 10, 'Compra', 20.00, 2, 'Efectivo', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (31, 11, 11, 'Compra', 10.00, 1, 'Tarjeta', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (32, 12, 12, 'Compra', 40.00, 4, 'Tarjeta', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (33, 13, 13, 'Compra', 20.00, 2, 'Tarjeta', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (34, 14, 14, 'Compra', 40.00, 4, 'Efectivo', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (35, 15, 15, 'Compra', 50.00, 5, 'Efectivo', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (36, 16, 16, 'Compra', 10.00, 1, 'Transferencia', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (37, 17, 17, 'Compra', 50.00, 5, 'Efectivo', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (38, 18, 18, 'Compra', 30.00, 3, 'Transferencia', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (39, 19, 19, 'Compra', 20.00, 2, 'Efectivo', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (40, 20, 20, 'Compra', 30.00, 3, 'Efectivo', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (41, 1, 1, 'Compra', 10.00, 1, 'Transferencia', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (42, 2, 2, 'Compra', 30.00, 3, 'Efectivo', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (43, 3, 3, 'Compra', 10.00, 1, 'Tarjeta', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (44, 4, 4, 'Compra', 10.00, 1, 'Efectivo', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (45, 5, 5, 'Compra', 10.00, 1, 'Efectivo', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (46, 6, 6, 'Compra', 50.00, 5, 'Efectivo', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (47, 7, 7, 'Compra', 10.00, 1, 'Tarjeta', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (48, 8, 8, 'Compra', 10.00, 1, 'Transferencia', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (49, 9, 9, 'Compra', 10.00, 1, 'Tarjeta', 'Vidas Extra');
INSERT INTO transacciones (id_transaccion, id_wallet, id_vidas, tipo_transaccion, importe, cant, tipo_pago, producto) VALUES (50, 10, 10, 'Compra', 10.00, 1, 'Tarjeta', 'Vidas Extra');

-- Insertar datos en la tabla 'user_puntos'
INSERT INTO user_puntos (id_usuario, nr_puntos) VALUES (1, 2310);
INSERT INTO user_puntos (id_usuario, nr_puntos) VALUES (2, 4670);
INSERT INTO user_puntos (id_usuario, nr_puntos) VALUES (3, 3351);
INSERT INTO user_puntos (id_usuario, nr_puntos) VALUES (4, 2097);
INSERT INTO user_puntos (id_usuario, nr_puntos) VALUES (5, 3779);
INSERT INTO user_puntos (id_usuario, nr_puntos) VALUES (6, 2040);
INSERT INTO user_puntos (id_usuario, nr_puntos) VALUES (7, 2690);
INSERT INTO user_puntos (id_usuario, nr_puntos) VALUES (8, 1025);
INSERT INTO user_puntos (id_usuario, nr_puntos) VALUES (9, 2938);
INSERT INTO user_puntos (id_usuario, nr_puntos) VALUES (10, 2359);
INSERT INTO user_puntos (id_usuario, nr_puntos) VALUES (11, 3418);
INSERT INTO user_puntos (id_usuario, nr_puntos) VALUES (12, 2216);
INSERT INTO user_puntos (id_usuario, nr_puntos) VALUES (13, 1430);
INSERT INTO user_puntos (id_usuario, nr_puntos) VALUES (14, 4742);
INSERT INTO user_puntos (id_usuario, nr_puntos) VALUES (15, 1416);
INSERT INTO user_puntos (id_usuario, nr_puntos) VALUES (16, 4111);
INSERT INTO user_puntos (id_usuario, nr_puntos) VALUES (17, 2185);
INSERT INTO user_puntos (id_usuario, nr_puntos) VALUES (18, 3150);
INSERT INTO user_puntos (id_usuario, nr_puntos) VALUES (19, 4052);
INSERT INTO user_puntos (id_usuario, nr_puntos) VALUES (20, 3269);

-- Insertar datos en la tabla 'desafios'
INSERT INTO desafios (id_desafio, description_desafio, start_date, end_date, importe_premio) VALUES (1, 'Desafío 1', '2024-03-12 01:51:01', '2024-03-15 18:58:39', 50.00);
INSERT INTO desafios (id_desafio, description_desafio, start_date, end_date, importe_premio) VALUES (2, 'Desafío 2', '2024-03-11 05:24:43', '2024-02-14 04:26:52', 75.00);
INSERT INTO desafios (id_desafio, description_desafio, start_date, end_date, importe_premio) VALUES (3, 'Desafío 3', '2024-03-14 15:53:13', '2024-03-16 15:53:13', 75.00);
INSERT INTO desafios (id_desafio, description_desafio, start_date, end_date, importe_premio) VALUES (4, 'Desafío 4', '2024-03-10 02:47:47', '2024-03-12 02:47:47', 100.00);
INSERT INTO desafios (id_desafio, description_desafio, start_date, end_date, importe_premio) VALUES (5, 'Desafío 5', '2024-03-18 08:02:55', '2024-03-20 08:02:55', 75.00);
INSERT INTO desafios (id_desafio, description_desafio, start_date, end_date, importe_premio) VALUES (6, 'Desafío 6', '2024-03-14 00:18:19', '2024-03-18 00:18:19', 50.00);
INSERT INTO desafios (id_desafio, description_desafio, start_date, end_date, importe_premio) VALUES (7, 'Desafío 7', '2024-03-15 02:08:14', '2024-03-19 02:08:14', 50.00);
INSERT INTO desafios (id_desafio, description_desafio, start_date, end_date, importe_premio) VALUES (8, 'Desafío 8', '2024-03-18 08:13:32', '2024-03-20 08:13:32', 125.00);
INSERT INTO desafios (id_desafio, description_desafio, start_date, end_date, importe_premio) VALUES (9, 'Desafío 9', '2024-03-10 12:21:23', '2024-03-13 12:21:23', 50.00);
INSERT INTO desafios (id_desafio, description_desafio, start_date, end_date, importe_premio) VALUES (10, 'Desafío 10', '2024-03-10 07:47:46', '2024-03-15 07:47:46', 75.00);

-- Insertar datos en la tabla 'user_desafios'
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (1, 1, TRUE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (2, 2, TRUE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (3, 17, FALSE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (4, 20, TRUE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (5, 8, TRUE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (6, 19, FALSE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (7, 3, TRUE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (8, 2, FALSE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (9, 14, FALSE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (10, 17, TRUE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (1, 4, FALSE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (2, 4, TRUE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (3, 20, TRUE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (4, 20, TRUE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (5, 17, FALSE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (6, 3, TRUE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (7, 2, FALSE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (8, 14, TRUE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (9, 10, FALSE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (10, 7, TRUE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (1, 11, FALSE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (2, 19, TRUE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (3, 5, FALSE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (4, 13, TRUE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (5, 6, FALSE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (6, 18, TRUE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (7, 9, FALSE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (8, 12, TRUE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (9, 15, FALSE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (10, 8, TRUE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (1, 16, FALSE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (2, 1, TRUE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (3, 2, FALSE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (4, 3, TRUE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (5, 4, FALSE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (6, 5, TRUE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (7, 6, FALSE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (8, 7, TRUE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (9, 8, FALSE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (10, 9, TRUE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (1, 10, FALSE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (2, 11, TRUE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (3, 12, FALSE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (4, 13, TRUE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (5, 14, FALSE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (6, 15, TRUE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (7, 16, FALSE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (8, 17, TRUE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (9, 18, FALSE);
INSERT INTO user_desafios (id_desafio, id_usuario, completed) VALUES (10, 19, TRUE);


-- Insertar datos en la tabla 'leaderboard'
INSERT INTO leaderboard (id_usuario, nr_puntos, ranking_position) VALUES (1, 100, 2);
INSERT INTO leaderboard (id_usuario, nr_puntos, ranking_position) VALUES (2, 200, 1);
INSERT INTO leaderboard (id_usuario, nr_puntos, ranking_position) VALUES (3, 70, 4);
INSERT INTO leaderboard (id_usuario, nr_puntos, ranking_position) VALUES (4, 118, 3);
INSERT INTO leaderboard (id_usuario, nr_puntos, ranking_position) VALUES (5, 186, 9);
INSERT INTO leaderboard (id_usuario, nr_puntos, ranking_position) VALUES (6, 221, 3);
INSERT INTO leaderboard (id_usuario, nr_puntos, ranking_position) VALUES (7, 110, 11);
INSERT INTO leaderboard (id_usuario, nr_puntos, ranking_position) VALUES (8, 203, 15);
INSERT INTO leaderboard (id_usuario, nr_puntos, ranking_position) VALUES (9, 57, 17);
INSERT INTO leaderboard (id_usuario, nr_puntos, ranking_position) VALUES (10, 119, 11);
INSERT INTO leaderboard (id_usuario, nr_puntos, ranking_position) VALUES (11, 233, 13);
INSERT INTO leaderboard (id_usuario, nr_puntos, ranking_position) VALUES (12, 88, 2);
INSERT INTO leaderboard (id_usuario, nr_puntos, ranking_position) VALUES (13, 158, 10);
INSERT INTO leaderboard (id_usuario, nr_puntos, ranking_position) VALUES (14, 113, 9);
INSERT INTO leaderboard (id_usuario, nr_puntos, ranking_position) VALUES (15, 135, 5);
INSERT INTO leaderboard (id_usuario, nr_puntos, ranking_position) VALUES (16, 66, 11);
INSERT INTO leaderboard (id_usuario, nr_puntos, ranking_position) VALUES (17, 66, 1);
INSERT INTO leaderboard (id_usuario, nr_puntos, ranking_position) VALUES (18, 159, 5);
INSERT INTO leaderboard (id_usuario, nr_puntos, ranking_position) VALUES (19, 101, 6);
INSERT INTO leaderboard (id_usuario, nr_puntos, ranking_position) VALUES (20, 272, 11);

-- Insertar datos en la tabla 'game_plinko'
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (5, '2024-03-09 08:58:40', '2024-03-09 09:24:40', 19, 6);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (1, '2024-03-09 22:11:48', '2024-03-09 22:41:48', 19, 27);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (5, '2024-03-08 08:11:05', '2024-03-08 08:21:05', 17, 2);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (19, '2024-03-10 18:43:34', '2024-03-10 18:55:34', 16, 18);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (13, '2024-03-11 12:29:00', '2024-03-11 12:58:00', 20, 23);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (9, '2024-03-10 16:32:29', '2024-03-10 16:41:29', 9, 30);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (12, '2024-03-10 03:52:03', '2024-03-10 03:58:03', 19, 26);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (2, '2024-03-11 05:28:03', '2024-03-11 05:35:03', 16, 27);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (8, '2024-03-10 06:12:04', '2024-03-10 06:38:04', 16, 35);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (12, '2024-03-10 20:13:45', '2024-03-10 20:34:45', 17, 25);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (18, '2024-03-09 09:17:06', '2024-03-09 09:33:06', 11, 30);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (7, '2024-03-11 00:27:21', '2024-03-11 00:53:21', 20, 22);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (13, '2024-03-09 19:47:01', '2024-03-09 20:10:01', 20, 24);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (8, '2024-03-08 06:52:05', '2024-03-08 07:00:05', 12, 7);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (5, '2024-03-09 01:53:03', '2024-03-09 02:15:03', 18, 35);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (12, '2024-03-11 14:14:05', '2024-03-11 14:44:05', 5, 13);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (11, '2024-03-08 11:29:27', '2024-03-08 11:58:27', 14, 3);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (6, '2024-03-08 00:50:41', '2024-03-08 00:59:41', 18, 12);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (7, '2024-03-08 15:33:44', '2024-03-08 15:46:44', 14, 17);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (18, '2024-03-09 21:11:40', '2024-03-09 21:35:40', 5, 9);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (7, '2024-03-09 14:19:47', '2024-03-09 14:33:47', 11, 27);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (10, '2024-03-09 13:58:44', '2024-03-09 14:19:44', 15, 4);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (6, '2024-03-11 02:00:38', '2024-03-11 02:16:38', 5, 19);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (2, '2024-03-10 19:50:13', '2024-03-10 20:14:13', 8, 3);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (10, '2024-03-09 06:52:19', '2024-03-09 07:01:19', 11, 29);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (13, '2024-03-08 18:42:26', '2024-03-08 19:09:26', 15, 26);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (6, '2024-03-09 00:05:10', '2024-03-09 00:27:10', 14, 39);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (20, '2024-03-11 15:38:01', '2024-03-11 15:43:01', 7, 4);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (13, '2024-03-11 18:15:58', '2024-03-11 18:39:58', 5, 10);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (4, '2024-03-11 05:36:28', '2024-03-11 05:58:28', 14, 25);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (19, '2024-03-09 17:23:43', '2024-03-09 17:41:43', 18, 27);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (20, '2024-03-08 07:40:55', '2024-03-08 07:45:55', 6, 23);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (17, '2024-03-11 01:39:36', '2024-03-11 02:05:36', 8, 38);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (4, '2024-03-11 18:52:47', '2024-03-11 19:22:47', 18, 12);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (10, '2024-03-08 01:19:19', '2024-03-08 01:46:19', 12, 28);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (11, '2024-03-11 08:15:43', '2024-03-11 08:23:43', 19, 36);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (1, '2024-03-08 13:31:10', '2024-03-08 13:38:10', 12, 1);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (6, '2024-03-08 22:48:45', '2024-03-08 23:12:45', 12, 38);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (11, '2024-03-11 11:58:11', '2024-03-11 12:27:11', 13, 20);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (14, '2024-03-11 12:23:45', '2024-03-11 12:33:45', 9, 25);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (13, '2024-03-09 23:58:34', '2024-03-10 00:27:34', 20, 3);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (4, '2024-03-09 22:19:09', '2024-03-09 22:33:09', 12, 39);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (3, '2024-03-10 04:53:55', '2024-03-10 05:16:55', 10, 30);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (2, '2024-03-10 08:36:38', '2024-03-10 08:59:38', 12, 22);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (7, '2024-03-09 08:41:19', '2024-03-09 09:04:19', 6, 35);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (3, '2024-03-09 15:51:52', '2024-03-09 16:00:52', 7, 1);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (17, '2024-03-08 06:04:16', '2024-03-08 06:27:16', 10, 9);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (18, '2024-03-08 03:31:33', '2024-03-08 03:38:33', 15, 18);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (11, '2024-03-11 11:57:08', '2024-03-11 12:10:08', 12, 23);
INSERT INTO game_plinko (id_usuario, start_time, end_time, importe, premio) VALUES (4, '2024-03-08 04:54:07', '2024-03-08 05:13:07', 14, 23);

-- Insertar datos en la tabla 'game_borregovaliente'
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (5, '2024-03-09 08:58:40', '2024-03-09 09:24:40', 16, 6);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (1, '2024-03-09 22:11:48', '2024-03-09 22:41:48', 6, 21);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (5, '2024-03-08 08:11:05', '2024-03-08 08:21:05', 18, 6);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (19, '2024-03-10 18:43:34', '2024-03-10 18:55:34', 6, 28);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (13, '2024-03-11 12:29:00', '2024-03-11 12:58:00', 18, 2);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (9, '2024-03-10 16:32:29', '2024-03-10 16:41:29', 10, 28);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (12, '2024-03-10 03:52:03', '2024-03-10 03:58:03', 6, 14);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (2, '2024-03-11 05:28:03', '2024-03-11 05:35:03', 11, 13);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (8, '2024-03-10 06:12:04', '2024-03-10 06:38:04', 13, 27);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (12, '2024-03-10 20:13:45', '2024-03-10 20:34:45', 16, 26);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (18, '2024-03-09 09:17:06', '2024-03-09 09:33:06', 12, 21);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (7, '2024-03-11 00:27:21', '2024-03-11 00:53:21', 20, 29);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (13, '2024-03-09 19:47:01', '2024-03-09 20:10:01', 8, 0);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (8, '2024-03-08 06:52:05', '2024-03-08 07:00:05', 20, 22);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (5, '2024-03-09 01:53:03', '2024-03-09 02:15:03', 17, 3);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (12, '2024-03-11 14:14:05', '2024-03-11 14:44:05', 12, 19);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (11, '2024-03-08 11:29:27', '2024-03-08 11:58:27', 13, 17);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (6, '2024-03-08 00:50:41', '2024-03-08 00:59:41', 14, 5);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (7, '2024-03-08 15:33:44', '2024-03-08 15:46:44', 14, 1);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (18, '2024-03-09 21:11:40', '2024-03-09 21:35:40', 19, 20);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (7, '2024-03-09 14:19:47', '2024-03-09 14:33:47', 8, 2);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (10, '2024-03-09 13:58:44', '2024-03-09 14:19:44', 11, 22);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (6, '2024-03-11 02:00:38', '2024-03-11 02:16:38', 12, 17);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (2, '2024-03-10 19:50:13', '2024-03-10 20:14:13', 19, 5);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (10, '2024-03-09 06:52:19', '2024-03-09 07:01:19', 20, 7);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (13, '2024-03-08 18:42:26', '2024-03-08 19:09:26', 12, 25);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (6, '2024-03-09 00:05:10', '2024-03-09 00:27:10', 6, 24);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (20, '2024-03-11 15:38:01', '2024-03-11 15:43:01', 19, 24);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (13, '2024-03-11 18:15:58', '2024-03-11 18:39:58', 12, 13);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (4, '2024-03-11 05:36:28', '2024-03-11 05:58:28', 7, 24);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (19, '2024-03-09 17:23:43', '2024-03-09 17:41:43', 6, 5);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (20, '2024-03-08 07:40:55', '2024-03-08 07:45:55', 5, 20);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (17, '2024-03-11 01:39:36', '2024-03-11 02:05:36', 20, 8);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (4, '2024-03-11 18:52:47', '2024-03-11 19:22:47', 12, 25);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (10, '2024-03-08 01:19:19', '2024-03-08 01:46:19', 6, 29);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (11, '2024-03-11 08:15:43', '2024-03-11 08:23:43', 8, 23);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (1, '2024-03-08 13:31:10', '2024-03-08 13:38:10', 6, 22);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (6, '2024-03-08 22:48:45', '2024-03-08 23:12:45', 8, 15);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (11, '2024-03-11 11:58:11', '2024-03-11 12:27:11', 18, 29);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (14, '2024-03-11 12:23:45', '2024-03-11 12:33:45', 10, 19);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (13, '2024-03-09 23:58:34', '2024-03-10 00:27:34', 15, 29);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (4, '2024-03-09 22:19:09', '2024-03-09 22:33:09', 20, 11);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (3, '2024-03-10 04:53:55', '2024-03-10 05:16:55', 9, 27);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (2, '2024-03-10 08:36:38', '2024-03-10 08:59:38', 19, 3);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (7, '2024-03-09 08:41:19', '2024-03-09 09:04:19', 11, 25);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (3, '2024-03-09 15:51:52', '2024-03-09 16:00:52', 6, 8);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (17, '2024-03-08 06:04:16', '2024-03-08 06:27:16', 19, 10);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (18, '2024-03-08 03:31:33', '2024-03-08 03:38:33', 6, 24);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (11, '2024-03-11 11:57:08', '2024-03-11 12:10:08', 15, 13);
INSERT INTO game_borregovaliente (id_usuario, start_time, end_time, importe, premio) VALUES (4, '2024-03-08 04:54:07', '2024-03-08 05:13:07', 10, 3);


-- Insertar datos en la tabla 'game_conduceygana'
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (5, '2024-03-09 08:58:40', '2024-03-09 09:24:40', 7, 3, 40, 65);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (1, '2024-03-09 22:11:48', '2024-03-09 22:41:48', 3, 1, 20, 316);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (5, '2024-03-08 08:11:05', '2024-03-08 08:21:05', 7, 2, 2, 53);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (19, '2024-03-10 18:43:34', '2024-03-10 18:55:34', 2, 3, 34, 22);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (13, '2024-03-11 12:29:00', '2024-03-11 12:58:00', 7, 5, 47, 27);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (9, '2024-03-10 16:32:29', '2024-03-10 16:41:29', 3, 4, 18, 65);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (12, '2024-03-10 03:52:03', '2024-03-10 03:58:03', 6, 5, 19, 79);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (2, '2024-03-11 05:28:03', '2024-03-11 05:35:03', 2, 1, 43, 267);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (8, '2024-03-10 06:12:04', '2024-03-10 06:38:04', 7, 4, 79, 240);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (12, '2024-03-10 20:13:45', '2024-03-10 20:34:45', 7, 4, 70, 184);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (18, '2024-03-09 09:17:06', '2024-03-09 09:33:06', 2, 1, 42, 142);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (7, '2024-03-11 00:27:21', '2024-03-11 00:53:21', 4, 5, 86, 414);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (13, '2024-03-09 19:47:01', '2024-03-09 20:10:01', 3, 5, 27, 81);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (8, '2024-03-08 06:52:05', '2024-03-08 07:00:05', 1, 2, 60, 307);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (5, '2024-03-09 01:53:03', '2024-03-09 02:15:03', 1, 5, 22, 435);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (12, '2024-03-11 14:14:05', '2024-03-11 14:44:05', 10, 1, 40, 226);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (11, '2024-03-08 11:29:27', '2024-03-08 11:58:27', 9, 1, 46, 384);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (6, '2024-03-08 00:50:41', '2024-03-08 00:59:41', 2, 2, 70, 331);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (7, '2024-03-08 15:33:44', '2024-03-08 15:46:44', 10, 1, 92, 429);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (18, '2024-03-09 21:11:40', '2024-03-09 21:35:40', 4, 2, 35, 133);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (7, '2024-03-09 14:19:47', '2024-03-09 14:33:47', 2, 1, 80, 377);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (10, '2024-03-09 13:58:44', '2024-03-09 14:19:44', 9, 5, 91, 29);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (6, '2024-03-11 02:00:38', '2024-03-11 02:16:38', 3, 1, 37, 421);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (2, '2024-03-10 19:50:13', '2024-03-10 20:14:13', 8, 2, 56, 26);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (10, '2024-03-09 06:52:19', '2024-03-09 07:01:19', 9, 1, 2, 492);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (13, '2024-03-08 18:42:26', '2024-03-08 19:09:26', 5, 4, 26, 231);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (6, '2024-03-09 00:05:10', '2024-03-09 00:27:10', 9, 4, 19, 75);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (20, '2024-03-11 15:38:01', '2024-03-11 15:43:01', 5, 3, 0, 438);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (13, '2024-03-11 18:15:58', '2024-03-11 18:39:58', 1, 3, 38, 190);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (4, '2024-03-11 05:36:28', '2024-03-11 05:58:28', 4, 2, 19, 331);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (19, '2024-03-09 17:23:43', '2024-03-09 17:41:43', 5, 3, 75, 156);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (20, '2024-03-08 07:40:55', '2024-03-08 07:45:55', 4, 2, 53, 152);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (17, '2024-03-11 01:39:36', '2024-03-11 02:05:36', 6, 1, 38, 347);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (4, '2024-03-11 18:52:47', '2024-03-11 19:22:47', 1, 4, 34, 378);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (10, '2024-03-08 01:19:19', '2024-03-08 01:46:19', 7, 4, 78, 244);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (11, '2024-03-11 08:15:43', '2024-03-11 08:23:43', 10, 3, 22, 331);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (1, '2024-03-08 13:31:10', '2024-03-08 13:38:10', 3, 5, 9, 84);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (6, '2024-03-08 22:48:45', '2024-03-08 23:12:45', 9, 2, 56, 409);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (11, '2024-03-11 11:58:11', '2024-03-11 12:27:11', 2, 5, 52, 435);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (14, '2024-03-11 12:23:45', '2024-03-11 12:33:45', 9, 4, 49, 38);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (13, '2024-03-09 23:58:34', '2024-03-10 00:27:34', 4, 4, 4, 88);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (4, '2024-03-09 22:19:09', '2024-03-09 22:33:09', 6, 2, 25, 400);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (3, '2024-03-10 04:53:55', '2024-03-10 05:16:55', 6, 4, 9, 310);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (2, '2024-03-10 08:36:38', '2024-03-10 08:59:38', 6, 1, 19, 133);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (7, '2024-03-09 08:41:19', '2024-03-09 09:04:19', 7, 4, 91, 22);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (3, '2024-03-09 15:51:52', '2024-03-09 16:00:52', 9, 4, 100, 193);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (17, '2024-03-08 06:04:16', '2024-03-08 06:27:16', 6, 4, 81, 389);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (18, '2024-03-08 03:31:33', '2024-03-08 03:38:33', 7, 3, 91, 391);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (11, '2024-03-11 11:57:08', '2024-03-11 12:10:08', 9, 1, 39, 496);
INSERT INTO game_conduceygana (id_usuario, start_time, end_time, nivel_juego, id_vidas, puntos_ganados, nr_puntos) VALUES (4, '2024-03-08 04:54:07', '2024-03-08 05:13:07', 1, 2, 72, 32);
