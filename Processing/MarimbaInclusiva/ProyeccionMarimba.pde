// Marimba Inclusiva //<>// //<>// //<>//
// Octubre 2016, Cartagena, Colombia
// https://marimbainclusiva.wordpress.com/
// https://github.com/marimba-inclusiva/marimba-inclusiva

//Clase ProyeccionMarimba, controla la visualización de marimba
class ProyeccionMarimba
{
  int estado;
  Marimba marimba;
  Configuracion configuracion;
  Utiles utiles;
  Instruccion instruccionActual;
  boolean seleccionRealizada = false;
  String valorSeleccionRealizada;
  boolean tablaGolpeada = false;
  int valorTablaGolpeada;
  
  PFont fuente;
  PFont fuenteMensaje;
  PImage imagen;
  PImage imagenMensaje;
  String mensaje;
  Iluminacion iluminacion;
  
  //CONSTRUCTOR DE LA CLASE
  ProyeccionMarimba ( Marimba marimba, Configuracion configuracion )
  {
    estado = ProyeccionMarimbaEstados.INICIO;
    this.marimba = marimba;
    this.configuracion = configuracion;
    
    utiles = new Utiles ( );
    fuente = loadFont ("Garamond-Bold-28.vlw");
    fuenteMensaje = loadFont ("ArialNarrow-BoldItalic-48.vlw");
    textFont(fuenteMensaje,68);
    
    iluminacion = new Iluminacion ( );
  }
  
  //ESTE MÉTODO ES LLAMADO TODO EL TIEMPO
  //ES EL ENCARGADO DE DIBUJAR LOS ELEMENTOS DE LA PROYECCIÓN SEGÚN EL ESTADO DE LA PROYECCIÓN
  void actualizarProyeccion ( )
  { 
    
    iluminacion.dibujar ( );
    
    switch ( estado )
    {
      case ProyeccionMarimbaEstados.INICIO:
      break;
      
      case ProyeccionMarimbaEstados.LIBRE:
        actualizarTablas ( );
        dibujarTablas ( );
      break;
      
      case ProyeccionMarimbaEstados.CONFIGURACION_PROYECCION:
        actualizarTablas ( );
        dibujarTablas ( );
      break;
      
      case ProyeccionMarimbaEstados.CONFIGURACION_TABLA:
      break; 
      
      case ProyeccionMarimbaEstados.INSTRUCCION:
         actualizarTablas ( );
         dibujarTablas ( );
         dibujarInstruccion ( );
      break; 
      
      case ProyeccionMarimbaEstados.PRESENTACION_SECUENCIA:
          actualizarTablas ( );
          dibujarTablas ( );
      break;
      
      case ProyeccionMarimbaEstados.MOSTRAR_IMAGEN:
        mostrarImagen ( );
      break;
      
      case ProyeccionMarimbaEstados.MOSTRAR_MENSAJE:
        mostrarMensaje ( );
      break;
      
    }
  }
  
  //IR AL MODO JUEGO
  void irAModoJuego ( )
  {
    estado = ProyeccionMarimbaEstados.JUEGO;
    for(int i=1;i<=configuracion.numeroTablas;i++){
      configurarTabla(i,TablaEstados.LIBRE, marimba.arregloTablas[i-1].colorActual);
    }
    seleccionRealizada = false;
  }
  
  void irAModoLibre ( )
  {
    estado = ProyeccionMarimbaEstados.LIBRE;
    for(int i=1;i<=configuracion.numeroTablas;i++){
      configurarTabla(i,TablaEstados.LIBRE, marimba.arregloTablas[i-1].colorInactivo);
    }
    seleccionRealizada = false;
  }
  
  //IR AL ESTADO INSTRUCCIÓN
  void irAModoInstruccion ( Instruccion instr )
  {
    instruccionActual = instr;
    estado = ProyeccionMarimbaEstados.INSTRUCCION;
    instruccionActual.iniciar ( );
    configurarTablas ( TablaEstados.INSTRUCCION , configuracion.colorInstruccion );
    /*for(int i=1;i<=configuracion.numeroTablas;i++){
      configurarTabla(i,TablaEstados.PRESENTACION_SECUENCIA, marimba.arregloTablas[i-1].colorInactivo);
    }*/
    seleccionRealizada = false;
  }
  
