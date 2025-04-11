CREATE TABLE roles (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;


CREATE TABLE usuarios (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    rol_id INT UNSIGNED NOT NULL,
    sueldo DECIMAL(10, 2),
    FOREIGN KEY (rol_id) REFERENCES roles(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;



CREATE TABLE area_trabajo(
	id int auto_increment primary key,
	nombre varchar(100) not null,
	latitud varchar(100) not null,
	longitud varchar(100) not null,
	rario_metros int default 100
);


CREATE TABLE jornadas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT UNSIGNED NOT NULL,
    fecha DATE NOT NULL,
    hora_inicio DATETIME,
    hora_fin DATETIME,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE marcaciones (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT UNSIGNED NOT NULL,
    tipo ENUM('inicio', 'almuerzo_inicio', 'almuerzo_fin', 'salida') NOT NULL,
    fecha_hora DATETIME NOT NULL,
    latitud DECIMAL(10, 7),
    longitud DECIMAL(10, 7),
    jornada_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
    FOREIGN KEY (jornada_id) REFERENCES jornadas(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;