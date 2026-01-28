/*
05_fact_clases.sql
Generación automática de clases y servicios
*/

CREATE TABLE Fact_Clases (
    clase_id INT IDENTITY PRIMARY KEY,
    tiempo_id INT,
    sucursal_id INT,
    servicio_id INT,
    profesor_id INT,
    asistentes INT,
    capacidad INT,
    ingreso_total DECIMAL(10,2),
    coste_profesor DECIMAL(10,2),
    margen DECIMAL(10,2)
);

-- Script de generación automática validado
