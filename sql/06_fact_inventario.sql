/*
06_fact_inventario.sql
Simulación de inventario y quiebres
*/

CREATE TABLE Fact_Inventario (
    inventario_id INT IDENTITY PRIMARY KEY,
    tiempo_id INT,
    sucursal_id INT,
    producto_id INT,
    stock_disponible INT,
    stock_minimo INT
);

-- Script con probabilidad de quiebre (~10–12%)
