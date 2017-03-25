// Marimba Inclusiva
// Octubre 2016, Cartagena, Colombia
// https://marimbainclusiva.wordpress.com/
// https://github.com/marimba-inclusiva/marimba-inclusiva

//Clase SecuenciaComparador
class SecuenciaComparador
{
  Secuencia secuenciaActual;
  Acorde acordeActual;
  boolean secuenciaFallada = false;
  
  
  SecuenciaComparador ( )
  {
  }
  
  void definirSecuencia ( Secuencia secuencia )
  {
    secuenciaActual = secuencia;
    configurarParaSecuenciaActual ( );
  }
  
  void configurarParaSecuenciaActual ( )
  {
    secuenciaActual.indiceMelodia = 0;
    secuenciaActual.completada = false;
    secuenciaFallada = false;
    generarAcordeActual ( );
  }
  
  boolean compararGolpe ( int golpe  )
  {
    boolean acierto = acordeActual.compararGolpe ( golpe );
    return acierto;
  }
  
  void generarAcordeActual ( )
  {
    //acordeActual = new Acorde ( secuenciaActual.obtenerAcorde ( secuenciaActual.indiceMelodia ) );
    acordeActual = new Acorde ( secuenciaActual.obtenerAcordeComparacion ( ) );
  }
}