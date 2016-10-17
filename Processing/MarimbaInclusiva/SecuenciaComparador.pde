// Marimba Didáctica
// Abril/Mayo 2016
// Daniel Escobar Vásquez  danielescobar.co

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