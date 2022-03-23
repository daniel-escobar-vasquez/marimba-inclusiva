// Marimba Inclusiva //<>// //<>// //<>//
// Octubre 2017
// https://www.facebook.com/marimbainclusiva/
// https://github.com/marimba-inclusiva/marimba-inclusiva

//Clase Acorde
class Acorde
{
  ArrayList<Nota> notas = new ArrayList<Nota>();
  boolean completado = false;
  
  Acorde ( int[] notas )
  {
    for ( int i = 0 ; i < notas.length ; i++ )
    {
      Nota nota = new Nota ( notas [ i ] );
      agregarNota ( nota );
    }
  }
  
  void agregarNota ( Nota nota )
  {
    notas.add ( nota );
  }
  
  boolean compararGolpe ( int golpe )
  {
    boolean acierto = false;
    for ( int i = 0; i < notas.size ( ) ; i++ )
    {
      if ( notas.get(i).tabla == golpe )
      {
        notas.get(i).tocada = true;
        acierto = true;
      }
    }
    
    verificarAcordeCompletado ( );
    return acierto;
  }
  
  void verificarAcordeCompletado ( )
  {
    boolean tmpCompl = true;
    for ( int i = 0; i < notas.size ( ) ; i++ )
    {
      if ( notas.get(i).tocada == false )
      {
        tmpCompl = false;
      }
    }
    completado = tmpCompl;
  }
  
}