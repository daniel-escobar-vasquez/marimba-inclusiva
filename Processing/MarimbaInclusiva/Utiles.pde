// Marimba Inclusiva
// Octubre 2016, Cartagena, Colombia
// https://marimbainclusiva.wordpress.com/
// https://github.com/marimba-inclusiva/marimba-inclusiva

//Clase de utilerias
class Utiles
{
  
  HashMap<String,Integer> notas = new HashMap<String,Integer>();

  Utiles ( )
  {
    notas.put("DO4", 1);
    notas.put("RE4", 2);
    notas.put("MI4", 3);
    notas.put("FA4", 4);
    notas.put("SOL4", 5);
    notas.put("LA4", 6);
    notas.put("SI4", 7);
    notas.put("DO5", 8);
    notas.put("RE5", 9);
    notas.put("MI5", 10);
    notas.put("FA5", 11);
    notas.put("SOL5", 12);
    notas.put("LA5", 13);
    notas.put("SI5", 14);
    notas.put("DO6", 15);
    notas.put("RE6", 16);
    notas.put("SILENCIO", 0);
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
  
  float getSecuenciaCompas(int val){
  
    switch(val){
      case 1: return SecuenciaCompas.NEGRA; 
      case 2: return SecuenciaCompas.CORCHEA;
      case 3: return SecuenciaCompas.SEMICORCHEA;
      default: return SecuenciaCompas.NEGRA;
    }
  }
  
  Integer getNota(String val){
    if(val.equals("") || val.equals(null)){
      return notas.get("SILENCIO");
    }
    return notas.get(val);
  }


}