// Marimba Inclusiva
// Octubre 2016, Cartagena, Colombia
// https://marimbainclusiva.wordpress.com/
// https://github.com/marimba-inclusiva/marimba-inclusiva

//Clase Tabla, define y configura las propiedades de un objeto Tabla
class Tabla
{
  
  int estado;
  int numeroTabla;
  int posX;
  int posY;
  int ancho;
  int alto;
  int rotacion;
  color colorTabla;
  
  int duracionGolpe = 200;
  long cuentaGolpe; 
  int duracionSeleccionOpcion = 1000;
  long cuentaSeleccionOpcion;
  String valorOpcionSeleccion;
  
  color colorActual;
  color colorInactivo;
  color colorGolpe;

  Tabla ( int numTab, color colorTabla)
  {
    estado = TablaEstados.LIBRE;
    numeroTabla = numTab;
    this.colorActual = colorTabla;
    this.colorInactivo = colorTabla;
  }  
  
  Tabla ( int numTab, color colorTabla, color colorInactivo)
  {
    estado = TablaEstados.LIBRE;
    numeroTabla = numTab;
    this.colorActual = colorTabla;
    this.colorInactivo = colorInactivo;
  }
  
  void configurar ( int px , int py , int anc , int alt , int rot )
  {
    posX = px;
    posY = py;
    ancho = anc;
    alto = alt;
    rotacion = rot;
  }
  
  
  boolean obtenerGolpeTerminado ( )
  {
    if ( millis ( ) - cuentaGolpe > duracionGolpe )
    {
       return true;
    }
    return false;
  }
  
  boolean obtenerSeleccionOpcionTerminada ( )
  {
    if ( millis ( ) - cuentaSeleccionOpcion > duracionSeleccionOpcion )
    {
       return true;
    }
    return false;
  }  
}
  