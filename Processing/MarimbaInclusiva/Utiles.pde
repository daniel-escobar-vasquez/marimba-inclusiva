// Marimba Didáctica
// Abril/Mayo 2016
// Daniel Escobar Vásquez  danielescobar.co

class Utiles
{
  
  Utiles ( )
  {
  }
  
  boolean mouseSobreRectangulo ( int x , int y , int width , int height )
  {
    if ( mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y + height )
    {
      return true;
    } else {
      return false;
    }
  }


}