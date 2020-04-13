# OpenSwab - Hisopo Nasofaringeal (NP) para COVID-19

[![CC BY-SA 4.0][cc-by-sa-shield]][cc-by-sa]

[English Version](README.en.md)

## Descripción

<img src="doc/images/openswabs-standing.png" align="right" width="190" alt="OpenSwab Render">

OpenSwab es un prototipo de hisopo nasofaringeal (NP) diseñado para recolectar
muestras y realizar pruebas de COVID-19.

Es un hisopo fino y flexible, el cual es insertado en la cavidad nasal de forma
paralela a la parte inferior de la fosa nasal hasta que la cabeza del hisopo
toque la pared de la nasofaringe. Al llegar a la pared, se procede a realizar
pequeñas rotaciones de forma que la cabeza del hisopo recolecte el material
biológico requerido para proceder a realizar la prueba COVID-19.

Los hisopos utilizados para pruebas COVID-19 no pueden estar hechos de
materiales como algodón o madera, ya que los mismos afectan el ARN de la
muestra tomada.

Debido a la precisión y exactitud requerida, este hisopo fue diseñado para ser
impreso por una impresora 3D de tecnología SLA (Estereolitografía) utilizando
resina de curado ultravioleta (UV) biocompatible de Clase I (uso de corto plazo)
resistente al calor para su posterior esterilización en un autoclave.

Al momento de escribir este artículo, existe una escasez global de equipo de
protección personal y otros suministros médicos, incluidos los hisopos de
prueba. Este hisopo fue diseñado y creado en un esfuerzo por proporcionar una
posible solución a este problema.

La propiedad intelectual de este diseño se encuentra bajo una licencia
[CC BY-SA 4.0][cc-by-sa] por lo que puede ser utilizado, producido, modificado
y comercializado libremente. Puede referirse a la sección de licencia o
contactar al equipo de OpenSwab para más información.

Actualmente este prototipo está siendo revisado por autoridades de salud junto
con otros diseños. Sin embargo, no ha sido probado, validado o aprobado por
ninguna organización.

<br clear="right"/>


## Especificaciones Técnicas

OpenSwab ofrece dos versiones de cabeza para la recolección de muestras,
denominadas "Bristle" y "Pyramid", así como dos variantes del punto de quiebre,
para un total de cuatro modelos.

<p align="center">
    <img src="doc/images/openswab-heads.png" alt="OpenSwab Heads">
</p>


| Modelo             | Bristle 80      | Bristle 95      | Pyramid 80                   | Pyramid 95                   |
| ------------------ | --------------- | --------------- | ---------------------------- | ---------------------------- |
| *Público meta*     | Adulto          | Adulto          | Adulto                       | Adulto                       |
| *Uso*              | Nasofaringeal   | Nasofaringeal   | Nasofaringeal                | Nasofaringeal                |
| *Altura total*     |         145.0mm |         145.0mm |                      145.0mm |                      145.0mm |
| *Material*         | Resina UV 405nm | Resina UV 405nm | Resina UV 405nm              | Resina UV 405nm              |
| *Esterilización*   | Autoclave       | Autoclave       | Autoclave                    | Autoclave                    |
|                                      **Cabeza**                                                                      |
| *Textura*          | Hojuela         | Hojuela         | Pirámide truncada            | Pirámide truncada            |
| *Patrón*           | Helicoidal      | Helicoidal      | Helicoidal                   | Helicoidal                   |
| *Terminación*      | Esférica        | Esférica        | Toroide con estrella convexa | Toroide con estrella convexa |
| *Diámetro interno* |          0.75mm |          0.75mm |                       0.75mm |                       0.75mm |
| *Diámetro externo* |           2.0mm |           2.0mm |                        2.0mm |                        2.0mm |
| *Largo*            |          20.0mm |          20.0mm |                       20.0mm |                       20.0mm |
|                                      **Cuello flexible**                                                             |
| *Diámetro*         |          1.25mm |          1.25mm |                       1.25mm |                       1.25mm |
| *Largo*            |          30.0mm |          30.0mm |                       30.0mm |                       30.0mm |
|                                      **Cuerpo**                                                                      |
| *Diámetro*         |           2.5mm |           2.5mm |                        2.5mm |                        2.5mm |
| *Largo*            |          95.0mm |          95.0mm |                       95.0mm |                       95.0mm |
| *Punto de quiebre* |          80.0mm |          95.0mm |                       80.0mm |                       95.0mm |

