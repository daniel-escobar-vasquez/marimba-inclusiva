#include <Piezoelectrico.h>
#include <Wire.h>

Piezoelectrico tabla1,tabla2,tabla3,tabla4,tabla5,tabla6,tabla7,tabla8,
               tabla9,tabla10,tabla11,tabla12,tabla13,tabla14,tabla15,tabla16;
               
unsigned int umbral = 200;
unsigned int rebote = 250;
boolean cambio = false;
String mensajeMarimba;
boolean mostrarDepuracion = true;


void setup(){

  Serial.begin(9600);
  pinMode(53, OUTPUT);
  configurarTablas ( );
}

void loop()
{
  leerTablas ( );
  leerMensaje();
}

