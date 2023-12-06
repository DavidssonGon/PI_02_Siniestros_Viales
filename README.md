# Proyecto Individual 02 Siniestros Viales
 
## Contexto de las necesidades del proyecto 

Se nos pone en los zapatos de un analista de datos independiente al cual el `Observatorio de Movilidad y Seguridad Vial (OMSV)`, un centro de estudios que se encuentra bajo la órbita de la Secretaría de Transporte del Gobierno de la Ciudad Autónoma de Buenos Aires nos pide generar información que le permita a las autoridades locales tomar medidas para disminuir la cantidad de víctimas fatales de los siniestros viales. Para esto disponibilidad un dataset sobre `homicidios` en siniestros viales acaecidos en la Ciudad de Buenos Aires durante el periodo 2016-2021. El cual está en formato xlsx, pero es importante destacar que no se nos limita a utilizar solo esa información, sino que también está disponible otro data set complementario sobre `lesiones` en siniestros viales acaecidos en la Ciudad de Buenos Aires este en formato xlsx pero además se nos da campo abierto a poder consultar información que se considere levante para poder complementar el análisis esto puede ser a través de web scraping o utilizando otros data sets. 

## Proceso 

### ETL
Se empezó abriendo los data sets para verificar que información contenía en cada campo, observando su tamaño y los valores nulos. Por lo cual se empieza realizando una limpieza de valores nulos a través de transformaciones, imputaciones o eliminación de dichos valores para proceder a normalizar los nombres delos campos, el tipo de datos y organizar por una jerarquía el DataFrame, esto se hizo con la primera hoja del archivo xlsx llamada hechos. Con la segunda hoja llamada victimas la cual complementa la información de la primera se hizo exactamente el mismo proceso. Para poder generar un data set más completo se decidió a realizar un merge de ambos DataFrame de tal manera que cada fila relacionada a una víctima tuviera asociada una información de su hecho. Lo anterior se realizo de igual manera con el data set de `lesiones` ya que su estructura era muy similar. 

En este punto se identificó la relevancia del campo **“Comuna”** por lo cual se buscó y encontró una base de datos con la información necesaria para poder generar un mapa donde se identifiquen todas las comunas del Ciudad de Buenos Aires, por lo cual se generó un nuevo data set con esta información guardada a disposición para posteriores procesos. (El link de este data set se encontrará al final de este documento). 

### EDA
Una vez se tenía limpio y lo más normalizado el data set de `homicidios` se procedió a realizar un análisis exploratorio de los datos, empezando por la frecuencia de los valores de cada campo relevante y que porcentaje representaban, para posteriormente realizar análisis invariados de algunos campos que lo requieran empezando a encontrar información que guiaría a conclusiones concisas a través de graficas como diagramas de torta, histogramas y diagramas de barras. Luego vendría el que es el análisis más interesante, que es el análisis multivariado en el cual hay un interesante diagrama de violín analizando la distribución de las victimas por edad y sexo, aunque en su mayoría son diagramas de barras, se destaca un gráfico de análisis temporal con área bajo la línea, gráficos de líneas en series de tiempos, diagramas de puntos y un mapa de las comunas coloreado bajo la incidencia de hechos dentro del data set. 

### KPI
Para este ejercicio se tomó como aplicación el indicador de desempeño propuesto de *Reducir en un 7% la cantidad de accidentes mortales de motociclistas en el último año, en CABA, respecto al año anterior.* por ellos para hacerse a una idea de su resultado en un apartado dentro del Notebook del EDA se calculó el KPI en todos los años que se podía incluido el 2021 pero ya que los registros que se tienen van únicamente hasta el 18 de noviembre del 2021 se tendrán en cuenta para el KPI el año 2020. Dando como resultado que se cumplió con el indicador ya que para el año 2020 se redujo en un **44%** la cantidad de accidentes mortales de motociclistas en la ciudad de Bueno Aires. 

### SQL 
Una vez se tenía el EDA concluido se procedió a crear una base de datos en el motor SQL MySQL Workbench donde se crearon tres tablas correspondientes a los data sets `homicidios`, `lesiones` y `comunas`, se procedió a cargar los datos normalizados y de esta manera ya se tenía las tres tablas con toda la información en una base de datos SQL. 

## Conclusiones del EDA 

En este punto se destaca las conclusiones ya incluidas en el EDA y que se entenderá de mejor manera revisándolo más a exhaustividad pero que resume de buena manera el análisis del data set `homicidios`. 

- El 76.7% de los hechos de homicidio le corresponde al sexo Masculino y el 23.3% al Femenino. 
- Las personas de edades entre los 35 y los 50 años son los más frecuentes y le seguiría los de edades comprendidas entre 25 y 35 años. 
- El Rol de conductor es el más frecuentes entre las víctimas, le seguiría el Peatón y después El Acompañante. 
- Dentro de los conductores, los que conducen Motocicletas son los más frecuentes con un 42% de la muestra y le seguiría el peatón. 
- El Automóvil es el más acusado en estos accidentes, pero también desataca los vehículos de Cargas con el 21%. 
- La Avenida es el tipo de calle en el que se registran más hechos con el 62.17% del total de los registros. 
- La Avenida General Paz es la calle con mayor frecuencia ocupando el 8.26% dentro de todas las calles registradas con sucesos. 
- La Comuna 1 ocupa el primer puesto con más registros, pero detrás le siguen la 4 y la 9 todas estas con más de un 10% de los hechos registrados. 

> En síntesis se puede argumentar que hay una mayor frecuencia Masculina en todas las categorías, que los Conductores de Motociclistas y los Peatones son los más afectados en los sucesos debido a que también son los más vulnerables al no tener ninguna protección contra un impacto, el Automóvil suele ser el más acusado de los hechos pero también entra considerablemente los vehículos de carga, lo anterior muy relacionado a que la Avenida es el tipo de calle con más incidencia, en especial la Avenida General Paz probablemente debido a su gran extensión, las edades comprendidas desde los 25 años y los 50 años son las más registradas entre las víctimas y para terminar la Comuna número uno junto con la cuatro y la nueve registran casi un 35% de los hechos esto podría indicar que es por un tema de concentración de tráfico en estas zonas. 

## Material de apoyo 

#### [Data Set](https://data.buenosaires.gob.ar/dataset/victimas-siniestros-viales) del proyecto. 

#### [Data Set](https://data.buenosaires.gob.ar/dataset/comunas) del mapa de las comunas de la ciudad de Buenos Aires. 

#### [Link](https://drive.google.com/drive/folders/1gXIGEOGLfdovzyx0xX9N5ZkDcLYjYxWy?usp=sharing) al archivo del DashBoard en Power BI 