-- =========================
-- VISTA VENTAS ANALÍTICAS
-- =========================
CREATE VIEW vw_ventas_analiticas AS
SELECT
    t.fecha, t.anio, t.mes, t.nombre_mes, t.semana_anio, t.temporada_comercial,
    s.ciudad, s.region,
    p.nombre_producto, p.categoria, p.marca,
    cv.canal_venta, mp.medio_pago,
    v.cantidad, v.ingreso_total, v.margen
FROM Fact_Ventas v
JOIN Dim_Tiempo t ON v.tiempo_id = t.tiempo_id
JOIN Dim_Sucursal s ON v.sucursal_id = s.sucursal_id
JOIN Dim_Producto p ON v.producto_id = p.producto_id
JOIN Dim_Canal_Venta cv ON v.canal_venta_id = cv.canal_venta_id
JOIN Dim_Medio_Pago mp ON v.medio_pago_id = mp.medio_pago_id;
