// Marimba Inclusiva //<>// //<>// //<>// //<>//
// Octubre 2016, Cartagena, Colombia
// https://marimbainclusiva.wordpress.com/
// https://github.com/marimba-inclusiva/marimba-inclusiva

//Clase Arduino, realiza la conexión a Arduino
class Iluminacion
{
  
  boolean activo = true;
  
  Iluminacion ( )
  {
    
  }
  
  void dibujar ( )
  {
     noStroke ( );
     fill ( 255,3,3 );
     rect ( 0 , 545 , 1280  , 140 );
     
     ellipse ( 1180 , 400 , 200 , 200 );
  }
  
}
