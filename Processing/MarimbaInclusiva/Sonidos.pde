// Marimba Inclusiva
// Octubre 2016, Cartagena, Colombia
// https://marimbainclusiva.wordpress.com/
// https://github.com/marimba-inclusiva/marimba-inclusiva

//Clase Sonidos, definición de 12 sonidos utilizando la libreria beads
class Sonidos
{
 /*
   Minim minim;
   AudioPlayer tabla1,tabla2,tabla3,tabla4,tabla5,tabla6,tabla7,tabla8,tabla9,tabla10,tabla11,tabla12,tabla13,tabla14,tabla15,tabla16;
   ArrayList<AudioPlayer> listaSonidos = new ArrayList<AudioPlayer>();
  */
  
  AudioContext ac;
AudioContext ac1,ac2,ac3,ac4,ac5,ac6,ac7,ac8,ac9,ac10,ac11,ac12,ac13,ac14,ac15,ac16;
Gain g;
Gain g1,g2,g3,g4,g5,g6,g7,g8,g9,g10,g11,g12,g13,g14,g15,g16;

String audioFileName1 = sketchPath() +"/data/DO4.mp3";
String audioFileName2 = sketchPath() +"/data/RE4.mp3";
String audioFileName3 = sketchPath() +"/data/MI4.mp3";
String audioFileName4 = sketchPath() +"/data/FA4.mp3";
String audioFileName5 = sketchPath() +"/data/SOL4.mp3";
String audioFileName6 = sketchPath() +"/data/LA4.mp3";
String audioFileName7 = sketchPath() +"/data/SI4.mp3";
String audioFileName8 = sketchPath() +"/data/DO5.mp3";
String audioFileName9 = sketchPath() +"/data/RE5.mp3";
String audioFileName10 = sketchPath() +"/data/MI5.mp3";
String audioFileName11 = sketchPath() +"/data/FA5.mp3";
String audioFileName12 = sketchPath() +"/data/SOL5.mp3";
String audioFileName13 = sketchPath() +"/data/LA5.mp3";
String audioFileName14 = sketchPath() +"/data/SI5.mp3";
String audioFileName15 = sketchPath() +"/data/DO6.mp3";
String audioFileName16 = sketchPath() +"/data/RE6.mp3";

SamplePlayer player1,player2,player3,player4,player5,player6,player7,player8,player9,player10,player11,player12,player13,player14,player15,player16;

ArrayList<SamplePlayer> listaSonidos = new ArrayList<SamplePlayer>();
ArrayList<AudioContext> listaContextos = new ArrayList<AudioContext>();