Todas estas dimensiones son fácilmente configurables.
Ver sección de [Configuración del Producto](#configuracion-del-producto).


## Características del Producto

- Punto de Quiebre: El hisopo cuenta con un punto de quiebre que funciona como
  guía visual para indicarle al personal médico la distancia máxima promedio
  (80mm) hasta donde se debe introducir el hisopo para alcanzar la pared de la
  nasofaringe en adultos.

  El personal médico debe evitar manipular el hisopo pasando del punto de
  quiebre, tanto para evitar la contaminación de la muestra como para prevenir
  cualquier tipo de exposición.

  Al finalizar la toma de la muestra, el punto de quiebre permite separar
  la parte del hisopo que se encarga de la recolección del material biológico
  para así almacenarla en el tubo de muestra.

- Material de Construcción: Los hisopos utilizados para pruebas COVID-19 no
  pueden estar hechos de materiales como algodón o madera, ya que los mismos
  afectan el ARN (Ácido Ribonucléico) de la muestra tomada.

  Es por eso que OpenSwab está diseñado para ser impreso en una impresora 3D de
  tecnología SLA (Estereolitografía) utilizando resina de curado ultravioleta
  (UV) biocompatible de Clase I (uso de corto plazo) resistente al calor para
  su posterior esterilización en un autoclave.

- Diseño anatómico: Hisopo diseñado con un cuello delgado y flexible que se
  adapta a las fosas nasales del paciente por lo que se reduce el malestar y
  facilita el posicionamiento de la cabeza en el lugar adecuado por parte del
  personal médico. La cabeza cuenta además con un patrón helicoidal que
  facilita la introducción, el retiro y la acción giratoria propia del frotis.

- Diseño ergonómico: Pensado en un diámetro y largo adecuado para su
  manipulación por parte del personal encargado de la prueba.

- Fácil configuración de dimensiones: OpenSwab está diseñado de forma que los
  parámetros de las dimensiones del hisopo sean fácilmente configurables según
  sea necesario, lo que permitirá en el futuro crear una versión especial para
  niños y niñas.

- Facilidad de producción: OpenSwab puede fabricarse con impresoras 3D de
  tecnología SLA comerciales accesibles como la Anycubic Photon o la Creality
  LD-002R. El largo del hisopo es compatible con la gran mayoría del área de
  impresión de éstas impresoras, que normalmente soportan un máximo de 150mm de
  altura.


## Fabricación

Los archivos `exports/openswab-*.stl` contienen las versiones exportadas de los
modelos 3D en formato STL listos para ser impresos. El archivo
[`exports/openswab-all-models.stl`](exports/openswab-all-models.stl) contiene
un arreglo con las 4 versiones de OpenSwab en caso de ser requerido.

Las *estimaciones* de fabricación de un lote de OpenSwabs en diferentes
impresoras 3D se listan a continuación:

### Creality LD-002R

- **Tamaño de cama de impresión:** *120 x 68 x 160mm*.
- **Tamaño del lote:** *18x10*.
- **Cantidad de hisopos producidos:** *180*.
- **Recina requerida:** *96.7ml*.
- **Tiempo de impresión:** *13h0m54s*.

### Anycubic Photon

- **Tamaño de cama de impresión:** *120 × 68 × 150mm*.
- **Tamaño del lote:** *18x10*.
- **Cantidad de hisopos producidos:** *180*.
- **Recina requerida:** *96.7ml*.
- **Tiempo de impresión:** *12h6m50s*.

<p align="center">
    <img src="doc/images/slicer-grid.png" alt="Batch of OpenSwabs">
</p>


## Configuración del Producto

OpenSwab fue diseñado en su totalidad utilizando el Software Libre
[OpenSCAD](https://www.openscad.org/), por lo que para su modificación o
reproducción no se requiere de la adquisición de licencias de Software de pago.

El archivos fuente de los diseños se encuentra en este repositorio con una
extensión `.scad`. El archivo principal es [`custom.scad`](custom.scad) y al
abrirlo se pueden modificar todos los parámetros del mismo fácilmente desde la
ventana del customizador.

<p align="center">
    <img src="doc/images/customizer.png" alt="OpenSwab in OpenSCAD Customizer">
</p>


## Referencias

- Interim Guidelines for Collecting, Handling, and Testing Clinical Specimens
  from Persons for Coronavirus Disease 2019 (COVID-19) (10 de abril de 2020).
  https://www.cdc.gov/coronavirus/2019-nCoV/lab/guidelines-clinical-specimens.html

- Centers for Disease Control and Prevention (CDC) Pertussis Testing Video:
  Collecting a Nasopharyngeal Swab Clinical Specimen (10 de abril de 2020).
  https://youtu.be/zqX56LGItgQ

- How to Collect Nasopharyngeal Samples for Flu Testing (Dr. Bonner Series)
  (10 de abril de 2020). https://youtu.be/v5A4H9q4JVA

- NETEC: COVID-19 Laboratory Specimen Collection: Nasopharyngeal Swab - Flyer
  and Validation Checklist (10 de abril de 2020).
  https://repository.netecweb.org/items/show/894

- NETEC: COVID-19 Laboratory Specimen Collection: Nasopharyngeal Swab
  (10 de abril de 2020). https://repository.netecweb.org/items/show/840


## Licencia

La propiedad intelectual de este diseño se encuentra bajo una licencia
internacional [CC BY-SA 4.0][cc-by-sa] por lo que puede ser utilizado,
fabricado, reproducido, modificado y comercializado libremente.

Todo trabajo derivado debe indicar "Basado en OpenSwab" y un link al sitio web
https://github.com/kuralabs/openswab, así como ser compartido bajo los mismos
términos de uso.

OpenSwab fue diseñado en su totalidad utilizando el Software Libre
[OpenSCAD](https://www.openscad.org/), por lo que para su impresión y
modificación no se requiere de la adquisición de licencias de Software de pago.

OpenSwab fue diseñado desde cero en Costa Rica utilizando criterios médicos
conocidos y en práctica.

```
Copyright (C) 2020 KuraLabs S.R.L

Usted acepta y acuerda estar obligado por los términos y condiciones de esta
Licencia Internacional Pública de Atribución/Reconocimiento-CompartirIgual 4.0
de Creative Commons ("Licencia Pública"). En la medida en que esta Licencia
Pública pueda ser interpretada como un contrato, a Usted se le otorgan los
Derechos Licenciados en consideración a su aceptación de estos términos y
condiciones, y el Licenciante le concede a Usted tales derechos en consideración
a los beneficios que el Licenciante recibe por poner a disposición el Material
Licenciado bajo estos términos y condiciones.

    https://creativecommons.org/licenses/by-sa/4.0/

```

[![CC BY-SA 4.0][cc-by-sa-image]][cc-by-sa]

[cc-by-sa]: http://creativecommons.org/licenses/by-sa/4.0/
[cc-by-sa-image]: https://licensebuttons.net/l/by-sa/4.0/88x31.png
[cc-by-sa-shield]: https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg
