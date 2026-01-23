#  Capa SQL – Atlantic Flow Surf

Esta carpeta contiene toda la **arquitectura de datos en SQL Server** del proyecto **Atlantic Flow Surf**, diseñada como un **Data Warehouse analítico** para analizar ventas, servicios y quiebres de inventario en un negocio retail de surf con múltiples sucursales en España.

El objetivo principal de esta capa es **transformar un problema de negocio real** (demanda variable, estacionalidad y quiebres de stock) en **datos estructurados, coherentes y listos para análisis, visualización y predicción**.

---

##  Contexto de negocio

Atlantic Flow Surf opera en **tres ciudades costeras** con fuerte estacionalidad:
- San Sebastián  
- Santander  
- Fuerteventura  

El negocio combina:
- Venta de productos de surf  
- Clases de surf (servicio pedagógico)  
- Gestión de inventario multisucursal  

La complejidad del negocio exige responder preguntas como:
- ¿Cómo varía la demanda por temporada y ciudad?
- ¿Dónde y cuándo ocurren quiebres de stock?
- ¿Qué productos y servicios generan mayor margen?
- ¿Podemos anticipar problemas logísticos antes de que ocurran?

---

##  Arquitectura de datos

El modelo sigue un **esquema en estrella**, con:
- **Dimensiones**: tiempo, producto, sucursal, servicio, profesor, canal de venta y medio de pago.
- **Tablas de hechos** separadas para:
  - Ventas
  - Clases
  - Inventario

La granularidad está definida a nivel:
> **producto – sucursal – día**

Esto permite análisis detallados y modelos predictivos realistas.

---

##  Contenido de los scripts

Los archivos están numerados para indicar el **orden correcto de ejecución**:

| Archivo | Descripción |
|------|-------------|
| `01_creacion_base_datos.sql` | Creación de la base de datos |
| `02_dimensiones.sql` | Definición de tablas de dimensiones |
| `03_carga_dimensiones.sql` | Carga de datos maestros |
| `04_fact_ventas.sql` | Generación automática de ventas (3 años) |
| `05_fact_clases.sql` | Generación automática de clases y servicios |
| `06_fact_inventario.sql` | Generación automática de inventario y quiebres |
| `07_vistas_analiticas.sql` | Vistas listas para BI y análisis |
| `08_validaciones.sql` | Validaciones de calidad y coherencia |

---

##  Características clave del dataset

- Datos simulados con **lógica de negocio realista**
- Estacionalidad explícita (alta, media y baja)
- Volumen suficiente para análisis y predicción
- Quiebres de stock controlados (~12%)
- Dataset final preparado para Python y Power BI

---

##  Uso de esta capa

Esta capa SQL sirve como base para:
- Dashboards en Power BI  
- Análisis exploratorio en Python  
- Modelos predictivos de quiebre de stock  
- Storytelling analítico para toma de decisiones  

No es solo SQL: es **modelado de negocio aplicado a datos**.

---

##  Nota final

Este diseño prioriza:
- Claridad
- Escalabilidad
- Realismo
- Facilidad de consumo analítico

Es un ejemplo de cómo estructurar datos **pensando primero en el negocio y luego en la tecnología**.

