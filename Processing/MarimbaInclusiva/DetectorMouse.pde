// Marimba Inclusiva //<>// //<>// //<>// //<>//
// Octubre 2016, Cartagena, Colombia
// https://marimbainclusiva.wordpress.com/
// https://github.com/marimba-inclusiva/marimba-inclusiva

//Clase DetectorMouse
class DetectorMouse
{
  boolean mouseActivo;
  long tiempoActivacion;
  int lapsoDesactivacion;
  
  DetectorMouse ( int lapso )
  {
    mouseActivo = false;
    lapsoDesactivacion = lapso;
  }
  
  boolean obtenerActivacion ( )
  {
    if ( millis ( ) - tiempoActivacion > lapsoDesactivacion )
    {
      desactivarMouse ( );
    }
    
    return mouseActivo;
  }
  
  void activarMouse ( )
  {
    mouseActivo = true;
    tiempoActivacion = millis ( );
  }
  
  void desactivarMouse ( )
  {
    mouseActivo = false;
  }
}