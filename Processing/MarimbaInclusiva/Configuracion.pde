// Marimba Inclusiva //<>// //<>// //<>// //<>//
// Octubre 2016, Cartagena, Colombia
// https://marimbainclusiva.wordpress.com/
// https://github.com/marimba-inclusiva/marimba-inclusiva

//Clase Configuracion, carga los parametros de juego a través de XML
class Configuracion
{
  String rutaArchivoConfiguracion;
  XML xmlConfiguracion;
  
  int lapsoDesactivacionMouse;// 5000
  int numeroTablas;// 16
  int anchoPantalla;// 1280
  int altoPantalla;// 720
  int anchoMarimba;// 650
  int altoTablaGrande;// 460
  int altoTablaPequena;// 240
  int posXMarimba;// 40
  int posYMarimba;// 120
  
  color colorTablaLibre;// #222222
  color colorTablaGolpeada;// #8ABF47
  color colorTablaEquivocada;// #C42531
  color colorTablaConfiguracion;// #AAAA00
  color colorTablaMouseSobre;// #0000AA
  color colorTablaSeleccionada;// #00AAAA
  color colorTablaSeleccionadaMousePresionado;// #AA00AA
  color colorInstruccion;// #D6D6D6
  color colorOpcion;// #50ACD1
  color colorOpcionSeleccionada;// #DBDB1F
  color colorTeclaInactiva;// #222222
  color colorTeclaCuenta;// #EFE930
  
  String puertoArduino;
  
  Tabla[] arregloTablas;
  boolean secuenciaManual=false;
  ArrayList<Secuencia> listaSecuencias = new ArrayList<Secuencia>();
  
  
  Configuracion ( String ruta )
  {
    if(ruta !=null){
      this.rutaArchivoConfiguracion = ruta;
      xmlConfiguracion = loadXML(rutaArchivoConfiguracion);
      cargarConfiguracion ( );
    }
  }
  
  /*Carga configuracion de XML; en caso de que no existan los parametros, utliza valores por default*/
  void cargarConfiguracion ( )
  {
    /*Lectura de tablas*/
    XML[] confXML = xmlConfiguracion.getChildren("parametros"); //<>// //<>// //<>// //<>//
     //<>// //<>// //<>// //<>//
    this.lapsoDesactivacionMouse = confXML[0].getChild("lapsoDesactivacionMouse").getIntContent(5000); //<>// //<>// //<>// //<>//
    this.numeroTablas = confXML[0].getChild("numeroTablas").getIntContent(16);
    this.anchoPantalla = confXML[0].getChild("anchoPantalla").getIntContent(1280);
    this.altoPantalla = confXML[0].getChild("altoPantalla").getIntContent(720);
    this.anchoMarimba = confXML[0].getChild("anchoMarimba").getIntContent(880);
    this.altoTablaGrande = confXML[0].getChild("altoTablaGrande").getIntContent(460);
    this.altoTablaPequena = confXML[0].getChild("altoTablaPequena").getIntContent(265);
    this.posXMarimba = confXML[0].getChild("posXMarimba").getIntContent(25);
    this.posYMarimba = confXML[0].getChild("posYMarimba").getIntContent(120);
    this.puertoArduino = confXML[0].getChild("puertoArduino").getContent("/dev/ttyACM0");
    
    this.colorTablaLibre = color(unhex("FF"+confXML[0].getChild("colorTablaLibre").getContent().substring(1)));
    this.colorTablaGolpeada = color(unhex("FF"+confXML[0].getChild("colorTablaGolpeada").getContent().substring(1)));
    this.colorTablaEquivocada = color(unhex("FF"+confXML[0].getChild("colorTablaEquivocada").getContent().substring(1)));
    this.colorTablaConfiguracion = color(unhex("FF"+confXML[0].getChild("colorTablaConfiguracion").getContent().substring(1)));
    this.colorTablaMouseSobre = color(unhex("FF"+confXML[0].getChild("colorTablaMouseSobre").getContent().substring(1)));
    this.colorTablaSeleccionada = color(unhex("FF"+confXML[0].getChild("colorTablaSeleccionada").getContent().substring(1)));
    this.colorTablaSeleccionadaMousePresionado = color(unhex("FF"+confXML[0].getChild("colorTablaSeleccionadaMousePresionado").getContent().substring(1)));
    this.colorInstruccion = color(unhex("FF"+confXML[0].getChild("colorInstruccion").getContent().substring(1)));
    this.colorOpcion = color(unhex("FF"+confXML[0].getChild("colorOpcion").getContent().substring(1)));
    this.colorOpcionSeleccionada = color(unhex("FF"+confXML[0].getChild("colorOpcionSeleccionada").getContent().substring(1)));
    this.colorTeclaInactiva = color(unhex("FF"+confXML[0].getChild("colorTeclaInactiva").getContent().substring(1)));
    this.colorTeclaCuenta = color(unhex("FF"+confXML[0].getChild("colorTeclaCuenta").getContent().substring(1)));

   //Las tablas se pueden crear de forma manual con el atributo configuracionManual="1" dentro <tablas>, 
   //se generan por default cuando configuracionManual="0"
   if(xmlConfiguracion.getChild("tablas").getInt("configuracionManual",0)==1){
         cargaTablas();
   }else{
         arregloTablas = null;
   }

   //Secuencias se pueden crear de forma manual con el atributo configuracionManual="1" dentro <secuencias>, 
   //se generan por default cuando configuracionManual="0"
   if(xmlConfiguracion.getChild("secuencias").getInt("configuracionManual",0)==1){
         cargaSecuencias();
   }

    println("CONF PARAMS: " + lapsoDesactivacionMouse +" "+ numeroTablas + " "+ anchoPantalla + " " + altoPantalla + " " + anchoMarimba + " " + altoTablaGrande + " " + altoTablaPequena + " " + posXMarimba + " " + posYMarimba);
  }
  
