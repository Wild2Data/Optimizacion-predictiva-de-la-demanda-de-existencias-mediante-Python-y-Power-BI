/*
========================================================
08_validaciones.sql
========================================================
Objetivo:
Validar la coherencia, volumen y lógica de negocio
del Data Warehouse AtlanticFlowSurfDW.

Este script verifica:
- Volumen de datos
- Distribución temporal
- Estacionalidad
- Ventas, clases e inventario
- Quiebres de stock
- Dataset final para predicción

Debe ejecutarse DESPUÉS de:
01 ? 07
========================================================
*/

USE AtlanticFlowSurfDW;
GO

/* ======================================================
1. VALIDACIÓN GENERAL DE VOLUMEN
====================================================== */

SELECT 'Dim_Tiempo' AS tabla, COUNT(*) AS total_filas FROM Dim_Tiempo
UNION ALL
SELECT 'Dim_Producto', COUNT(*) FROM Dim_Producto
UNION ALL
SELECT 'Dim_Sucursal', COUNT(*) FROM Dim_Sucursal
UNION ALL
SELECT 'Fact_Ventas', COUNT(*) FROM Fact_Ventas
UNION ALL
SELECT 'Fact_Clases', COUNT(*) FROM Fact_Clases
UNION ALL
SELECT 'Fact_Inventario', COUNT(*) FROM Fact_Inventario;


/* ======================================================
2. VALIDACIÓN TEMPORAL
====================================================== */

SELECT 
    MIN(fecha) AS fecha_inicio,
    MAX(fecha) AS fecha_fin,
    COUNT(*) AS total_dias
FROM Dim_Tiempo;


/* ======================================================
3. VALIDACIÓN DE VENTAS
====================================================== */

-- Ventas por año
SELECT 
    t.anio,
    COUNT(*) AS total_registros,
    SUM(v.ingreso_total) AS ventas_totales
FROM Fact_Ventas v
JOIN Dim_Tiempo t ON v.tiempo_id = t.tiempo_id
GROUP BY t.anio
ORDER BY t.anio;

-- Ventas por temporada
SELECT 
    t.temporada_comercial,
    COUNT(*) AS total_ventas
FROM Fact_Ventas v
JOIN Dim_Tiempo t ON v.tiempo_id = t.tiempo_id
GROUP BY t.temporada_comercial;

-- Ventas por sucursal
SELECT 
    s.ciudad,
    SUM(v.ingreso_total) AS ventas_totales
FROM Fact_Ventas v
JOIN Dim_Sucursal s ON v.sucursal_id = s.sucursal_id
GROUP BY s.ciudad
ORDER BY ventas_totales DESC;


/* ======================================================
4. VALIDACIÓN DE CLASES
====================================================== */

-- Clases por temporada
SELECT 
    t.temporada_comercial,
    COUNT(*) AS total_clases
FROM Fact_Clases c
JOIN Dim_Tiempo t ON c.tiempo_id = t.tiempo_id
GROUP BY t.temporada_comercial;

-- Ocupación promedio
SELECT 
    AVG(CAST(asistentes AS FLOAT) / capacidad) AS ocupacion_promedio
FROM Fact_Clases;

-- Margen por profesor
SELECT 
    p.nombre_profesor,
    SUM(c.margen) AS margen_total
FROM Fact_Clases c
JOIN Dim_Profesor p ON c.profesor_id = p.profesor_id
GROUP BY p.nombre_profesor
ORDER BY margen_total DESC;


/* ======================================================
5. VALIDACIÓN DE INVENTARIO
====================================================== */

-- Total de registros
SELECT COUNT(*) AS total_registros_inventario
FROM Fact_Inventario;

-- Quiebres de stock
SELECT COUNT(*) AS total_quiebres
FROM Fact_Inventario
WHERE stock_disponible < stock_minimo;

-- Porcentaje de quiebre
SELECT 
    CAST(
        100.0 * SUM(CASE WHEN stock_disponible < stock_minimo THEN 1 ELSE 0 END)
        / COUNT(*) 
    AS DECIMAL(5,2)
) AS porcentaje_quiebre
FROM Fact_Inventario;

-- Quiebres por categoría
SELECT 
    p.categoria,
    COUNT(*) AS quiebres
FROM Fact_Inventario i
JOIN Dim_Producto p ON i.producto_id = p.producto_id
WHERE i.stock_disponible < i.stock_minimo
GROUP BY p.categoria
ORDER BY quiebres DESC;


/* ======================================================
6. VALIDACIÓN DE VISTAS ANALÍTICAS
====================================================== */

-- Vista ventas
SELECT TOP 10 * FROM vw_ventas_analiticas;

-- Vista inventario
SELECT TOP 10 * FROM vw_inventario_quiebres;

-- Vista dataset predicción
SELECT COUNT(*) AS total_filas_dataset
FROM vw_dataset_prediccion;

-- Días sin ventas (esperable > 50%)
SELECT COUNT(*) AS dias_sin_ventas
FROM vw_dataset_prediccion
WHERE unidades_vendidas = 0;

-- Balance de la variable objetivo
SELECT 
    quiebre_stock,
    COUNT(*) AS registros
FROM vw_dataset_prediccion
GROUP BY quiebre_stock;

-- Ventas promedio según quiebre
SELECT 
    quiebre_stock,
    AVG(unidades_vendidas) AS ventas_promedio
FROM vw_dataset_prediccion
GROUP BY quiebre_stock;


/* ======================================================
FIN DE VALIDACIONES
====================================================== */
