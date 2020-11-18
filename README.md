[![GitHub tag](https://img.shields.io/github/tag/cafernandezlo/es_fic_shell_utils.svg)](https://GitHub.com/cafernandezlo/es_fic_shell_utils/tags/)
[![GitHub license](https://img.shields.io/github/license/cafernandezlo/es_fic_shell_utils.svg)](https://github.com/cafernandezlo/es_fic_shell_utils/blob/master/LICENSE)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/cafernandezlo/es_fic_shell_utils/graphs/commit-activity)


# Repositorio con utilidades para shell

A lo largo de los años vas acumulando una serie de pequeños scripts que te facilitan algunas tareas cotidianas pero que no siempre guardas o documentas de manera adecuada. En este repositorio iré subiendo diferentes utilidades de shell para Ubuntu.

## latexSlides

De cara a mostrar durante la docencia o en algún congreso el uso de algún tipo de software/web es muy común realizar diferentes copias de pantalla consecutivas de pasos, secciones, etc. Una manera que he encontrado de montar después una presentación en LaTex de forma rápida es la siguiente:

**Pasos**

* Genera las copias de pantalla de forma consecutiva y guarda los ficheros resultantes *.png a disco. En mi caso al ser una máquina Ubuntu con locale en inglés, se llamarán _Screenshot*.png_
* En el fichero _begin_ he incluido una cabecera de presentación _beamer_ con el tema _Madrid_
* En el fichero _end_ he incluido una _slide_ de fin y el cierre del documento LaTex
* El fichero ejecutable _dotexslides.sh_ se encarga de hacer el crop de las imágenes de forma automática (recuerda ajustarlo a la posición de interés) y genera un fichero __slides.tex__ con la unión de _begin_, una _slide_ por cada imagen que encuentre en la carpeta y _end_

Para cambiar tamaños y posiciones de corte en la copia de pantalla y reducir espacio e información no interesante hay que modificar en _dotexslides.sh_ lo siguiente:

```
convert "$(basename "$file")" -crop 1910x1060+0+150 "$(basename "crop $file")"
```

se utiliza la herramienta _convert_ de **ImageMagick**:

```
cfernandez~>convert -version
Version: ImageMagick 6.9.10-23 Q16 x86_64 20190101 https://imagemagick.org
Copyright: © 1999-2019 ImageMagick Studio LLC
License: https://imagemagick.org/script/license.php
Features: Cipher DPC Modules OpenMP 
Delegates (built-in): bzlib djvu fftw fontconfig freetype jbig jng jpeg lcms lqr ltdl lzma openexr pangocairo png tiff webp wmf x xml zlib
```

La ayuda de [convert](https://www.imagemagick.org/script/command-line-options.php#crop). En este caso con la resolución de mi pantalla y el aspecto de mi región de interés se ajusta: _anchoxalto+offsetX+offsetY_ de acuerdo a la esquina izquierda superior de la imagen.

Este repositorio tiene licencia MIT.
