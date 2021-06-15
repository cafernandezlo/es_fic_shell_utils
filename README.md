[![GitHub tag](https://img.shields.io/github/tag/cafernandezlo/es_fic_shell_utils.svg)](https://GitHub.com/cafernandezlo/es_fic_shell_utils/tags/)
[![GitHub license](https://img.shields.io/github/license/cafernandezlo/es_fic_shell_utils.svg)](https://github.com/cafernandezlo/es_fic_shell_utils/blob/master/LICENSE)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/cafernandezlo/es_fic_shell_utils/graphs/commit-activity)


# Repositorio con utilidades para shell

A lo largo de los años vas acumulando una serie de pequeños scripts que te facilitan algunas tareas cotidianas pero que no siempre guardas o documentas de manera adecuada. En este repositorio iré subiendo diferentes utilidades de shell para Ubuntu.

## latexSlides

De cara a mostrar durante la docencia o en algún congreso el uso de algún tipo de software/web es muy común realizar diferentes copias de pantalla consecutivas de pasos, secciones, etc. Una manera que he encontrado de montar después una presentación en LaTex de forma rápida es la siguiente:

**Pasos**

* Genera las copias de pantalla de forma consecutiva y guarda los ficheros resultantes con extensión png a disco. En mi caso al ser una máquina Ubuntu con locale en inglés, se llamarán _Screenshot*.png_
* En el fichero _begin_ he incluido una cabecera de presentación _beamer_ con el tema _Madrid_
* En el fichero _end_ he incluido una _slide_ de fin y el cierre del documento LaTex
* El fichero ejecutable _dotexslides.sh_ se encarga de hacer el crop de las imágenes de forma automática (recuerda ajustarlo a la posición de interés) y genera un fichero __slides.tex__ con la unión de _begin_, una _slide_ por cada imagen que encuentre en la carpeta y _end_. Además elimina imágenes cortadas previamente
* Tener ficheros de inicio y fin separados es buena idea por si es necesario modificar aspectos generales de la presentación.

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

Para ver el funcionamiento ejecuta el siguiente comando dentro del repositorio:

```
cfernandez~/git/es_fic_shell_utils_latexSlides> sh dotexslides.sh
```

y comprueba el fichero de salida _slides.tex_. Para ello solamente tendrás que usar, por ejemplo [overleaf](www.overleaf.com), crear un nuevo proyecto y subir los ficheros _slides.tex_ y todos los que comiencen por _crop_ de la carpeta donde has ejecutado la utilidad. 

## PDF. Reducir tamaño

A veces es necesario reducir el tamaño de algún documento pdf. Para ello, una opción rápida es cambiar los dpi entre _screen_ (72 dpi, calidad para ver en pantalla) y _prepress_ (300 dpi, alta calidad):

```
cfernandez:~> gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -sOutputFile=output.pdf input.pdf 
GPL Ghostscript 9.50 (2019-10-15)
Copyright (C) 2019 Artifex Software, Inc.  All rights reserved.
This software is supplied under the GNU AGPLv3 and comes with NO WARRANTY:
see the file COPYING for details.
Processing pages 1 through 11.
Page 1
Page 2
Page 3
Page 4
Page 5
Page 6
Page 7
Page 8
Page 9
Page 10
Page 11
```

Dependiendo del contenido del PDF puede ser suficiente. Más [info](https://www.ghostscript.com/doc/current/VectorDevices.htm).

## Compartir fichero en office365 y descargar por consola

Es posible compartir un fichero desde nuestras cuentas de office365 y que sea descargable por consola en lugar de acceder vía navegador usando, por ejemplo _wget_. 

**Pasos**

* Desde office365 selecciona el fichero y dale a compartir. Asegúrate de marcar la opción _cualquiera persona que tenga el vínculo_.
* Copia el enlace: [https://udcgal-my.sharepoint.com/:b:/g/personal/carlos_fernandez_udc_es/EV9lHD_omApEgSDT9ZT7Q9kBUUTVRRkktVebe5b2wQ2ONg?e=EX6QPM](https://udcgal-my.sharepoint.com/:b:/g/personal/carlos_fernandez_udc_es/EV9lHD_omApEgSDT9ZT7Q9kBUUTVRRkktVebe5b2wQ2ONg?e=EX6QPM)
* Quita lo que va después de la ?, en mi caso e=EX6QPM
* Añade después de la ? download=1, el nuevo enlace quedaría así: [https://udcgal-my.sharepoint.com/:b:/g/personal/carlos_fernandez_udc_es/EV9lHD_omApEgSDT9ZT7Q9kBUUTVRRkktVebe5b2wQ2ONg?download=1](https://udcgal-my.sharepoint.com/:b:/g/personal/carlos_fernandez_udc_es/EV9lHD_omApEgSDT9ZT7Q9kBUUTVRRkktVebe5b2wQ2ONg?download=1) 
* Lanza el _wget_

```
 cfernandez  ~  Downloads  wget https://udcgal-my.sharepoint.com/:b:/g/personal/carlos_fernandez_udc_es/EV9lHD_omApEgSDT9ZT7Q9kBUUTVRRkktVebe5b2wQ2ONg?download=1 -O fichero.pdf
--2021-06-15 14:13:03--  https://udcgal-my.sharepoint.com/:b:/g/personal/carlos_fernandez_udc_es/EV9lHD_omApEgSDT9ZT7Q9kBUUTVRRkktVebe5b2wQ2ONg?download=1
Resolving udcgal-my.sharepoint.com (udcgal-my.sharepoint.com)... 13.107.136.9
Connecting to udcgal-my.sharepoint.com (udcgal-my.sharepoint.com)|13.107.136.9|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: /personal/carlos_fernandez_udc_es/Documents/publico/itworks.pdf?originalPath=aHR0cHM6Ly91ZGNnYWwtbXkuc2hhcmVwb2ludC5jb20vOmI6L2cvcGVyc29uYWwvY2FybG9zX2Zlcm5hbmRlel91ZGNfZXMvRVY5bEhEX29tQXBFZ1NEVDlaVDdROWtCVVVUVlJSa2t0VmViZTViMndRMk9OZz9ydGltZT1DTENtN2ZZdjJVZw [following]
--2021-06-15 14:13:04--  https://udcgal-my.sharepoint.com/personal/carlos_fernandez_udc_es/Documents/publico/itworks.pdf?originalPath=aHR0cHM6Ly91ZGNnYWwtbXkuc2hhcmVwb2ludC5jb20vOmI6L2cvcGVyc29uYWwvY2FybG9zX2Zlcm5hbmRlel91ZGNfZXMvRVY5bEhEX29tQXBFZ1NEVDlaVDdROWtCVVVUVlJSa2t0VmViZTViMndRMk9OZz9ydGltZT1DTENtN2ZZdjJVZw
Reusing existing connection to udcgal-my.sharepoint.com:443.
HTTP request sent, awaiting response... 200 OK
Length: 7507 (7,3K) [application/pdf]
Saving to: ‘fichero.pdf’

fichero.pdf         100%[===================>]   7,33K  --.-KB/s    in 0s      

2021-06-15 14:13:04 (134 MB/s) - ‘fichero.pdf’ saved [7507/7507]
```
it works!

Este repositorio tiene licencia MIT.
