// Marimba Inclusiva
// Octubre 2016, Cartagena, Colombia
// https://marimbainclusiva.wordpress.com/
// https://github.com/marimba-inclusiva/marimba-inclusiva

//Clase Secuencia, define la secuencia a reproducir
class Secuencia
{
  int[] compas;
  float division;
  int tempo;
  int[][] melodia;
  int indiceMelodia = 0;
  boolean completada = false;
  
  Secuencia ( float division , int tempo  )
  {
    this.division = division;
    this.tempo = tempo;
  }
  
  
  int[] obtenerAcorde ( int ind )
  {
    int[] acorde = melodia[ind];
    //println ( "ACORDE LONGITUD : " +  acorde.length );
    return acorde;
  }
  
  int[] obtenerAcordeComparacion ( )
  {
    while ( melodia[indiceMelodia].length == 0 )
    {
      siguienteAcorde ( );
    }
    int[] acorde = melodia[indiceMelodia];
    return acorde;
  }
  
  void siguienteAcorde ( )
  {
    if ( indiceMelodia < melodia.length - 1  )
    {
      indiceMelodia ++;
    }
    else 
    {
      completada = true;
    }
  }
}