  //IR AL ESTADO RESULTADO
  void irAModoResultado ( Instruccion instr )
  {
    instruccionActual = instr;
    estado = ProyeccionMarimbaEstados.INSTRUCCION;
    instruccionActual.iniciar ( );
    configurarTablas ( TablaEstados.INSTRUCCION , configuracion.colorInstruccion );
    seleccionRealizada = false;
  }  
  
  
  //IR AL ESTADO PRESENTACIÓN SECUENCIA
  void irAModoPresentacionSecuencia ( )
  {
    estado = ProyeccionMarimbaEstados.PRESENTACION_SECUENCIA; //<>// //<>// //<>//
    for(int i=1;i<=configuracion.numeroTablas;i++){
      configurarTabla(i,TablaEstados.PRESENTACION_SECUENCIA, marimba.arregloTablas[i-1].colorInactivo);
    }
  }
  
  
  
  
  //IR AL MODO REPETICIÓN SECUENCIA
  void irAModoRepeticionSecuencia ( )
  {
    estado = ProyeccionMarimbaEstados.REPETICION_SECUENCIA;
    for(int i=1;i<=configuracion.numeroTablas;i++){
      configurarTabla(i,TablaEstados.LIBRE, marimba.arregloTablas[i-1].colorInactivo);
    }    
  }
  
  
  //IR AL ESTADO CONFIGURACIÓN DE PROYECCIÓN
  void irAModoConfiguracionProyeccion ( )
  {
    estado = ProyeccionMarimbaEstados.CONFIGURACION_PROYECCION;
    configurarTablas ( TablaEstados.CONFIGURACION , configuracion.colorTablaConfiguracion );
  }
  
  //2017
  void irAModoMostrarImagen ( PImage img )
  {
    imagen = img;
    estado = ProyeccionMarimbaEstados.MOSTRAR_IMAGEN;
  }
  
  void irAModoMostrarMensaje ( String msg , PImage img )
  {
    mensaje = msg;
    imagenMensaje = img;
    estado = ProyeccionMarimbaEstados.MOSTRAR_MENSAJE;
  }
  
  
  
  
  //CONFIGURAR TODAS LAS TABLAS CON UN ESTADO Y UN COLOR
  void configurarTablas ( int estado , color col )
  {
    for ( int i = 0 ; i < configuracion.numeroTablas ; i++ )
    {
      marimba.arregloTablas [ i ].estado = estado;
      marimba.arregloTablas [ i ].colorTabla = col;
    }
  }
  
  //CONFIGURAR UNA SOLA TABLA CON UN ESTADO Y UN COLOR
  void configurarTabla ( int tabla , int estado , color col )
  {
    marimba.arregloTablas [ tabla - 1 ].estado = estado;
    marimba.arregloTablas [ tabla - 1 ].colorTabla = col;
  }
 
