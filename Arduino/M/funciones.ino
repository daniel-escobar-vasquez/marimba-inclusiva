void vibrar ( )
{
  digitalWrite(53, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(50);              // wait for a second
  digitalWrite(53, LOW);    // turn the LED off by making the voltage LOW
  delay(50);              // wait for a second
}

void configurarTablas ( )
{
  tabla1.configurarSensor (  A0 , umbral , rebote );
  tabla2.configurarSensor (  A1 , umbral , rebote );
  tabla3.configurarSensor (  A2 , umbral , rebote );
  tabla4.configurarSensor (  A3 , umbral , rebote );
  tabla5.configurarSensor (  A4 , umbral , rebote );
  tabla6.configurarSensor (  A5 , umbral , rebote );
  tabla7.configurarSensor (  A6 , umbral , rebote );
  tabla8.configurarSensor (  A7 , umbral , rebote );
  tabla9.configurarSensor (  A8 , umbral , rebote );
  tabla10.configurarSensor ( A9 , umbral , rebote );
  tabla11.configurarSensor ( A10 , umbral , rebote );
  tabla12.configurarSensor ( A11 , umbral , rebote );
  tabla13.configurarSensor ( A12 , umbral , rebote );
  tabla14.configurarSensor ( A13 , umbral , rebote );
  tabla15.configurarSensor ( A14 , umbral , rebote );
  tabla16.configurarSensor ( A15 , umbral , rebote );
}

boolean leerTablas ( )
{
  mensajeMarimba = "";
  cambio = false;

  tabla1.leerSensor ( );
  tabla2.leerSensor ( );
  tabla3.leerSensor ( );
  tabla4.leerSensor ( );
  tabla5.leerSensor ( );
  tabla6.leerSensor ( );
  tabla7.leerSensor ( );
  tabla8.leerSensor ( );
  tabla9.leerSensor ( );
  tabla10.leerSensor ( );
  tabla11.leerSensor ( );
  tabla12.leerSensor ( );
  tabla13.leerSensor ( );
  tabla14.leerSensor ( );
  tabla15.leerSensor ( );
  tabla16.leerSensor ( );
  
  if (tabla1.activo)
  {
     //mensajeMarimba = mensajeMarimba + "1;"; 
     //cambio = true;
     Serial.write ( 1 );  
     vibrar ( );
  }
  if (tabla2.activo)
  {
     //mensajeMarimba = mensajeMarimba + "2;"; 
     //cambio = true;
     Serial.write ( 2 ); 
     vibrar ( );
  }
  if (tabla3.activo)
  {
     //mensajeMarimba = mensajeMarimba + "3;"; 
     //cambio = true;
     Serial.write ( 3 );
     vibrar ( );
  }
  if (tabla4.activo)
  {
     //mensajeMarimba = mensajeMarimba + "4;"; 
     //cambio = true;
     Serial.write ( 4 );
     vibrar ( ); 
  }
  if (tabla5.activo)
  {
     //mensajeMarimba = mensajeMarimba + "5;"; 
     //cambio = true;
     Serial.write ( 5 );
     vibrar ( ); 
  }
  if (tabla6.activo)
  {
     //mensajeMarimba = mensajeMarimba + "6;"; 
     //cambio = true;
     Serial.write ( 6 );
    vibrar ( ); 
  }
  if (tabla7.activo)
  {
     //mensajeMarimba = mensajeMarimba + "7;"; 
     //cambio = true;
     Serial.write ( 7 );
  vibrar ( );   
  }
  if (tabla8.activo)
  {
     //mensajeMarimba = mensajeMarimba + "8;"; 
     //cambio = true;
     Serial.write ( 8 );
    vibrar ( ); 
  }
  if (tabla9.activo)
  {
     //mensajeMarimba = mensajeMarimba + "9;"; 
     //cambio = true;
     Serial.write ( 9 );
    vibrar ( ); 
  }
  if (tabla10.activo)
  {
     //mensajeMarimba = mensajeMarimba + "10;"; 
     //cambio = true;
     Serial.write ( 10 );
    vibrar ( ); 
  }
  if (tabla11.activo)
  {
     //mensajeMarimba = mensajeMarimba + "11;"; 
     //cambio = true;
     Serial.write ( 11 );
    vibrar ( ); 
  }
  if (tabla12.activo)
  {
     //mensajeMarimba = mensajeMarimba + "12;"; 
     //cambio = true;
     Serial.write ( 12 );
    vibrar ( ); 
  }
  if (tabla13.activo)
  {
     //mensajeMarimba = mensajeMarimba + "13;"; 
     //cambio = true;
     Serial.write ( 13 );
    vibrar ( ); 
  }
  if (tabla14.activo)
  {
     //mensajeMarimba = mensajeMarimba + "14;"; 
     //cambio = true;
     Serial.write ( 14 );
    vibrar ( ); 
  }
  if (tabla15.activo)
  {
     //mensajeMarimba = mensajeMarimba + "15;"; 
     //cambio = true;
     Serial.write ( 15 );
    vibrar ( ); 
  }
  if (tabla16.activo)
  {
     //mensajeMarimba = mensajeMarimba + "16;"; 
     //cambio = true;
     Serial.write ( 16 );
    vibrar ( ); 
  }
  
  return cambio;
}

void enviarMensaje ( String msj  )
{
    String tmpMsj = msj + " ";
    char mensaje[tmpMsj.length()];
    msj.toCharArray( mensaje , tmpMsj.length()  );
    Serial.write ( mensaje );
    //Serial.println("");
}

void mensajeDepuracion ( String msj , boolean tab , boolean salto)
{
  if ( mostrarDepuracion )
  {

      if ( salto )
      {
        Serial.println ( msj );
      }
      else
      {
        if ( tab ) msj += "\t";
        Serial.print(msj);
      }
  }
}

void leerMensaje(){
  if(Serial.available()){
    int incomingValue = Serial.read();
    if(incomingValue == 1){
        vibrar();
    }  
  }
}
