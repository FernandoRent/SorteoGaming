use reto;

CREATE TABLE usuario (
    usuario_id INT NOT NULL AUTO_INCREMENT,
    user_password VARCHAR(255) NOT NULL,
    nombre_usuario VARCHAR(50) NOT NULL,
    user_email VARCHAR(100),
    nombre VARCHAR(50) NOT NULL,
    apellido_paterno VARCHAR(50) NOT NULL,
    apellido_materno VARCHAR(50) NOT NULL,
    telefono_movil VARCHAR(20) NOT NULL,
    fecha_de_registro DATETIME NOT NULL,
    ultima_conexion DATETIME NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL DEFAULT 'Mexico',
    rol ENUM('admin', 'user') NOT NULL DEFAULT 'user',
    PRIMARY KEY (usuario_id)
);



CREATE TABLE wallet (
    wallet_id INT NOT NULL AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    saldo DECIMAL(10, 2) NOT NULL,
    divisa VARCHAR(3) NOT NULL,
    fecha_creacion DATE NOT NULL,
    fecha_actualizacion DATE NOT NULL,
    PRIMARY KEY (wallet_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
);

CREATE TABLE tarjetas_pago (
    tarjeta_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    wallet_id INT NOT NULL,
    numero_tarjeta VARCHAR(255) NOT NULL,
    fecha_expiracion DATE NOT NULL,
    titular_tarjeta VARCHAR(255) NOT NULL,
    cvv VARCHAR(255) NOT NULL, 
    fecha_agregada DATE NOT NULL,
    estado BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (wallet_id) REFERENCES wallet(wallet_id)
);


CREATE TABLE transaccion (
    transaccion_id INT NOT NULL AUTO_INCREMENT,
	usuario_id int not null,
    importe DECIMAL(10, 2) NOT NULL,
    tipo_transaccion ENUM('Deposito', 'Vidas', 'Apuesta', 'WinLoss') NOT NULL,
    fecha_transaccion DATE NOT NULL,
    PRIMARY KEY (transaccion_id),
    FOREIGN KEY (usuario_id) references usuario(usuario_id)
);


CREATE TABLE productos (
    producto_id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    descripcion VARCHAR(255),
    tipo_producto ENUM('Vida', 'ApuestaPlinko', 'ApuestaBorregoValiente') NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (producto_id)
);


CREATE TABLE leaderboard_semanal (
    leaderboard_id INT NOT NULL AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    puntos INT NOT NULL,
    semana DATE NOT NULL,
    PRIMARY KEY (leaderboard_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
);

CREATE TABLE puntos (
    puntos_id INT NOT NULL AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    puntos INT NOT NULL,
    fecha DATE NOT NULL,
    PRIMARY KEY (puntos_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
);

CREATE TABLE game_conduceygana (
    juego_id INT NOT NULL AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    fecha_inicio DATETIME not null,
    fecha_fin DATETIME not null,
    nivel_juego INT NOT NULL,
    puntos_ganados INT NOT NULL,
    PRIMARY KEY (juego_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
);



CREATE TABLE vidas (
    vida_id INT NOT NULL AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    vidas INT NOT NULL,
    fecha DATE NOT NULL,
    PRIMARY KEY (vida_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
);

CREATE TABLE desafios (
    desafio_id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    descripcion VARCHAR(255),
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    PRIMARY KEY (desafio_id)
);



CREATE TABLE user_desafios (
    desafio_id INT NOT NULL,
    usuario_id INT NOT NULL,
    completed BOOLEAN NOT NULL,
    FOREIGN KEY (desafio_id) REFERENCES desafios(desafio_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
);


CREATE TABLE apuestas (
    apuesta_id INT NOT NULL AUTO_INCREMENT,
    compra_id INT NOT NULL,
    usuario_id INT NOT NULL,
    juego ENUM('Plinko', 'BorregoValiente') NOT NULL,
    multiplicador DECIMAL(10, 2),
    resultado DECIMAL(10, 2),
    fecha_hora DATETIME NOT NULL,
    PRIMARY KEY (apuesta_id),
    FOREIGN KEY (compra_id) REFERENCES compras(compra_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
);

CREATE TABLE game_plinko (
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(usuario_id),
    fecha_inicio DATETIME,
    fecha_fin DATETIME
);



CREATE TABLE game_borregovaliente (
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(usuario_id),
    fecha_inicio DATETIME,
    fecha_fin DATETIME
);
