-- =========================
-- DIMENSIONES
-- =========================

CREATE TABLE Dim_Tiempo (
    tiempo_id INT IDENTITY(1,1) PRIMARY KEY,
    fecha DATE NOT NULL,
    anio INT NOT NULL,
    mes INT NOT NULL,
    nombre_mes VARCHAR(20) NOT NULL,
    semana_anio INT NOT NULL,
    dia INT NOT NULL,
    nombre_dia VARCHAR(20) NOT NULL,
    es_fin_semana BIT NOT NULL,
    temporada_comercial VARCHAR(15) NOT NULL
);

CREATE TABLE Dim_Sucursal (
    sucursal_id INT IDENTITY(1,1) PRIMARY KEY,
    ciudad VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL,
    tipo_sucursal VARCHAR(30) NOT NULL,
    rol_logistico VARCHAR(30) NOT NULL
);

CREATE TABLE Dim_Producto (
    producto_id INT IDENTITY(1,1) PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    precio_base DECIMAL(10,2) NOT NULL,
    coste_unitario DECIMAL(10,2) NOT NULL
);

CREATE TABLE Dim_Profesor (
    profesor_id INT IDENTITY(1,1) PRIMARY KEY,
    nombre_profesor VARCHAR(100) NOT NULL,
    especialidad VARCHAR(50) NOT NULL,
    tipo_contrato VARCHAR(30) NOT NULL,
    coste_por_clase DECIMAL(10,2) NOT NULL
);

CREATE TABLE Dim_Servicio (
    servicio_id INT IDENTITY(1,1) PRIMARY KEY,
    tipo_servicio VARCHAR(50) NOT NULL,
    nivel VARCHAR(30),
    duracion_horas DECIMAL(4,2) NOT NULL,
    precio_base DECIMAL(10,2) NOT NULL,
    incluye_alquiler BIT NOT NULL
);

CREATE TABLE Dim_Medio_Pago (
    medio_pago_id INT IDENTITY(1,1) PRIMARY KEY,
    medio_pago VARCHAR(30) NOT NULL
);

CREATE TABLE Dim_Canal_Venta (
    canal_venta_id INT IDENTITY(1,1) PRIMARY KEY,
    canal_venta VARCHAR(30) NOT NULL
);
