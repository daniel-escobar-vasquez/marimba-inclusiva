// Marimba Didáctica
// Abril/Mayo 2016
// Daniel Escobar Vásquez  danielescobar.co

class LapsoEspera
{
  int lapso;
  long tiempoInicioEspera;
  boolean esperando = false;
  
  LapsoEspera (  )
  {
    
  }
  
  boolean esperaTerminada ( )
  {
    if ( millis ( ) - tiempoInicioEspera > lapso )
    {
      esperando = false;
      return true;
    }
    return false;
  }
  
  void iniciarEspera ( int lapso )
  {
    this.lapso = lapso;
    tiempoInicioEspera = millis ( );
    esperando = true;
  }
}