  void salvarConfiguracion ( )
  {
    
  }
  
  /*Carga de Tablas (Manual)*/
  void cargaTablas(){
    
    try{
         XML[] tablasXML;
   
         tablasXML = xmlConfiguracion.getChildren("tablas/tabla");/*Lectura de tablas*/
         arregloTablas = new Tabla[tablasXML.length];
         this.anchoMarimba=0;
    
        for (int i = 0; i < tablasXML.length; i++) {
          String colorParse= "FF"+tablasXML[i].getString("color").substring(1);
          //String colorInactivoParse= "FF"+tablasXML[i].getString("colorInactivo").substring(1);
          Tabla tabla = new Tabla(tablasXML[i].getInt("id"), color(unhex(colorParse)));
          tabla.posX= tablasXML[i].getInt("px");
          tabla.posY= tablasXML[i].getInt("py");
          tabla.ancho= tablasXML[i].getInt("ancho");
          tabla.alto= tablasXML[i].getInt("alto");
          arregloTablas[i] = tabla;
          
          //TODO CALCULAR ESPACIO ENTRE TABLA, CAMBIAR 16
          this.anchoMarimba += tabla.ancho + 16;
        }
        this.altoTablaGrande = tablasXML[0].getInt("alto");
        this.altoTablaPequena = tablasXML[tablasXML.length-1].getInt("alto");
        this.numeroTablas = tablasXML.length;
        
    }catch(Exception e){
      arregloTablas = null;
      println("Error al leer tablas");
      e.printStackTrace();
      
    }
  }
  
  /*Carga de Secuencias (Manual)*/
  void cargaSecuencias(){
    
      try{
           Utiles util = new Utiles();
           XML[] secuenciasXML;
           secuenciaManual=true;
           
           secuenciasXML = xmlConfiguracion.getChildren("secuencias/secuencia");/*Lectura de tablas*/
           
           for (int i = 0; i < secuenciasXML.length; i++) {
             //String nombre = secuenciasXML[i].getString("nombre","sec"+i);
             float compas = util.getSecuenciaCompas(int(secuenciasXML[i].getInt("figuraBase")));
             int tempo = int(secuenciasXML[i].getInt("tempo",90));
             Secuencia sec = new Secuencia(compas,tempo);
             
             XML[] notasXML = secuenciasXML[i].getChildren("nota"); //Obtiene notas
                    
             ArrayList<int[]> notas = new ArrayList<int[]>();
      
             //printArray(notasXML);
             for (int j = 0; j < notasXML.length; j++) {
               
               XML[] acorde = notasXML[j].getChildren("nota");
               
               if(acorde.length>0){ //Si existen mas notas en un arreglo
                     
                   int[] sonidoWrap = new int[acorde.length];
               
                   for (int k = 0; k < acorde.length; k++) {
                       int sonido = util.getNota(acorde[k].getContent());
                       sonidoWrap[k]=sonido;
                   }
                   notas.add(sonidoWrap);
               }else{ //Una nota por arreglo
                 int sonido = util.getNota(notasXML[j].getContent());//Obtiene el valor de la nota
                 
                   if(sonido!=0){//Un arreglo por nota
                     int[] sonidoWrap = new int[1];
                     sonidoWrap[0]=sonido;
                     notas.add(sonidoWrap);
                   }else{//Arreglo vacio de silencio
                     int[] sonidoWrap = new int[0];
                     notas.add(sonidoWrap);
                   }
               }
             }
             
             int [][] melodia = new int[notas.size()][1];
             notas.toArray(melodia); //Melodia de secuencia
             
             sec.melodia = melodia;
             listaSecuencias.add(sec);
      
              /*for (int j = 0; j < melodia.length; j++) {
                for (int k = 0; k < melodia[j].length; k++) {
                  println(melodia[j][k] + "--" +j + "*****" + k);
                }
              }*/
         }
  
    }catch(Exception e){
      secuenciaManual = false;
      println("Error al leer secuencias");
      e.printStackTrace();
    }
  
  }
  
}