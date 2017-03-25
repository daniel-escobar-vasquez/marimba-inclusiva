// Marimba Inclusiva //<>//
// Octubre 2016, Cartagena, Colombia
// https://marimbainclusiva.wordpress.com/
// https://github.com/marimba-inclusiva/marimba-inclusiva

//Clase InstruccionesLista
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
  
  InstruccionesLista ( )
  {
    PImage imgOptJuego;    
    PImage imgOptLibre;
    PImage imgOptContinuar;
    PImage imgOptRepetir;
    PImage imgOptSalir;
    
    PImage imgInstJuego;
    PImage imgCorrecto;
    PImage imgIncorrecto;
    imgOptJuego =    loadImage("01_juego.png");
    imgOptLibre =    loadImage("02_libre.png");
    imgOptRepetir =  loadImage("03_repetir.png");
    imgOptSalir =    loadImage("04_salir.png");
    imgOptContinuar =loadImage("05_continuar.png");
    imgIncorrecto =  loadImage("06_incorrecto.png");
    imgCorrecto =    loadImage("07_correcto.png");
    imgInstJuego =   loadImage("08_marimba.png");
    
    instruccionNombreProyecto      =  new Instruccion ( "MARIMBADIDÁCTICA" , 4000 , imgInstJuego, false );
    instruccionSeleccionarModo     =  new Instruccion ( "  SELECCIONA;    EL MODO;     DE JUEGO" , 10000 , null, true );
      instruccionSeleccionarModo.ingresarOpcionSeleccion ( 15 , OpcionesSeleccion.LIBRE,  imgOptLibre );
      instruccionSeleccionarModo.ingresarOpcionSeleccion ( 16 , OpcionesSeleccion.JUEGO,  imgOptJuego );
    instruccionTocarLibre          =  new Instruccion ( "TOCA LIBREMENTE" , 2000 , null, false );
    instruccionRegresarMenu          =  new Instruccion ( "             -" , 25000 , null, false );
      instruccionRegresarMenu.ingresarOpcionSeleccion ( 16 , OpcionesSeleccion.MENU, imgOptLibre );
    instruccionModoJuego           =  new Instruccion ( "   MODO JUEGO" , 2000 , null, false );
    instruccionMemorizarSecuencia  =  new Instruccion ( "    MEMORIZA;       LA;     SECUENCIA" , 1000 , null, true );
    instruccionRepetirSecuencia    =  new Instruccion ( "    REPITE;      LA;     SECUENCIA" , 2000 , imgInstJuego, true );
    instruccionIntentarNuevamente  =  new Instruccion ( "INTENTA;NUEVAMENTE" , 25000 , imgIncorrecto, true );
      instruccionIntentarNuevamente.ingresarOpcionSeleccion ( 15 , OpcionesSeleccion.INTENTAR, imgOptRepetir );
      instruccionIntentarNuevamente.ingresarOpcionSeleccion ( 16 , OpcionesSeleccion.SALIR, imgOptSalir );
    instruccionSecuenciaLograda    =  new Instruccion ( "   SECUENCIA;    LOGRADA" , 25000 , imgCorrecto, true );
      instruccionSecuenciaLograda.ingresarOpcionSeleccion ( 15 , OpcionesSeleccion.REPETIR, imgOptRepetir );
      instruccionSecuenciaLograda.ingresarOpcionSeleccion ( 16 , OpcionesSeleccion.CONTINUAR, imgOptContinuar );
    instruccionSiguienteSecuencia  =  new Instruccion ( "   SIGUIENTE;    SECUENCIA" , 100 , null, true );
    instruccionComenzarNuevamente  =  new Instruccion ( "  COMIENZA;   NUEVAMENTE" , 2000 , null, true );
    instruccionJuegoCompletado     =  new Instruccion ( "     JUEGO;   COMPLETADO" , 2000 , imgInstJuego, true );
  }
}