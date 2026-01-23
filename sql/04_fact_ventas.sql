-- =========================
-- FACT_VENTAS (Generación automática)
-- =========================

DECLARE 
    @Fecha DATE = '2022-01-01',
    @SucursalID INT,
    @VentasDia INT,
    @i INT;

WHILE @Fecha <= '2024-12-31'
BEGIN
    SET @SucursalID = 1;
    WHILE @SucursalID <= 3
    BEGIN
        SET @VentasDia = CASE
            WHEN MONTH(@Fecha) BETWEEN 6 AND 9 THEN 15 + ABS(CHECKSUM(NEWID())) % 6
            WHEN MONTH(@Fecha) IN (4,5,10) THEN 8 + ABS(CHECKSUM(NEWID())) % 5
            ELSE 3 + ABS(CHECKSUM(NEWID())) % 4
        END;

        SET @i = 1;
        WHILE @i <= @VentasDia
        BEGIN
            INSERT INTO Fact_Ventas
            SELECT
                t.tiempo_id,
                @SucursalID,
                p.producto_id,
                1 + ABS(CHECKSUM(NEWID())) % 3,
                1 + ABS(CHECKSUM(NEWID())) % 4,
                1 + ABS(CHECKSUM(NEWID())) % 3,
                p.precio_base,
                p.precio_base * (1 + ABS(CHECKSUM(NEWID())) % 3),
                p.coste_unitario * (1 + ABS(CHECKSUM(NEWID())) % 3),
                (p.precio_base - p.coste_unitario) * (1 + ABS(CHECKSUM(NEWID())) % 3)
            FROM Dim_Tiempo t
            CROSS APPLY (SELECT TOP 1 * FROM Dim_Producto ORDER BY NEWID()) p
            WHERE t.fecha = @Fecha;

            SET @i += 1;
        END;
        SET @SucursalID += 1;
    END;
    SET @Fecha = DATEADD(DAY,1,@Fecha);
END;
