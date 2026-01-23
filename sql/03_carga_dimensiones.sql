-- =========================
-- DIM_TIEMPO
-- =========================
DECLARE @Fecha DATE = '2022-01-01';

WHILE @Fecha <= '2024-12-31'
BEGIN
    INSERT INTO Dim_Tiempo
    VALUES (
        @Fecha,
        YEAR(@Fecha),
        MONTH(@Fecha),
        DATENAME(MONTH, @Fecha),
        DATEPART(WEEK, @Fecha),
        DAY(@Fecha),
        DATENAME(WEEKDAY, @Fecha),
        CASE WHEN DATENAME(WEEKDAY, @Fecha) IN ('Saturday','Sunday') THEN 1 ELSE 0 END,
        CASE
            WHEN MONTH(@Fecha) BETWEEN 6 AND 9 THEN 'Alta'
            WHEN MONTH(@Fecha) IN (4,5,10) THEN 'Media'
            ELSE 'Baja'
        END
    );
    SET @Fecha = DATEADD(DAY,1,@Fecha);
END;

-- =========================
-- DIM_SUCURSAL
-- =========================
INSERT INTO Dim_Sucursal VALUES
('San Sebastián','País Vasco','Urbana','Destino'),
('Santander','Cantabria','Urbana','Hub'),
('Fuerteventura','Canarias','Turística','Destino');

-- =========================
-- DIM_MEDIO_PAGO
-- =========================
INSERT INTO Dim_Medio_Pago VALUES
('Tarjeta'),('Efectivo'),('Transferencia'),('Pago Online');

-- =========================
-- DIM_CANAL_VENTA
-- =========================
INSERT INTO Dim_Canal_Venta VALUES
('Tienda física'),('Online'),('Venta personalizada');
