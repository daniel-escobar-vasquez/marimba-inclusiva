// Marimba Didáctica
// Abril/Mayo 2016
// Daniel Escobar Vásquez  danielescobar.co

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