  //ACTUALIZAR TODAS LAS TABLAS SEGÚN SU ESTADO Y LA ACTIVIDAD DEL MOUSE.
  void actualizarTablas ( )
    {
      for ( int i = 0 ; i < configuracion.numeroTablas ; i++ )
      {
         boolean mouseOver = utiles.mouseSobreRectangulo ( marimba.arregloTablas [ i ].posX + configuracion.posXMarimba , marimba.arregloTablas [ i ].posY + configuracion.posYMarimba , marimba.arregloTablas [ i ].ancho , marimba.arregloTablas [ i ].alto );
        
        // RECORRER LOS ESTADOS DE CADA TABLA
        switch ( marimba.arregloTablas [ i ].estado )
        {
         case TablaEstados.LIBRE:
           if ( mouseOver )
            {
              if ( mousePressed )
              {
                golpearTabla ( i + 1);
                println ( "TABLA GOLPEADA CON MOUSE : " + ( i + 1 ) );
                
                OscMessage myMessage = new OscMessage("/tabla"); //se crea un nuevo mensaje del tipo OSC
                myMessage.add(i+1);
                oscP5.send(myMessage, pantalla2); // el mensaje es enviado a la dirección creada en el setup
                
               }
            }
         break;
         
         case TablaEstados.GOLPEADA:
           OscMessage myMessage = new OscMessage("/tabla"); //se crea un nuevo mensaje del tipo OSC
                myMessage.add(i+1);
                oscP5.send(myMessage, pantalla2); // el mensaje es enviado a la dirección creada en el setup
                
           if ( marimba.arregloTablas [ i ].obtenerGolpeTerminado ( ) )
           {
             quitarGolpeaTabla ( i + 1 );
           }
         break;
         
         case TablaEstados.FALLADA:
           if ( marimba.arregloTablas [ i ].obtenerGolpeTerminado ( ) )
           {
             //quitarGolpeaTabla ( i + 1 );
           }
         break;
         
         case TablaEstados.CONFIGURACION:
         
            if ( mouseOver )
            {
              marimba.arregloTablas [ i ].estado = TablaEstados.MOUSESOBRE;
              marimba.arregloTablas [ i ].colorTabla = configuracion.colorTablaMouseSobre;
              println ( "MOUSESOBRE" );
            }

           
         break;
         
         case TablaEstados.MOUSESOBRE:
          
          if ( mouseOver )
          {
            if ( mousePressed )
            {
              marimba.arregloTablas [ i ].estado = TablaEstados.MOUSEPRESIONADO;
             }
          }
            
          else 
          {
            marimba.arregloTablas [ i ].estado = TablaEstados.CONFIGURACION;
            marimba.arregloTablas [ i ].colorTabla = configuracion.colorTablaConfiguracion;
            println ( "SUELTA" );
          }
          
          break;
          
          case TablaEstados.MOUSEPRESIONADO: 
           if ( !mousePressed ) //SI SE HACE MOUSE RELEASE
           {
             if ( mouseOver )
             {
               println ( "TABLA SELECCIONADA : " + ( i + 1 ) ); 
               desSeleccionarTabla ( marimba.tablaSeleccionada );
               seleccionarTabla ( i + 1 );
             }
             else
             {
               marimba.arregloTablas [ i ].estado = TablaEstados.CONFIGURACION;
               marimba.arregloTablas [ i ].colorTabla = configuracion.colorTablaConfiguracion;
               println ( "TABLA DESSELECCIONADA : " + ( i + 1 ) );
             }
           }
            
          break;
          
          case TablaEstados.SELECCIONADA:
            if ( mouseOver && mousePressed  )
            {
              marimba.arregloTablas [ i ].estado = TablaEstados.SELECCIONADA_MOUSEPRESIONADO;
              marimba.arregloTablas [ i ].colorTabla = configuracion.colorTablaSeleccionadaMousePresionado;
              println ( "SELECCIONADA MOUSE PRESIONADO" );
            }

          break;
          
          case TablaEstados.SELECCIONADA_MOUSEPRESIONADO:
            
            if ( mouseOver )
            {
              if ( !mousePressed )
              {
                marimba.arregloTablas [ i ].estado = TablaEstados.CONFIGURACION;
                marimba.arregloTablas [ i ].colorTabla = configuracion.colorTablaConfiguracion;
                println ( "DESELECCIONADA" );
              }
            }
            else
            {
                marimba.arregloTablas [ i ].estado = TablaEstados.SELECCIONADA;
                marimba.arregloTablas [ i ].colorTabla = configuracion.colorTablaSeleccionada;
                println ( "SELECCIONADA" );
            }
          break;
          
          case TablaEstados.OPCION_SELECCION:
            if ( !seleccionRealizada )
            {
              if ( mouseOver )
              {
                if ( mousePressed )
                {
                  seleccionRealizada = true;
                  valorSeleccionRealizada = marimba.arregloTablas [ i ].valorOpcionSeleccion;
                  seleccionarOpcionTabla ( i + 1 );
                  println ( "OPCION SELECCIONADA TABLA: " + ( i + 1 ) + " - VALOR : " + valorSeleccionRealizada );
                 }
              }
            }
          break;
          
          case TablaEstados.OPCION_SELECCIONADA:  
          break;
          
          case TablaEstados.PRESENTACION_SECUENCIA:  
          break;
          
          
          
          
          
        }
      }
  }
  
  void setGradiente(int posX, int posY, float ancho, float alto, color color1, color color2) {
        color c = lerpColor(color1, color2, 0.5);
        stroke(c);
        rect ( posX , posY, ancho , alto);
  }
  
 //DIBUJAR TODAS LA TABLAS
 void dibujarTablas ( )
  {
    for ( int i = 0 ; i < configuracion.numeroTablas ; i++ )
    {
      fill ( marimba.arregloTablas [ i ].colorTabla );
      rect ( marimba.arregloTablas [ i ].posX + configuracion.posXMarimba , marimba.arregloTablas [ i ].posY + configuracion.posYMarimba , marimba.arregloTablas [ i ].ancho , marimba.arregloTablas [ i ].alto );
    }
  }
  
