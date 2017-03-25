# Marimba-Inclusiva

Un dispositivo de enseñanza basado en la expansión de la marimba de chonta y guadua, a partir de la utilización de tecnologías electrónicas y digitales, para el aprendizaje musical de personas en situación de discapacidad auditiva.
Desarrollado en el Laboratorio Iberoamericano de Innovación Ciudadana. LabicCo - Cartagena, en Octubre 2016.

**Mayores detalles:**
[Marimba Inclusiva](https://marimbainclusiva.wordpress.com/)

## Funcionamiento:

El dispositivo consiste en la proyección de elementos visuales sobre la marimba para indicar al usuario las secuencias de tablas debe tocar así como para recibir un feedback visual al momento de golpear cada tabla; de igual forma, el usuario también percibe el ritmo de la melodía interpretada a través de motores vibradores colocados en el cuerpo.

Se conforma del programa ejecutado en Processsing sobre una Raspberry Pi 3, el cual es  visualizado en un proyector posicionado horizontalmente sobre la marimba y conectado a un Arduino Mega que recibirá la señal de cada una de las tablas al ser golpeadas a través de sensores piezoeléctricos colocados sobre cada una de ellas y envía a su vez la misma señal a los motores vibradores.

#### Opciones de juego:
* **Modo libre.** Permite al usuario hacer uso libre de la interfaz recibiendo la respuesta visual y táctil al golpear las tablas.

* **Juego (Secuencias).** La marimba propone una serie de melodías a interpretar secuencialmente, las cuales deben ser reproducidas de la misma forma por el usuario para que éste pueda avanzar en el juego. Por default existen 20 secuencias, sin embargo se pueden crear nuevas a través del archivo `config.xml`.


### -	Código en Processing.
Contiene la interfaz de usuario así como la lógica de juego y control de la marimba, en la cual se proporcionan todos los elementos configurables para ser adaptable a las necesidades del usuario:

 - Dimensiones de marimba y tablas
 - Número de tablas, colores.
 - Secuencias y melodías.

### -	Código Arduino.
Realiza la conexión entre la electrónica del dispositivo y las señales que recibe/envia Processing a la interfaz de usuario.




## Instrucciones de instalación:

### Para simulación en computadora.

1. Abrir el código `MarimbaInclusiva.pde` en Processing.
2. Verificar las variables `simularMarimbaConMouse`, `usarArduino` (líneas 26, 27) se encuentren como sigue: 
```
boolean simularMarimbaConMouse = true;
boolean usarArduino = false;
```
3. Verificar que el archivo `config.xml` se encuentre dentro de la carpeta del sketch `/data`.
4. Ejecutar la aplicación.

### Para montaje.

0. Realizar la conexión de los piezoeléctricos a cada tabla de la marimba y el circuito impreso con el Raspberry Pi y Arduino Mega *(pendiente mas info)*, conectar y colocar el proyector de forma cenital sobre la marimba.
**_NOTA: Calibrar el tamaño de la proyección sobre la marimba de tal manera que esté alineada a ella (usar el keystone en caso de que se encuentre a un ángulo mayor sobre ésta)._**

1. Conectar y cargar código `M.ino`, `funciones.ino` al Arduino, verificar y anotar el puerto por el que se comunica a la Raspberry Pi.
2. Abrir `MarimbaInclusiva.pde` dentro de la Raspberry Pi.
3. Habilitar la bandera `usarArduino` (línea 27).
  ```
	boolean usarArduino = true;
  ```
4. Dentro del archivo `config.xml`, modificar el parámetro `puertoArduino` con el valor del puerto verificado en el paso 1.
5. Ejecutar la aplicación.
6. Modificar los parámetros del archivo `config.xml` de acuerdo a las características de la marimba (tamaño de marimba, tabla más grande, tabla más pequeña, etc.) para que cada tabla se proyecte de acuerdo al tamaño que le corresponde en la marimba.


### Archivo de configuración **config.xml**

Contiene todos los elementos configurables para adecuar las características de la marimba a la aplicación.
Existen algunas particularidades a tomar en cuenta para realizar las modificaciones correctamente.

#### 1. **Parámetros:** 
 Los elementos contenidos dentro de las etiquetas `<parametros></parametros>` se refieren a las dimensiones y posición en pantalla de la interfaz principalmente.
 
  **_Los Principales:_**

- `<numeroTablas>16</numeroTablas>`				Número de tablas que tiene la marimba.
- `<anchoPantalla>1280</anchoPantalla>`			Ancho de pantalla (Para desplegar interfaz)
- `<altoPantalla>720</altoPantalla>`			Alto de pantalla (Para desplegar interfaz)
- `<anchoMarimba>880</anchoMarimba>`			Ancho de marimba. Es importante cuando se genera la interfáz automáticamente.
- `<altoTablaGrande>460</altoTablaGrande>`		Alto de la tabla de mayor tamaño. Es importante cuando se genera la interfáz automáticamente.
- `<altoTablaPequena>265</altoTablaPequena>`	Alto de la tabla de menor tamaño. Es importante cuando se genera la interfáz automáticamente.
- `<posXMarimba>25</posXMarimba>`				Posición horizontal de la interfaz marimba que se muestra en pantalla. La posición de la marimba es en el área superior izquierda.
- `<posYMarimba>120</posYMarimba>`				Posición vertical de la interfaz marimba que se muestra en pantalla. La posición de la marimba es en el área superior izquierda.
- `<puertoArduino>/dev/ttyACM0</puertoArduino>` Puerto por el cual se comunica el arduino.

#### 2. **Tablas.**
 En la etiqueta `<tablas></tablas>` se pueden definir manualmente los tamaños, posiciones y colores de cada tabla si así se desea; en caso contrario, la aplicación genera la marimba con base a los parámetros descritos anteriormente.
 Al personalizar las tablas, los elementos `numeroTablas`, `anchoMarimba`, `altoTablaGrande`, `altoTablaPequena` definidos anteriormente no se toman en cuenta.
 
 Para indicar que se desean crear las tablas manualmente se utiliza el atributo `configuracionManual` con valores `0` o `1` para habilitar y deshabilitar la creación de estas:
 
  - `configuracionManual="0"`: No se toman en cuenta las tablas personalizadas. Se configuran automáticamente de acuerdo al ancho y alto de la marimba.
  - `configuracionManual="1"`: Se utiliza la configuración manual de las tablas descritas.
  
 #### 3. **Secuencias:**
  De forma similar a las tablas, se pueden crear secuencias personalizadas `<secuencias></secuencias>`, para habilitar/deshabilitar se usa también el atributo configuracionManual.
  - `configuracionManual="0"`: Carga las secuencias predefinidas en el programa (20 secuencias).
  - `configuracionManual="1"`: Carga las secuencias personalizadas del XML.
  
  Cada secuencia se define dentro de las etiquetas `<secuencia></secuencia>` con los atributos nombre, figuraBase, tempo:
  
  - `nombre`: Define un nombre a la secuencia (Opcional).
  - `tempo`: Duración. Valor default 90.
  - `figuraBase`: Se elige la figura rítmica (más pequeña) que se utilizará:
    * `figuraBase="1"`: Negra
    * `figuraBase="2"`: Corchea
    * `figuraBase="3"`: Semicorchea
    		
		En el caso en que se desee utilizar diferentes figuras, *p.Ej. una corchea y una negra, se debe indicar la menor (corchea) y el tiempo de una negra se hará indicando un silencio en la nota siguiente.*
	
  En las etiquetas `<nota></nota>` se indica la nota que se desea tocar, se pueden utilizar los valores siguientes, de otra manera no se reconocerá el valor:
  
  - DO4
  - RE4
  - MI4
  - FA4
  - SOL4
  - LA4
  - SI4
  - DO5
  - RE5
  - MI5
  - FA5
  - SOL5
  - LA5
  - SI5
  - DO6
  - RE6
  - SILENCIO
    
  Cuando no se le indica un valor a la nota, p.Ej. `<nota></nota>` significa un silencio. También puede indicarse explícitamente el silencio como `<nota>SILENCIO</nota>`
Otra opción es que se toquen varias notas a la vez -a manera de acorde-, para ello se deben anidar elementos `<nota></nota>` dentro de otro elemento `<nota></nota>`, como en la estructura siguiente:
```  
  <nota>
    <nota>FA5</nota>
    <nota>LA5</nota>
  </nota>
```	  
  A manera de ejemplo, se describe la siguiente estructura como una secuencia que utiliza corcheas, pero debido a los silencios entre cada nota, la melodía sería DO-RE-MI con el tiempo de una negra.
```  
 <secuencia nombre="secuencia1" figuraBase="2">	<!--Definición de secuencia valor de corchea como figura más pequeña-->
    <nota>DO4</nota>	<!--Nota DO4-->
    <nota></nota>	<!--Silencio de corchea-->
    <nota>RE4</nota>	<!--Nota RE4-->
    <nota></nota>	<!--Silencio de corchea-->
    <nota>MI4</nota>	<!--Nota MI4-->
</secuencia>
```

	
## Anotaciones:

- Al indicar las tablas manualmente, se comienza desde la más grande (izquierda) -posición 0- a la más pequeña (derecha).
- En cualquier momento de la ejecución se puede utilizar la tecla Q/q para reiniciar la aplicación.


## Herramientas y material de desarrollo, requerimientos:

- Processsing 3.3.
- Arduino 1.8.
- Librería Arduino http://playground.arduino.cc/Interfacing/Processing
- Librería Beads http://www.beadsproject.net/


## Contacto.

