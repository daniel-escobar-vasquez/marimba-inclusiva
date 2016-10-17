// Marimba Didáctica
// Abril/Mayo 2016
// Daniel Escobar Vásquez  danielescobar.co

class Marimba
{
  int numeroTablas;
  int anchoMarimba;
  int altoTablaGrande;
  int altoTablaPequena;
  int posicionX;
  int posicionY;
  int tablaSeleccionada;
  int tablaOpcionSeleccionada;
  Tabla[] arregloTablas;
  
  
  
  Marimba ( int numTab , XML config , int ancho , int altoTabGran , int altoTabPeq, Tabla[] arregloTablas )
  {
    numeroTablas = numTab;
    anchoMarimba = ancho;
    altoTablaGrande = altoTabGran;
    altoTablaPequena = altoTabPeq;
    tablaSeleccionada = 0;
    tablaOpcionSeleccionada = 0;
    
    this.arregloTablas= arregloTablas;
    //crearTablas ( );
    
    if ( config == null ){
      crearNuevaConfiguracion ( );
    }
    else {
      aplicarConfiguracionCargada ( );
    }
  }
  
  
  void actualizar ( )
  {
  }
  
  void aplicarConfiguracionCargada ( )
  {
    println ( "Marimba aplicarConfiguracionCargada" );
  }
  
  void crearNuevaConfiguracion ( )
  {
    println ( "Marimba crearNuevaConfiguracion" );
    
    int distanciaTablas = anchoMarimba / numeroTablas;
    int decrementoAltura = int ( ( altoTablaGrande - altoTablaPequena ) / numeroTablas  ) ;
    for ( int i = 0 ; i < numeroTablas ; i++ )
    {
      arregloTablas [ i ].configurar ( distanciaTablas * i , int ( decrementoAltura * i * 0.5 ) , int ( distanciaTablas * 0.8) , altoTablaGrande - decrementoAltura * i , 0 );
    } 
    
  }
  
  void crearTablas ( )
  {
    arregloTablas = new Tabla [ numeroTablas ];
    for ( int i = 0 ; i < numeroTablas ; i++ )
    {
      color col = #FF0000;
      arregloTablas [ i ] = new Tabla ( i + 1, col,col);
    }
  }
}