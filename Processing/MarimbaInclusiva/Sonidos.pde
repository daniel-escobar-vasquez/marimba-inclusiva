// Marimba Didáctica
// Abril/Mayo 2016
// Daniel Escobar Vásquez  danielescobar.co

class Sonidos
{
  Minim minim;
  AudioPlayer tabla1,tabla2,tabla3,tabla4,tabla5,tabla6,tabla7,tabla8,tabla9,tabla10,tabla11,tabla12,tabla13,tabla14,tabla15,tabla16;
  ArrayList<AudioPlayer> listaSonidos = new ArrayList<AudioPlayer>();

  Sonidos ( PApplet parent )
  {
    minim = new Minim ( parent ); 
    
    tabla1 = minim.loadFile("DO4.mp3");
    tabla2 = minim.loadFile("RE4.mp3");
    tabla3 = minim.loadFile("MI4.mp3");
    tabla4 = minim.loadFile("FA4.mp3");
    tabla5 = minim.loadFile("SOL4.mp3");
    tabla6 = minim.loadFile("LA4.mp3");
    tabla7 = minim.loadFile("SI4.mp3");
    tabla8 = minim.loadFile("DO5.mp3");
    tabla9 = minim.loadFile("RE5.mp3");
    tabla10 = minim.loadFile("MI5.mp3");
    tabla11 = minim.loadFile("FA5.mp3");
    tabla12 = minim.loadFile("SOL5.mp3");
    tabla13 = minim.loadFile("LA5.mp3");
    tabla14 = minim.loadFile("SI5.mp3");
    tabla15 = minim.loadFile("DO6.mp3");
    tabla16 = minim.loadFile("RE6.mp3");
    
    listaSonidos.add ( tabla1 );
    listaSonidos.add ( tabla2 );
    listaSonidos.add ( tabla3 );
    listaSonidos.add ( tabla4 );
    listaSonidos.add ( tabla5 );
    listaSonidos.add ( tabla6 );
    listaSonidos.add ( tabla7 );
    listaSonidos.add ( tabla8 );
    listaSonidos.add ( tabla9 );
    listaSonidos.add ( tabla10 );
    listaSonidos.add ( tabla11 );
    listaSonidos.add ( tabla12 );
    listaSonidos.add ( tabla13 );
    listaSonidos.add ( tabla14 );
    listaSonidos.add ( tabla15 );
    listaSonidos.add ( tabla16 );
  }
  
  void reproducirSonido ( int tabla )
  {
    if ( tabla > 0 && tabla <= 16 )
    {
      listaSonidos.get ( tabla - 1 ).rewind();
      listaSonidos.get ( tabla - 1 ).play();
    }
  }
  
  void reproducirAcorde ( int[] acorde )
  {
    for ( int i = 0 ; i < acorde.length ; i++ )
    {
      reproducirSonido ( acorde [ i ] );
    }
  }
}