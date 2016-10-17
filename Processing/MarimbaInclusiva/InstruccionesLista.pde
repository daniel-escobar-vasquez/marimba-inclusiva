// Marimba Didáctica
// Abril/Mayo 2016
// Daniel Escobar Vásquez  danielescobar.co

class InstruccionesLista
{
  Instruccion instruccionNombreProyecto;
  Instruccion instruccionSeleccionarModo;
  Instruccion instruccionTocarLibre;
  Instruccion instruccionRegresarMenu;
  Instruccion instruccionModoJuego;
  Instruccion instruccionMemorizarSecuencia;
  Instruccion instruccionRepetirSecuencia;
  Instruccion instruccionIntentarNuevamente;
  Instruccion instruccionSecuenciaLograda;
  Instruccion instruccionSiguienteSecuencia;
  Instruccion instruccionComenzarNuevamente;
  Instruccion instruccionJuegoCompletado;
  Instruccion instruccionJuegoExtra;
  
  InstruccionesLista ( )
  {
    PImage imgOptJuego;    
    PImage imgOptLibre;
    PImage imgOptExtra;
    PImage imgOptContinuar;
    PImage imgOptRepetir;
    PImage imgOptSalir;
    
    PImage imgInstJuego;
    PImage imgCorrecto;
    PImage imgIncorrecto;
    imgOptJuego = loadImage("01_juego.png");
    imgOptLibre = loadImage("02_libre.png");
    imgOptExtra = loadImage("03_piragua.png");
    imgOptRepetir = loadImage("04_repetir.png");
    imgOptSalir = loadImage("05_salir.png");
    imgOptContinuar = loadImage("06_continuar.png");
    imgIncorrecto = loadImage("07_incorrecto.png");
    imgCorrecto = loadImage("08_correcto.png");
    imgInstJuego = loadImage("marimba_logo-06.png");
    
    instruccionNombreProyecto      =  new Instruccion ( "MARIMBADIDÁCTICA" , 4000 , imgInstJuego, false );//////////falta
    instruccionSeleccionarModo     =  new Instruccion ( "  SELECCIONA;    EL MODO;     DE JUEGO" , 10000 , imgInstJuego, true );///////////////falta
      instruccionSeleccionarModo.ingresarOpcionSeleccion ( 14 , OpcionesSeleccion.LIBRE,  imgOptLibre );
      instruccionSeleccionarModo.ingresarOpcionSeleccion ( 15 , OpcionesSeleccion.JUEGO,  imgOptJuego );
      instruccionSeleccionarModo.ingresarOpcionSeleccion ( 16 , OpcionesSeleccion.EXTRA, imgOptExtra );
    instruccionTocarLibre          =  new Instruccion ( "TOCA LIBREMENTE" , 4000 , imgInstJuego, false );/////////////////falta
    instruccionRegresarMenu          =  new Instruccion ( "             -" , 25000 , imgInstJuego, false );/////////////////falta
      instruccionRegresarMenu.ingresarOpcionSeleccion ( 16 , OpcionesSeleccion.MENU, imgOptLibre );
    instruccionModoJuego           =  new Instruccion ( "   MODO JUEGO" , 3000 , imgInstJuego, false );///////////////falta
    instruccionMemorizarSecuencia  =  new Instruccion ( "    MEMORIZA;       LA;     SECUENCIA" , 3500 , imgInstJuego, true );
    instruccionRepetirSecuencia    =  new Instruccion ( "    REPITE;      LA;     SECUENCIA" , 3500 , imgInstJuego, true );
    instruccionIntentarNuevamente  =  new Instruccion ( "INTENTA;NUEVAMENTE" , 25000 , imgInstJuego, true );///////////////falta
      instruccionIntentarNuevamente.ingresarOpcionSeleccion ( 15 , OpcionesSeleccion.INTENTAR, imgOptRepetir );
      instruccionIntentarNuevamente.ingresarOpcionSeleccion ( 16 , OpcionesSeleccion.SALIR, imgOptSalir );
    instruccionSecuenciaLograda    =  new Instruccion ( "   SECUENCIA;    LOGRADA" , 25000 , imgInstJuego, true );////////////falta
      instruccionSecuenciaLograda.ingresarOpcionSeleccion ( 15 , OpcionesSeleccion.REPETIR, imgOptRepetir );
      instruccionSecuenciaLograda.ingresarOpcionSeleccion ( 16 , OpcionesSeleccion.CONTINUAR, imgOptContinuar );
    instruccionSiguienteSecuencia  =  new Instruccion ( "   SIGUIENTE;    SECUENCIA" , 3000 , imgInstJuego, true );/////////////falta
    instruccionComenzarNuevamente  =  new Instruccion ( "  COMIENZA;   NUEVAMENTE" , 3000 , imgInstJuego, true );//////////////falta
    instruccionJuegoCompletado     =  new Instruccion ( "     JUEGO;   COMPLETADO" , 4000 , imgInstJuego, true );////////////////falta
    instruccionJuegoExtra          =  new Instruccion ( "SECUENCI PIRAGUA" , 4000 , imgInstJuego, false );///////////////falta
  }
}