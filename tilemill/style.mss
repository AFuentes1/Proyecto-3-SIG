/* Fondo general */
Map {
  background-color: #b8dee6; /* Azul claro por si el raster no cubre */
}

/* Raster base */
#hillshadepz {  /* Asume ID #hillshade */
  raster-opacity: 1;
}

/* Polígonos: Bordes distintos, sin relleno, etiquetas en zoom alto */
#canton_perez_zeledon {  /* Borde azul dashed */
  line-color: #0000FF;
  line-width: 1.5;
  line-dasharray: 5,2; /* Dashed */
  polygon-opacity: 0;
  [zoom >= 11] {
    text-name: '[NCANTON]';
    text-face-name: 'Arial Italic';
    text-size: 12;
    text-fill: #006;
    text-halo-fill: #fff;
    text-halo-radius: 1;
  }
}

#distritos_pz {  /* Borde gris fino */
  line-color: #808080;
  line-width: 1;
  polygon-opacity: 0;
  [zoom >= 12] {
    text-name: '[NDISTRITO]';
    text-face-name: 'Arial Regular';
    text-size: 10;
    text-fill: #444;
    text-halo-fill: #fff;
    text-halo-radius: 1;
    text-allow-overlap: false;
  }
}

#parques_pz {  /* Zonas verdes con transparencia */
  polygon-fill: #00FF00; /* Verde */
  polygon-opacity: 0.5; /* Transparente */
  line-color: #008000;
  line-width: 0.5;
  [zoom >= 13] {
    text-name: '[name]'; /* Campo de OSM */
    text-face-name: 'Arial Regular';
    text-size: 10;
    text-fill: #228B22;
  }
}

/* Líneas: Colores por tipo, etiquetas curvas, aparecen en zoom medio */
#rios_pz {
  [zoom >= 12] {
    line-color: #0000FF; /* Azul para ríos */
    line-width: 1;
    text-name: '[NOMBRE]';
    text-placement: line; /* Sigue la curva */
    text-face-name: 'Arial Italic';
    text-size: 10;
    text-fill: #0000CD;
  }
}

#carreteras_pz {
  [zoom >= 11] {
    line-width: 2;
    line-color: #FF0000; /* Rojo por default */
    [TIPO = 'CARRETERA NACIONAL'] { line-color: #FF0000; line-width: 3; } /* Ajusta campo y valores */
    [TIPO = 'CARRETERA CANTONAL'] { line-color: #FFA500; line-width: 2; }
    text-name: '[CODIGO]';
    text-placement: line;
    text-face-name: 'Arial Bold';
    text-size: 11;
  }
}

#calles_osm_pz {
  [zoom >= 13] {
    line-width: 1.5;
    line-color: #A52A2A; /* Marrón para calles OSM */
    text-name: '[osm_id]';
    text-placement: line;
    text-face-name: 'Arial Regular';
    text-size: 10;
  }
}

/* Puntos: Símbolos representativos, etiquetas en zoom alto */
#poblados_pz {
  [zoom >= 14] {
    marker-width: 6;
    marker-fill: #FFD700; /* Amarillo */
    marker-line-color: #000;
    marker-allow-overlap: true;
    text-name: '[NOMBRE]';
    text-face-name: 'Arial Regular';
    text-size: 10;
    text-dy: 8; /* Desplaza etiqueta abajo */
  }
}

#escuelas_pz {
  [zoom >= 14] {
    marker-width: 8;
    marker-fill: #00BFFF; /* Azul claro */
    marker-line-color: #000;
    marker-file: url('icons/escuela.svg'); /* Descarga un SVG gratis de flaticon.com y pon en carpeta icons/ */
    text-name: '[NOMBRE]';
    text-face-name: 'Arial Bold';
    text-size: 10;
    text-dy: 10;
  }
}

#hospitales_pz {
  [zoom >= 14] {
    marker-width: 10;
    marker-fill: #FF0000; /* Rojo */
    marker-line-color: #FFF;
    marker-file: url('icons/hospital.svg');
    text-name: '[NOMBRE]';
    text-face-name: 'Arial Regular';
    text-size: 11;
  }
}

#clinicas_pz {  /* Similar pero diferente símbolo */
  [zoom >= 14] {
    marker-width: 8;
    marker-fill: #FF69B4; /* Rosa */
    marker-file: url('icons/clinica.svg');
  }
}

#gasolineras_pz {
  [zoom >= 15] {
    marker-width: 7;
    marker-fill: #FFA500;
    marker-file: url('icons/gasolinera.svg');
  }
}

#hoteles_pz {
  [zoom >= 15] {
    marker-width: 8;
    marker-fill: #4B0082;
    marker-file: url('icons/hotel.svg');
  }
}

#bancos_pz {
  [zoom >= 15] {
    marker-width: 7;
    marker-fill: #008000;
    marker-file: url('icons/banco.svg');
  }
}

#comercios_pz {
  [zoom >= 15] {
    marker-width: 6;
    marker-fill: #FFFF00; /* Amarillo */
    text-name: '[name_es]';
    text-face-name: 'Arial Regular';
    text-size: 9;
    text-dy: 8;
  }
}