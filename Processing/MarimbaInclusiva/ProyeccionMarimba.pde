// Marimba Didáctica //<>//
// Abril/Mayo 2016
// Daniel Escobar Vásquez  danielescobar.co

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
  
  
  
  //CONSTRUCTOR DE LA CLASE
  ProyeccionMarimba ( Marimba marimba, Configuracion configuracion )
  {
    estado = ProyeccionMarimbaEstados.INICIO;
    this.marimba = marimba;
    this.configuracion = configuracion;
    
    utiles = new Utiles ( );
    
    fuente = loadFont ("Garamond-Bold-28.vlw");

    textFont(fuente,28);
  }
  
  //ESTE MÉTODO ES LLAMADO TODO EL TIEMPO
  //ES EL ENCARGADO DE DIBUJAR LOS ELEMENTOS DE LA PROYECCIÓN SEGÚN EL ESTADO DE LA PROYECCIÓN
  void actualizarProyeccion ( )
  { 
    switch ( estado )
    {
      case ProyeccionMarimbaEstados.INICIO:
        //irAModoEjecucion ( );        
        //estado =  ProyeccionMarimbaEstados.EJECUCION;
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
    }
  }
  
  //IR AL MODO JUEGO
  void irAModoJuego ( )
  {
    estado = ProyeccionMarimbaEstados.JUEGO;
    //SJM
    //configurarTablas ( TablaEstados.LIBRE , configuracion.colorTablaLibre );
    for(int i=0;i<16;i++){
      configurarTabla(i,TablaEstados.LIBRE, marimba.arregloTablas[i].colorActual);
    }
    seleccionRealizada = false;
  }
  
  void irAModoLibre ( )
  {
    estado = ProyeccionMarimbaEstados.LIBRE;
    //SJM
//    configurarTablas ( TablaEstados.LIBRE , configuracion.colorTablaLibre );
    for(int i=0;i<16;i++){
      configurarTabla2(i,TablaEstados.LIBRE, marimba.arregloTablas[i].colorInactivo);
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
    seleccionRealizada = false;
  }
  
  //IR AL ESTADO PRESENTACIÓN SECUENCIA
  void irAModoPresentacionSecuencia ( )
  {
    estado = ProyeccionMarimbaEstados.PRESENTACION_SECUENCIA; //<>//
    //sjm
    //configurarTablas ( TablaEstados.PRESENTACION_SECUENCIA , col /*configuracion.colorTeclaInactiva*/ );
    for(int i=0;i<16;i++){
      configurarTabla2(i,TablaEstados.PRESENTACION_SECUENCIA, marimba.arregloTablas[i].colorInactivo);
    }
  }
  
  //IR AL MODO REPETICIÓN SECUENCIA
  void irAModoRepeticionSecuencia ( )
  {
    estado = ProyeccionMarimbaEstados.REPETICION_SECUENCIA;
    //sjmm
    //configurarTablas ( TablaEstados.LIBRE , configuracion.colorTablaLibre );
    for(int i=0;i<16;i++){
      configurarTabla2(i,TablaEstados.LIBRE, marimba.arregloTablas[i].colorInactivo);
    }    
  }
  
  
  //IR AL ESTADO CONFIGURACIÓN DE PROYECCIÓN
  void irAModoConfiguracionProyeccion ( )
  {
    estado = ProyeccionMarimbaEstados.CONFIGURACION_PROYECCION;
    configurarTablas ( TablaEstados.CONFIGURACION , configuracion.colorTablaConfiguracion );
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
  //CONFIGURAR UNA SOLA TABLA CON UN ESTADO Y UN COLOR
  void configurarTabla2 ( int tabla , int estado , color col )
  {
    marimba.arregloTablas [ tabla ].estado = estado;
    marimba.arregloTablas [ tabla ].colorTabla = col;
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
               }
            }
         break;
         
         case TablaEstados.GOLPEADA:
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
            //marimba.arregloTablas [ i ].colorTabla = configuracion.colorTablaLibre;

           
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
  
    //noFill();
  
      //for (int i = posY; i <= posY+alto; i++) {
        //float inter = map(i, posY, posY+alto, 0, 1);
        color c = lerpColor(color1, color2, 0.5);
        stroke(c);
        //line(posX, i, posX+ancho, i);
        //fill ( c );
        rect ( posX , posY, ancho , alto);        
      //}
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
    textSize(35);
    fill(0);
    textAlign(CENTER);
    
    
    
    //SI LA INSTRUCCIÓN DEBE PARTIRSE EN VARIAS LÍNEAS
//    if ( instruccionActual.partirInstruccion )
//    {
      String[] palabras = split ( instruccionActual.mensaje , ';');
      PImage imgInst = instruccionActual.iconoInstruccion;
      if(imgInst!=null){
        fill(0);
        image(imgInst, configuracion.posXMarimba+(configuracion.anchoMarimba*0.23), configuracion.posYMarimba+(configuracion.altoTablaPequena/2), imgInst.width/5,imgInst.height/5);      
      }
      
//      if ( palabras.length > 0 )
//      {
//        for ( int j = 0; j < palabras.length ; j ++ )
//        {
//          for ( int k = 0 ; k < palabras [ j ].length ( ) ; k++ )
//          {
//            if ( k < configuracion.numeroTablas )
//            {
//              int posx = configuracion.posXMarimba + marimba.arregloTablas [ k ].posX + 30 ;
//              int posy = configuracion.posYMarimba + marimba.arregloTablas [ k ].posY + int ( marimba.arregloTablas [ k ].alto * 0.5 +  (35 * j) - ( 15 * ( palabras.length - 1 ) )  ) + 5;
              
//              text( palabras [ j ].charAt (k) , posx , posy );
//            }
//          }
//        }
//      }
//    }
    
    //SI LA INSTRUCCIÓN SE DIBUJA EN UNA SOLA LÍNEA
//    else
//    {  
//      for ( int i = 0 ; i < instruccionActual.mensaje.length ( ) ; i++ )
//      {
//        if ( i < configuracion.numeroTablas )
//        {
//          int posx = configuracion.posXMarimba + marimba.arregloTablas [ i ].posX +  30;
//          int posy = configuracion.posYMarimba + marimba.arregloTablas [ i ].posY + int ( marimba.arregloTablas [ i ].alto * 0.5 ) + 5;
          
//          text( instruccionActual.mensaje.charAt(i) , posx , posy );
//        }
//      }
//    }
 
    //SI LA INSTRUCCIÓN TIENE OPCIONES DE SELECCIÓN
    if ( instruccionActual.seleccion )
    {
      for ( int h = 0 ; h < instruccionActual.seleccionTabla.size ( ) ; h ++ )
      {
        configurarTabla ( instruccionActual.seleccionTabla.get ( h ) , TablaEstados.OPCION_SELECCION , configuracion.colorOpcion );
        marimba.arregloTablas [ instruccionActual.seleccionTabla.get ( h ) - 1 ].valorOpcionSeleccion = instruccionActual.seleccionMensaje.get ( h );
        //-Dibujar el texto de la opción.
        
        int x = configuracion.posXMarimba + marimba.arregloTablas [ instruccionActual.seleccionTabla.get ( h ) - 1 ].posX + 5;
        int y = configuracion.posYMarimba + 200;
        
        //DIBUJAR LAS PALABRAS VERTICALES DE LAS OPCIONES
        fill(0);
        PImage img = instruccionActual.seleccionIcono.get ( h );
        image(img, x, y, img.width/5,img.height/5);
        
/*        for ( int f = 0 ; f < instruccionActual.seleccionMensaje.get ( h ).length ( ) ; f ++)
        {
           text( instruccionActual.seleccionMensaje.get ( h ).charAt(f) , x , y + f*32 );
        }
*/
      }
    }
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
    println ( "aaa" );
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
      //SJM
      color blanco = #FFFFFF;
      marimba.arregloTablas [ tabla - 1 ].colorTabla = blanco;//marimba.arregloTablas [ tabla - 1 ].colorActual;//configuracion.colorTablaGolpeada;
      //color negro = #000000;
      //setGradiente(marimba.arregloTablas [ tabla - 1 ].posX + configuracion.posXMarimba , marimba.arregloTablas [ tabla - 1 ].posY + configuracion.posYMarimba , marimba.arregloTablas [ tabla - 1 ].ancho , marimba.arregloTablas [ tabla - 1 ].alto, negro,marimba.arregloTablas [ tabla - 1 ].colorActual);
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
      //sjm
      marimba.arregloTablas [ tabla - 1 ].colorTabla = marimba.arregloTablas [ tabla - 1 ].colorInactivo;//configuracion.colorTablaLibre;
    }
  }

}