  //DIBUJAR UN MENSAJE EN LAS POSICIONES DE LAS TABLAS
  void dibujarInstruccion ( )
  {
    
      ////DIBUJAR TEXTO
      textSize(45);
      fill(30);
      //fill (72,126,61);
      textAlign(CENTER);
      //SI LA INSTRUCCIÓN DEBE PARTIRSE EN VARIAS LÍNEAS
      if ( instruccionActual.partirInstruccion )
      {
        String[] palabras = split ( instruccionActual.mensaje , ';');
        
        if ( palabras.length > 0 )
        {
          for ( int j = 0; j < palabras.length ; j ++ )
          {
            for ( int k = 0 ; k < palabras [ j ].length ( ) ; k++ )
            {
              if ( k < configuracion.numeroTablas )
              {
                int posx = configuracion.posXMarimba + marimba.arregloTablas [ k ].posX + 17 ;
                int posy = configuracion.posYMarimba + marimba.arregloTablas [ k ].posY + int ( marimba.arregloTablas [ k ].alto * 0.5 +  (75 * j) - ( 35 * ( palabras.length - 1 ) )  ) + 5;
                
                text( palabras [ j ].charAt (k) , posx , posy );
              }
            }
          }
        }
      }
      
      //SI LA INSTRUCCIÓN SE DIBUJA EN UNA SOLA LÍNEA
      else
      {  
        for ( int i = 0 ; i < instruccionActual.mensaje.length ( ) ; i++ )
        {
          if ( i < configuracion.numeroTablas )
          {
            int posx = configuracion.posXMarimba + marimba.arregloTablas [ i ].posX +  17;
            int posy = configuracion.posYMarimba + marimba.arregloTablas [ i ].posY + int ( marimba.arregloTablas [ i ].alto * 0.5 ) + 5;
            
            text( instruccionActual.mensaje.charAt(i) , posx , posy );
          }
        }
      }
      ///FIN DIBUJAR TEXTO
    
    
    
      //Imagen de instrucción
      fill(0);
      PImage imgInst = instruccionActual.iconoInstruccion;
      if(imgInst!=null){
        fill(0);
        image(imgInst, (int)(configuracion.posXMarimba+(configuracion.anchoMarimba*0.5)-(imgInst.width*0.5)), (int)(marimba.arregloTablas[0].posY + (configuracion.altoTablaGrande*0.44)), imgInst.width,imgInst.height);
        /*int marX = int ( (1280 - 1024) * 0.5);
        int marY = int ( (720 - 606) * 0.5);
        image(imgInst,   marX ,   marY );*/
      }
 
    //SI LA INSTRUCCIÓN TIENE OPCIONES DE SELECCIÓN
    if ( instruccionActual.seleccion )
    {
      for ( int h = 0 ; h < instruccionActual.seleccionTabla.size ( ) ; h ++ )
      {
        configurarTabla ( instruccionActual.seleccionTabla.get ( h ) , TablaEstados.OPCION_SELECCION , configuracion.colorOpcion );
        marimba.arregloTablas [ instruccionActual.seleccionTabla.get ( h ) - 1 ].valorOpcionSeleccion = instruccionActual.seleccionMensaje.get ( h );
       
        //Imagen de instrucción por cada tabla
        fill(0);
        PImage img = instruccionActual.seleccionIcono.get ( h );
        int x = configuracion.posXMarimba + marimba.arregloTablas [ instruccionActual.seleccionTabla.get ( h ) - 1 ].posX;
        int y = configuracion.posYMarimba + marimba.arregloTablas [ 15 ].posY + int ( marimba.arregloTablas [ 15 ].alto * 0.5  - marimba.arregloTablas [ instruccionActual.seleccionTabla.get ( h ) - 1 ].ancho*0.5);        
        
        image(img, x, y, marimba.arregloTablas [ instruccionActual.seleccionTabla.get ( h ) - 1 ].ancho, marimba.arregloTablas [ instruccionActual.seleccionTabla.get ( h ) - 1 ].ancho);
      }
    }
  }
  
  //2017
  void mostrarImagen ( )
  {
    int marX = int ( (width - 1024) * 0.5);
    int marY = int ( (height - 606) * 0.5);
    image( imagen ,   marX ,   marY );
  }
  
  void mostrarMensaje ( )
  {
    textSize(55);
    textAlign(CENTER);
    fill (255,255,255);
    
    int posX = int ( (width ) * 0.5);
    int posY = int ( (height ) * 0.5);
    //text( mensaje , posX , posY );
    
    String[] lineas = split ( mensaje , ';');
      
    if ( lineas.length > 0 )
    {
      for ( int j = 0; j < lineas.length ; j ++ )
      {
         text( lineas [ j ] , posX , posY + 58 * j - (58 * lineas.length ) );
      }   
    }
    else
    {
      text( mensaje , posX , posY  );
    }
    
    int marX = int ( (width - 400) * 0.5);
    int marY = int ( (height - 430 ));
    image( imagenMensaje ,   marX ,   marY );
  }
  
  
  //DIBUJAR LOS CONTROLES DEL MODO CONFIGURACIÓN
  void dibujarControles ( )
  {
  }
  
