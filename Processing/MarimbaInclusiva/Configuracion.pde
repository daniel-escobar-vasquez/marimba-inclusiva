// Marimba Didáctica //<>// //<>// //<>// //<>//
// Abril/Mayo 2016
// Daniel Escobar Vásquez  danielescobar.co

class Configuracion
{
  String rutaArchivoConfiguracion;
  XML xmlConfiguracion;
  
  int lapsoDesactivacionMouse = 15000;
  
  int numeroTablas = 16;
  int anchoPantalla = 1280;
  int altoPantalla = 720;
  int anchoMarimba = 1260;
  int altoTablaGrande = 460;
  int altoTablaPequena = 240;
  int posXMarimba = 40;
  int posYMarimba = 120;
  
  //color colorTablaLibre = #D6D6D6;
  color colorTablaLibre = #222222;
  color colorTablaGolpeada = #8ABF47;//#FF0000;
  color colorTablaEquivocada = #C42531;
  color colorTablaConfiguracion = #AAAA00;
  color colorTablaMouseSobre = #0000AA;
  color colorTablaSeleccionada =  #00AAAA;
  color colorTablaSeleccionadaMousePresionado = #AA00AA;
  color colorInstruccion = #D6D6D6;
  color colorOpcion = #50ACD1;
  color colorOpcionSeleccionada = #DBDB1F;
  //color colorTeclaInactiva = #D6D6D6;
  color colorTeclaInactiva = #222222;
  color colorTeclaCuenta = #EFE930;
  
  HashMap tabla1;
  
  Tabla[] tablas;
  
  Configuracion ( String ruta )
  {
    this.rutaArchivoConfiguracion = ruta;
    xmlConfiguracion = loadXML(rutaArchivoConfiguracion);
    cargarConfiguracion ( );
  }
  
  void cargarConfiguracion ( )
  {
    /*Lectura de tablas*/
    XML[] confXML = xmlConfiguracion.getChildren("configuracion");
    
    this.lapsoDesactivacionMouse = 15000;
    this.numeroTablas = 16;
    this.anchoPantalla = 1280;
    this.altoPantalla = 720;
    this.anchoMarimba = 1260;
    this.altoTablaGrande = 460;
    this.altoTablaPequena = 240;
    this.posXMarimba = 40;
    this.posYMarimba = 120;
    
    //color colorTablaLibre = #D6D6D6;
    this.colorTablaLibre = #222222;
    this.colorTablaGolpeada = #8ABF47;//#FF0000;
    this.colorTablaEquivocada = #C42531;
    this.colorTablaConfiguracion = #AAAA00;
    this.colorTablaMouseSobre = #0000AA;
    this.colorTablaSeleccionada =  #00AAAA;
    this.colorTablaSeleccionadaMousePresionado = #AA00AA;
    this.colorInstruccion = #D6D6D6;
    this.colorOpcion = #50ACD1;
    this.colorOpcionSeleccionada = #DBDB1F;
    //color colorTeclaInactiva = #D6D6D6;
    this.colorTeclaInactiva = #222222;
    this.colorTeclaCuenta = #EFE930;
    
    /*Lectura de tablas*/
    XML[] tablasXML = xmlConfiguracion.getChildren("tablas/tabla");
    tablas = new Tabla[tablasXML.length];
    
    for (int i = 0; i < tablasXML.length; i++) {
      String colorParse= "FF"+tablasXML[i].getString("color").substring(1);
      String colorInactivoParse= "FF"+tablasXML[i].getString("colorInactivo").substring(1);
      Tabla tabla = new Tabla(tablasXML[i].getInt("id"), color(unhex(colorParse)),color(unhex(colorInactivoParse)));
      tablas[i] =tabla;
    }
  }
  
  void salvarConfiguracion ( )
  {
    
  }
}