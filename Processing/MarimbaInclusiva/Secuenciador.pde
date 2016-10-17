// Marimba Didáctica
// Abril/Mayo 2016
// Daniel Escobar Vásquez  danielescobar.co

class Secuenciador
{
  Secuencia secuenciaActual;
  float duracionSubdivision;
  long tiempoAcorde;
  boolean siguienteAcorde = true;
   
  Secuenciador ( )
  {
  }
  
  void definirSecuencia ( Secuencia secuencia )
  {
    secuenciaActual = secuencia;
    configurarParaSecuenciaActual ( );
  }
  
  void actualizar ( )
  {
    if ( millis ( ) - tiempoAcorde > duracionSubdivision )
    {
      siguienteAcorde = true;
    }
  }
  
  int[] obtenerAcordeActual ( )
  {
    tiempoAcorde = millis ( );
    siguienteAcorde = false;
    
    int[] tmpAcord;
    
    if ( secuenciaActual.completada )
    {
      return null;
    }
    else
    {
       tmpAcord = secuenciaActual.obtenerAcorde ( secuenciaActual.indiceMelodia );
       secuenciaActual.siguienteAcorde ( );
    }
    
    return tmpAcord;
  }
  
  void configurarParaSecuenciaActual ( )
  {
    //float tmpDiv = 60 / float ( secuenciaActual.tempo
    duracionSubdivision = ( 60.0 / secuenciaActual.tempo) * secuenciaActual.division * 1000;
    println ( "DURACIÓN SUBDIVISIÓN : " + duracionSubdivision );
    secuenciaActual.completada = false;
    secuenciaActual.indiceMelodia = 0;
  }
  
}