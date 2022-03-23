// Marimba Inclusiva
// Noviembre 2021, Guanajuato, Mexico
// https://marimbainclusiva.wordpress.com/
// https://github.com/marimba-inclusiva/marimba-inclusiva


//Clase Sonidos utilizando processing.sound
class Sonidos
{
  ArrayList<SoundFile> sonidos = new ArrayList<SoundFile>();
  ArrayList<SoundFile> shakers = new ArrayList<SoundFile>();
  
  float panAudio = -1.0; // audio izquierda
  float panShaker = 1.0; // audio derecha

  Sonidos ( PApplet parent, float panShaker)
  {
    this.panShaker = panShaker;
    this.panAudio = (-1) * panShaker;
    //Carga sonidos para canal 1 (bocina)
    for (int i = 1; i<= 16; i++){ // DO4 (1) - RE6(16)
      SoundFile audio = new SoundFile(parent, sketchPath() +"/data/canal_01/" + i + ".wav", true);
      sonidos.add(audio);
    }

    //Carga sonidos para canal 2 (shakers)
    for (int i = 1; i<= 16; i++){ // DO1 (1) - RE3(16)
      SoundFile audio = new SoundFile(parent, sketchPath() +"/data/canal_02/" + i + ".wav", true);
      shakers.add(audio);
    }
  }
  
  void reproducirSonido( int indiceSonido )
  {
    SoundFile player = sonidos.get ( indiceSonido - 1 );
    player.pan(this.panAudio);
    
    player.play();
    reproducirShaker(indiceSonido);
  }

  void reproducirShaker( int indiceSonido )
  {
    SoundFile playerShaker = shakers.get ( indiceSonido - 1 );
    playerShaker.pan(this.panShaker);
    playerShaker.play();
  }
  
  void reproducirAcorde ( int[] acorde )
  {
    for ( int i = 0 ; i < acorde.length ; i++ )
    {
      reproducirSonido ( acorde [ i ] );
    }
  }
}