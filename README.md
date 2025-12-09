# Proyecto-3-SIG

# Proyecto 3 – Mapa cantonal en TileMill

## Cantón e integrantes

- **Cantón asignado:** Pérez Zeledón
- **Integrantes:**
  - Anthony Fuentes
  - Matthew Cordero

---

## 1. Organización inicial del proyecto

- Se creó el proyecto de QGIS **`proyecto_pz.qgz`** dentro de la carpeta del curso.
- Se organizaron los datos en carpetas (a nivel de sistema de archivos):
  - `Geo_CR/` (datos originales del curso).
  - `Proyecto-3-SIG/raster/` (salida de DEM y hillshade).
  - `Proyecto-3-SIG/procesados/` (capas recortadas al cantón).

---

## 2. Capas base cargadas en QGIS

Desde la carpeta **Geo_CR** se cargaron las capas vectoriales originales para Costa Rica:

- `geo_provincias.shp`
- `geo_cantones.shp`
- `geo_distritos.shp`
- `geo_carreter.shp`
- `geo_rios.shp`
- `geo_poblados.shp`
- `escuelasdiurnas2008.shp`
- `hospitales2008crtm05.shp`
- `clinicas2008crtm05.shp`
- `gasolineras2008crtm05.shp`
- `hoteles2008crtm05.shp`
- `agenbancos2008crtm05.shp`
- `geo_hitos.shp` (puntos de altitud, campo **ELEVACION**)

---

## 3. Generación del cantón de trabajo

1. En la capa `geo_cantones` se abrió la tabla de atributos y se seleccionó el registro cuyo nombre de cantón es **“Pérez Zeledón”**.
2. Se exportó la selección como nueva capa:
   - **Salida:** `canton_perez_zeledon.shp`
   - Ubicación: `Proyecto-3-SIG/procesados/`
3. Se verificó visualmente que la nueva capa contiene únicamente el polígono del cantón Pérez Zeledón.

---

## 4. Recorte de capas al cantón Pérez Zeledón

Usando **Vectorial → Herramientas de geoprocesamiento → Recortar (Clip)**, con:

- **Capa de recorte:** `canton_perez_zeledon.shp`
- **Capas de entrada:** capas nacionales de Costa Rica.

Se generaron las siguientes capas recortadas (todas en `Proyecto-3-SIG/procesados/`):

- `distritos_pz.shp` ← recorte de `geo_distritos.shp`
- `carreteras_pz.shp` ← recorte de `geo_carreter.shp`
- `rios_pz.shp` ← recorte de `geo_rios.shp`
- `poblados_pz.shp` ← recorte de `geo_poblados.shp`
- `escuelas_pz.shp` ← recorte de `escuelasdiurnas2008.shp`
- `hospitales_pz.shp` ← recorte de `hospitales2008crtm05.shp`
- `clinicas_pz.shp` ← recorte de `clinicas2008crtm05.shp`
- `gasolineras_pz.shp`← recorte de `gasolineras2008crtm05.shp`
- `hoteles_pz.shp` ← recorte de `hoteles2008crtm05.shp`
- `bancos_pz.shp` ← recorte de `agenbancos2008crtm05.shp`

Estas capas representan únicamente la información contenida dentro del cantón Pérez Zeledón.

---

## 5. Generación del modelo de elevación (DEM) de Costa Rica

A partir de la capa de puntos **`geo_hitos.shp`**:

1. Se verificó que el campo de altitud es **`ELEVACION`**.
2. Se aplicó el algoritmo **Interpolación TIN** (`Procesos → Interpolación TIN`) con:
   - **Capa Vector:** `geo_hitos`
   - **Atributo de interpolación:** `ELEVACION`
   - Se añadió la combinación `geo_hitos / ELEVACION` en la tabla de capas de entrada.
   - **Método de interpolación:** Lineal
   - **Extensión:** tomada de la capa `geo_provincias` (toda Costa Rica).
   - **Tamaño X de píxel:** `0.01`
   - **Tamaño Y de píxel:** `0.01`
   - **Salida ráster:** `Proyecto-3-SIG/raster/dem_cr.tif`
3. Se cargó automáticamente la capa ráster **`dem_cr`**, que representa el Modelo Digital de Elevación para Costa Rica.

---

## 6. Generación del mapa de sombras (Hillshade)

Con la capa `dem_cr`:

1. Se utilizó **Ráster → Análisis del terreno → Mapa de Sombras (Hillshade)**.
2. Parámetros principales:
   - **Capa de entrada:** `dem_cr`
   - **Factor Z:** `1.0`
   - **Escala:** `1.0`
   - **Azimut de la luz:** `315°`
   - **Altitud de la luz:** `45°`
   - Resto de parámetros por defecto.
3. **Archivo de salida:** `Proyecto-3-SIG/raster/hillshade_cr.tif`
4. Se cargó la capa **`hillshade_cr`**, que se está utilizando como fondo de relieve detrás del cantón Pérez Zeledón.

---

## 7. Generación del mapa de sombras (Hillshade)

Con la capa `dem_cr`:

1. Se utilizó **Ráster → Análisis del terreno → Mapa de Sombras (Hillshade)**.
2. Parámetros principales:
   - **Capa de entrada:** `dem_cr`
   - **Factor Z:** `1.0`
   - **Escala:** `1.0`
   - **Azimut de la luz:** `315°`
   - **Altitud de la luz:** `45°`
   - Resto de parámetros por defecto.
3. **Archivo de salida:** `Proyecto-3-SIG/raster/hillshade_cr.tif`
4. Se cargó la capa **`hillshade_cr`**, que se está utilizando como fondo de relieve detrás del cantón Pérez Zeledón.
