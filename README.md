# Optimización de Demanda e Inventario en un Negocio Retail de Surf Multisucursal

## 📌 Descripción del proyecto
Este proyecto aborda la optimización de la demanda y la gestión de inventarios de **Atlantic Flow Surf**, un negocio ficticio del sector surf que opera con múltiples sucursales en España y combina venta de productos, alquiler de equipos y servicios pedagógicos (clases de surf).

El objetivo es **anticipar la demanda futura**, reducir quiebres de stock y apoyar la toma de decisiones estratégicas mediante el uso de **análisis de datos, modelos predictivos y visualización ejecutiva**.

---

## 🏄‍♂️ Contexto del negocio
Atlantic Flow Surf cuenta con tres sucursales ubicadas en:

- San Sebastián  
- Santander  
- Fuerteventura  

Cada ciudad presenta **condiciones geográficas, estacionales y logísticas distintas**, lo que genera desafíos en la planificación de inventarios, la asignación de recursos y la coordinación entre sucursales.

---

## 🎯 Objetivos del proyecto
- Analizar el comportamiento histórico de ventas y servicios por ciudad.
- Identificar patrones de estacionalidad y demanda.
- Detectar productos con alto riesgo de quiebre de stock.
- Predecir la demanda futura por producto y sucursal.
- Optimizar la gestión de inventarios y la redistribución entre tiendas.
- Apoyar la toma de decisiones mediante dashboards claros y accionables.

---

## ❓ Preguntas de negocio clave
1. ¿Cómo varía la demanda de productos y clases de surf a lo largo del año en cada ciudad?
2. ¿Qué productos presentan mayor riesgo de quiebre de stock en cada sucursal?
3. ¿En qué periodos del año se concentran más quiebres de stock?
4. ¿Cuál es el impacto económico de los quiebres de stock en las ventas?
5. ¿Qué diferencias de demanda existen entre sucursales y cómo afectan a la planificación de inventarios?
6. ¿Cuánta demanda se espera por producto y ciudad en las próximas semanas?
7. ¿Qué productos presentan mayor riesgo de quiebre según la demanda prevista?
8. ¿Cuándo conviene redistribuir inventario entre sucursales en lugar de realizar nuevas compras?

---

## 🧱 Arquitectura del proyecto
El proyecto sigue un enfoque **end-to-end**, integrando distintas herramientas a lo largo del flujo analítico:

- **SQL Server**
  - Modelado de datos relacional
  - Dimensión tiempo y estacionalidad
  - Consultas analíticas y vistas

- **Python**
  - Limpieza y transformación de datos
  - Feature engineering temporal
  - Modelos de predicción de demanda

- **Power BI**
  - Dashboards ejecutivos y operativos
  - KPIs de demanda e inventario
  - Comparación entre demanda real y predicha

---

## 🛠️ Herramientas utilizadas
- SQL Server  
- Python (pandas, numpy, scikit-learn)  
- Power BI  
- GitHub  

---

## 📈 Resultados esperados
- Reducción del riesgo de quiebres de stock.
- Mejor planificación estacional de inventarios.
- Optimización del stock por ciudad.
- Soporte analítico para decisiones estratégicas del negocio.

---

## 📁 Estructura del repositorio
```text
/branding
/datasets
/sql
/python
/powerbi
README.md