  Sonidos ( PApplet parent )
  {
   // minim = new Minim ( parent ); 
    
   /* tabla1 = minim.loadFile("DO4.mp3");
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
    listaSonidos.add ( tabla16 );*/
    
    ac = new AudioContext();
  ac1 = new AudioContext();
  ac2 = new AudioContext();
  ac3 = new AudioContext();
  ac4 = new AudioContext();
  ac5 = new AudioContext();
  ac6 = new AudioContext();
  ac7 = new AudioContext();
  ac8 = new AudioContext();
  ac9 = new AudioContext();
  ac10 = new AudioContext();
  ac11 = new AudioContext();
  ac12 = new AudioContext();
  ac13 = new AudioContext();
  ac14 = new AudioContext();
  ac15 = new AudioContext();
  ac16 = new AudioContext();
  
  g1 = new Gain(ac1, 2, 0.2);
  g2 = new Gain(ac2, 2, 0.2);
  g3 = new Gain(ac3, 2, 0.2);
  g4 = new Gain(ac4, 2, 0.2);
  g5 = new Gain(ac5, 2, 0.2);
  g6 = new Gain(ac6, 2, 0.2);
  g7 = new Gain(ac7, 2, 0.2);
  g8 = new Gain(ac8, 2, 0.2);
  g9 = new Gain(ac9, 2, 0.2);
  g10 = new Gain(ac10, 2, 0.2);
  g11= new Gain(ac11, 2, 0.2);
  g12 = new Gain(ac12, 2, 0.2);
  g13 = new Gain(ac13, 2, 0.2);
  g14 = new Gain(ac14, 2, 0.2);
  g15 = new Gain(ac15, 2, 0.2);
  g16 = new Gain(ac16, 2, 0.2);
 
  SamplePlayer player1 = new SamplePlayer( ac1 , SampleManager.sample(audioFileName1) );
  SamplePlayer player2 = new SamplePlayer( ac2 , SampleManager.sample(audioFileName2) );
  SamplePlayer player3 = new SamplePlayer( ac3 , SampleManager.sample(audioFileName3) );
  SamplePlayer player4 = new SamplePlayer( ac4 , SampleManager.sample(audioFileName4) );
  SamplePlayer player5 = new SamplePlayer( ac5 , SampleManager.sample(audioFileName5) );
  SamplePlayer player6 = new SamplePlayer( ac6 , SampleManager.sample(audioFileName6) );
  SamplePlayer player7 = new SamplePlayer( ac7 , SampleManager.sample(audioFileName7) );
  SamplePlayer player8 = new SamplePlayer( ac8 , SampleManager.sample(audioFileName8) );
  SamplePlayer player9 = new SamplePlayer( ac9 , SampleManager.sample(audioFileName9) );
  SamplePlayer player10 = new SamplePlayer( ac10 , SampleManager.sample(audioFileName10) );
  SamplePlayer player11 = new SamplePlayer( ac11 , SampleManager.sample(audioFileName11) );
  SamplePlayer player12 = new SamplePlayer( ac12 , SampleManager.sample(audioFileName12) );
  SamplePlayer player13 = new SamplePlayer( ac13 , SampleManager.sample(audioFileName13) );
  SamplePlayer player14 = new SamplePlayer( ac14 , SampleManager.sample(audioFileName14) );
  SamplePlayer player15 = new SamplePlayer( ac15 , SampleManager.sample(audioFileName15) );
  SamplePlayer player16 = new SamplePlayer( ac16 , SampleManager.sample(audioFileName16) );
  
  listaSonidos.add ( player1 );
  listaSonidos.add ( player2 );
  listaSonidos.add ( player3 );
  listaSonidos.add ( player4 );
  listaSonidos.add ( player5 );
  listaSonidos.add ( player6 );
  listaSonidos.add ( player7 );
  listaSonidos.add ( player8 );
  listaSonidos.add ( player9 );
  listaSonidos.add ( player10 );
  listaSonidos.add ( player11 );
  listaSonidos.add ( player12 );
  listaSonidos.add ( player13 );
  listaSonidos.add ( player14 );
  listaSonidos.add ( player15 );
  listaSonidos.add ( player16 );
  
   player1.setKillOnEnd(false);
   player1.setPosition (0);
   player2.setKillOnEnd(false);
   player2.setPosition (0);
   player3.setKillOnEnd(false);
   player3.setPosition (0);
   player4.setKillOnEnd(false);
   player4.setPosition (0);
   player5.setKillOnEnd(false);
   player5.setPosition (0);
   player6.setKillOnEnd(false);
   player6.setPosition (0);
   player7.setKillOnEnd(false);
   player7.setPosition (0);
   player8.setKillOnEnd(false);
   player8.setPosition (0);
   player9.setKillOnEnd(false);
   player9.setPosition (0);
   player10.setKillOnEnd(false);
   player10.setPosition (0);
   player11.setKillOnEnd(false);
   player11.setPosition (0);
   player12.setKillOnEnd(false);
   player12.setPosition (0);
   player13.setKillOnEnd(false);
   player13.setPosition (0);
   player14.setKillOnEnd(false);
   player14.setPosition (0);
   player15.setKillOnEnd(false);
   player15.setPosition (0);
   player16.setKillOnEnd(false);
   player16.setPosition (0);
   
   g1.addInput(player1);
   g2.addInput(player2);
   g3.addInput(player3);
   g4.addInput(player4);
   g5.addInput(player5);
   g6.addInput(player6);
   g7.addInput(player7);
   g8.addInput(player8);
   g9.addInput(player9);
   g10.addInput(player10);
   g11.addInput(player11);
   g12.addInput(player12);
   g13.addInput(player13);
   g14.addInput(player14);
   g15.addInput(player15);
   g16.addInput(player16);
 
   ac1.out.addInput(g1);
   ac2.out.addInput(g2);
   ac3.out.addInput(g3);
   ac4.out.addInput(g4);
   ac5.out.addInput(g5);
   ac6.out.addInput(g6);
   ac7.out.addInput(g7);
   ac8.out.addInput(g8);
   ac9.out.addInput(g9);
   ac10.out.addInput(g10);
   ac11.out.addInput(g11);
   ac12.out.addInput(g12);
   ac13.out.addInput(g13);
   ac14.out.addInput(g14);
   ac15.out.addInput(g15);
   ac16.out.addInput(g16);
 
   listaContextos.add ( ac1 );
   listaContextos.add ( ac2 );
   listaContextos.add ( ac3 );
   listaContextos.add ( ac4 );
   listaContextos.add ( ac5 );
   listaContextos.add ( ac6 );
   listaContextos.add ( ac7 );
   listaContextos.add ( ac8 );
   listaContextos.add ( ac9 );
   listaContextos.add ( ac10 );
   listaContextos.add ( ac11 );
   listaContextos.add ( ac12 );
   listaContextos.add ( ac13 );
   listaContextos.add ( ac14 );
   listaContextos.add ( ac15 );
   listaContextos.add ( ac16 );
   
  }
  
  void reproducirSonido( int indiceSonido )
{
  SamplePlayer player = listaSonidos.get ( indiceSonido - 1 );
  player.setPosition (0);
  listaContextos.get ( indiceSonido - 1 ).start();
} 

  /*
  void reproducirSonido ( int tabla )
  {
    if ( tabla > 0 && tabla <= 16 )
    {
      listaSonidos.get ( tabla - 1 ).rewind();
      listaSonidos.get ( tabla - 1 ).play();
    }
  }*/
  
  void reproducirAcorde ( int[] acorde )
  {
    for ( int i = 0 ; i < acorde.length ; i++ )
    {
      reproducirSonido ( acorde [ i ] );
    }
  }
}