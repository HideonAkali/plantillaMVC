CREATE TABLE ROL (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45),
    descripcion VARCHAR(250)
);


CREATE TABLE USUARIO (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50),
    password VARCHAR(100),
    rol_id INTEGER,
    FOREIGN KEY (rol_id) REFERENCES ROL(id),
);

CREATE TABLE CAJA (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    estado INTEGER(1),
    usuario_id INTEGER,
    FOREIGN KEY (usuario_id) REFERENCES USUARIO(id)
);

CREATE TABLE MONEDA (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45),
    simbolo VARCHAR(5)
);

CREATE TABLE TIPO_CAMBIO (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    valor_venta FLOAT,
    fecha_actualizacion TIMESTAMP,
    moneda_id INTEGER,
    FOREIGN KEY (moneda_id) REFERENCES MONEDA(id)
);


CREATE TABLE MONEDA_AUTORIZADA (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    tipo_cambio_id INTEGER,
    moneda_id INTEGER,
    FOREIGN KEY (tipo_cambio_id) REFERENCES TIPO_CAMBIO(id),
    FOREIGN KEY (moneda_id) REFERENCES MONEDA(id)
);

CREATE TABLE DISPONIBILIDAD_CAJA (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    disponibilidad_pesos FLOAT,
    caja_id INTEGER,
    moneda_autorizada_id INTEGER,
    FOREIGN KEY (caja_id) REFERENCES CAJA(id),
    FOREIGN KEY (moneda_autorizada_id) REFERENCES MONEDA_AUTORIZADA(id)
);

CREATE TABLE TRANSACCION (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    estado VARCHAR(20),
    fecha_creacion TIMESTAMP,
    disponibilidad_caja_id INTEGER,
    FOREIGN KEY (disponibilidad_caja_id) REFERENCES DISPONIBILIDAD_CAJA(id)
);

CREATE TABLE RECAUDACION (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    monto_total FLOAT,
    fecha_recaudacion TIMESTAMP,
    transaccion_id INTEGER,
    FOREIGN KEY (transaccion_id) REFERENCES TRANSACCION(id)
);