  //MOVER TODAS LAS TABLAS
  void moverTablas ( int posX , int posY )
  {
  }
  
  //CAMBIAR EL TAMAÑO DE TODAS LAS TABLAS
  void redimensionarTablas ( int ancho , int alto )
  {
  }

  //MOVER UNA SOLA TABLA
  void moverTabla ( int tabla , int posX , int posY )
  {
  }
  
  //CAMBIAR EL TAMAÑO DE UNA SOLA TABLA
  void redimensionarTabla ( int tabla , int ancho , int alto )
  {
  }
  
  //MOSTRAR UNA INSTRUCCIÓN SOBRE LAS TABLAS
  void mostrarInstruccion ( Instruccion instruccion )
  {
    
  }
  
  //MOSTRAR UNA SECUENCIA DE TABLAS ILUMINADAS
  void mostrarSecuencia ( Secuencia secuencia )
  {
    
  }
  
  //SELECCIONAR UNA SOLA TABLA
  void seleccionarTabla ( int tabla )
  {
    if ( tabla > 0 && tabla <= marimba.numeroTablas )
    {
      marimba.arregloTablas [ tabla - 1 ].estado = TablaEstados.SELECCIONADA;
      marimba.arregloTablas [ tabla - 1 ].colorTabla = configuracion.colorTablaSeleccionada;
      marimba.tablaSeleccionada = tabla;
    }
  }
  
  //DESELECCIONAR UNA SOLA TABLA
  void desSeleccionarTabla ( int tabla )
  {
    if ( tabla > 0 && tabla <= marimba.numeroTablas )
    {
      marimba.tablaSeleccionada = 0;
      marimba.arregloTablas [ tabla - 1 ].estado = TablaEstados.CONFIGURACION;
      marimba.arregloTablas [ tabla - 1 ].colorTabla = configuracion.colorTablaConfiguracion;      
    }
  }
  
  //GOLPEAR UNA TABLA QUE TENGA OPCIÓN DE SELECCIÓN
  void seleccionarOpcionTabla ( int tabla )
  {
    if ( tabla > 0 && tabla <= marimba.numeroTablas )
    {
      marimba.tablaOpcionSeleccionada = tabla;
      marimba.arregloTablas [ tabla - 1 ].estado = TablaEstados.OPCION_SELECCIONADA;
      marimba.arregloTablas [ tabla - 1 ].colorTabla = configuracion.colorOpcionSeleccionada;
      marimba.arregloTablas [ tabla - 1 ].cuentaSeleccionOpcion = millis ( );
    }
  }
  
  //GOLPEAR UNA SOLA TABLA
  void golpearTabla ( int tabla)
  {
    if ( tabla > 0 && tabla <= marimba.numeroTablas )
    {
      marimba.arregloTablas [ tabla - 1 ].estado = TablaEstados.GOLPEADA;
      color blanco = #FFFFFF;
      marimba.arregloTablas [ tabla - 1 ].colorTabla = blanco;
      marimba.arregloTablas [ tabla - 1 ].cuentaGolpe = millis ( );
      
      tablaGolpeada = true;
      valorTablaGolpeada = tabla;
    }
  }
  
  //FALLAR UNA TABLA
  void fallarTabla ( int tabla )
  {
    marimba.arregloTablas [ tabla - 1 ].estado = TablaEstados.FALLADA;
    marimba.arregloTablas [ tabla - 1 ].colorTabla = configuracion.colorTablaEquivocada;
    marimba.arregloTablas [ tabla - 1 ].cuentaGolpe = millis ( );
      
    tablaGolpeada = true;
    valorTablaGolpeada = tabla;
  }
  
  int obtenerTablaGolpeada ( )
  {
    tablaGolpeada = false;
    return valorTablaGolpeada;
  }
  
  //GOLPEAR VARIAS TABLAS AL MISMO TIEMPO
  void golpearAcorde ( int[] acorde)
  {
    for ( int i = 0 ; i < acorde.length ; i++ )
    {
      golpearTabla ( acorde [ i ]);
    }
  }
  
  //QUITAR EL GOLPE DE LA TABLA
  void quitarGolpeaTabla ( int tabla )
  {
    if ( tabla > 0 && tabla <= marimba.numeroTablas )
    {
      marimba.arregloTablas [ tabla - 1 ].estado = TablaEstados.LIBRE;
      marimba.arregloTablas [ tabla - 1 ].colorTabla = marimba.arregloTablas [ tabla - 1 ].colorInactivo;//configuracion.colorTablaLibre;
    }
  }

}