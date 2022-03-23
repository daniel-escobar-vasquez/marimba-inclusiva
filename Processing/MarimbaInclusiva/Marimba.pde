// Marimba Inclusiva //<>// //<>// //<>// //<>//
// Octubre 2016, Cartagena, Colombia
// https://marimbainclusiva.wordpress.com/
// https://github.com/marimba-inclusiva/marimba-inclusiva

//Clase Marimba, define el objeto Marimba a proyectar
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
  color[] colores;
    
  
  Marimba ( int numTab , int ancho , int altoTabGran , int altoTabPeq, Tabla[] arregloTablas)
  {
    this.numeroTablas = numTab;
    this.anchoMarimba = ancho;
    this.altoTablaGrande = altoTabGran;
    this.altoTablaPequena = altoTabPeq;
    this.tablaSeleccionada = 0;
    this.tablaOpcionSeleccionada = 0;
    
    if (arregloTablas == null ){
      //crearTablas();//Habilitar para pintar talas uniformemente
      crearTablasCromaticas();
      crearNuevaConfiguracion ();
    }
    else {
      aplicarConfiguracionCargada (arregloTablas );
    }
  }
    
  void actualizar ( )
  {
  }
  
  //Creación manual de tablas
  void aplicarConfiguracionCargada (Tabla[] arregloTablas )
  {
    this.arregloTablas= arregloTablas;
    println ( "Marimba aplicarConfiguracionCargada" );
  }
  
  //Generación default de tablas
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
  
  //Genera tablas con su respectivo color
  void crearTablasCromaticas( )
  {
    arregloTablas = new Tabla [ numeroTablas ];
    colores = new color[7];
    colores[0] = #FF0000;
    colores[1] = #FCA306;
    colores[2] = #FFFF00;
    colores[3] = #44AC33;
    colores[4] = #00A6AF;
    colores[5] = #443B90;
    colores[6] = #C63A8E;
    
    for ( int i = 0 ; i < numeroTablas ; i++ )
    {
        int j = i%7; //<>// //<>// //<>// //<>// //<>// //<>//
        arregloTablas [ i ] = new Tabla ( i + 1, colores[j],colores[j]);
    }
  }
  
  //Genera tablas de color uniforme
  void crearTablas ( )
  {
    arregloTablas = new Tabla [ numeroTablas ];
    for ( int i = 0 ; i < numeroTablas ; i++ )
    {
      color col = #8ABF47;
      arregloTablas [ i ] = new Tabla ( i + 1, col,col);
    }
  }  
}