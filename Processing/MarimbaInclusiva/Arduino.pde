// Marimba Didáctica
// Abril/Mayo 2016
// Daniel Escobar Vásquez  danielescobar.co

class Arduino
{
  Serial myPort;
  boolean activo = true;
  
  Arduino ( PApplet parent , String puerto , boolean activo)
  {
    this.activo = activo;
    if ( activo )
    myPort = new Serial( parent , puerto , 9600);
  }
  
  int leerPuerto ( )
  {
     int lectura = 0;
     if ( activo )
     {
       
       if ( myPort.available() > 0)
       { 
        lectura = myPort.read();   
       }
    }
    return lectura;
  }
  
  void limpiarPuerto ( )
  {
    if ( activo )
    {
      myPort.clear();
    }
  }
  
 void escribirPuerto()
 {
     myPort.write(1);
 }
}