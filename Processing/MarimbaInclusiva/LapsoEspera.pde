// Marimba Inclusiva //<>//
// Octubre 2016, Cartagena, Colombia
// https://marimbainclusiva.wordpress.com/
// https://github.com/marimba-inclusiva/marimba-inclusiva

//Clase LapsoEspera
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