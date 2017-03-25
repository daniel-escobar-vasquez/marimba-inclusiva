// Marimba Inclusiva //<>//
// Octubre 2016, Cartagena, Colombia
// https://marimbainclusiva.wordpress.com/
// https://github.com/marimba-inclusiva/marimba-inclusiva

//Clase Instruccion
class Instruccion
{
  String mensaje;
  int duracion;
  int tiempoInicioInstruccion;
  boolean seleccion;
  ArrayList<Integer> seleccionTabla = new ArrayList<Integer>();
  ArrayList<String> seleccionMensaje = new ArrayList<String>();
  boolean partirInstruccion;
  PImage iconoInstruccion;
  ArrayList<PImage> seleccionIcono = new ArrayList<PImage>();
  
  Instruccion ( String mensaje , int duracion , PImage iconoInstruccion, boolean partir  )
  {
    this.mensaje = mensaje;
    this.duracion = duracion;
    this.partirInstruccion = partir;
    this.iconoInstruccion = iconoInstruccion;
    this.seleccion = false;
  }
  
  void iniciar ( )
  {
    tiempoInicioInstruccion = millis ( );
  }
  
  boolean verificarFinalEspera ( )
  {
    if ( millis ( ) - tiempoInicioInstruccion > duracion )
    {
      return true;
    }
    return false;
  }
  
  void ingresarOpcionSeleccion ( int tabla , String mensaje, PImage icono )
  {
    seleccion = true;
    seleccionTabla.add ( tabla );
    seleccionMensaje.add ( mensaje );
    seleccionIcono.add(icono);
  }
}