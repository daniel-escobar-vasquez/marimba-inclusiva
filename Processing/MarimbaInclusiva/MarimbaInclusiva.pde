// Marimba Inclusiva
// Octubre 2017
// https://www.facebook.com/marimbainclusiva/
// https://github.com/marimba-inclusiva/marimba-inclusiva

import processing.serial.*;
import processing.sound.*;
import java.util.Arrays; 
import java.util.Map;

// INTEGRACIÓN A DOS PANTALLAS
import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress pantalla2; // envio a 

int estado;
int siguienteEstado;

Configuracion configuracion;
Marimba marimba;
Utiles utiles;
ProyeccionMarimba proyeccionMarimba;
DetectorMouse detectorMouse;
ImagenesLista imagenesLista;
MensajesLista mensajesLista;
InstruccionesLista instruccionesLista;
SecuenciasLista secuenciasLista;
Secuenciador secuenciador;
SecuenciaComparador secuenciaComparador;
Arduino arduino;
Sonidos sonidos;
LapsoEspera lapsoEspera;
boolean simularMarimbaConMouse = true; //Habilita uso de mouse
boolean usarArduino = false; //Habilita conexion con Arduino

void setup ( )
{
  
  size ( 1280 , 720 );
  //fullScreen(P2D, 2);
  noStroke();
  
  // INTEGRACIÓN OSC PARA PANTALLA
  oscP5 = new OscP5(this,12000);
  pantalla2 = new NetAddress("127.0.0.1",12001); // a donde envio los datos
  
  estado = MarimbaInclusivaEstados.INICIO; //Estado inicial
  sonidos = new Sonidos ( this, 1.0 ); //1.0 = shaker derecho, -1.0 shaker izquierdo
}

void draw ( )
{
  background(0);
  correrEstados ( );
}

// Inicio Maquina de Estados
void correrEstados ( )
{
  int golpe;

  OscMessage msgEstado = new OscMessage("/estado");
  switch ( estado )
  {
    case MarimbaInclusivaEstados.INICIO: //Inicializa todos los objetos y carga la configuración guardada en XML
      configuracion = new Configuracion ( "config.xml" );
      marimba = new Marimba ( configuracion.numeroTablas , configuracion.anchoMarimba , configuracion.altoTablaGrande , configuracion.altoTablaPequena, configuracion.arregloTablas);
      utiles = new Utiles ( );
      proyeccionMarimba = new ProyeccionMarimba ( marimba , configuracion );
      detectorMouse = new DetectorMouse ( configuracion.lapsoDesactivacionMouse );
      imagenesLista = new ImagenesLista ( );
      mensajesLista = new MensajesLista ( );
      instruccionesLista = new InstruccionesLista ( );
      secuenciasLista = configuracion.secuenciaManual? new SecuenciasLista(configuracion.listaSecuencias) : new SecuenciasLista();//Carga lista de secuencias manual o default
      secuenciador = new Secuenciador ( );
      secuenciaComparador = new SecuenciaComparador ( );
      arduino = new Arduino ( this, configuracion.puertoArduino , usarArduino );
      ///sonidos = new Sonidos ( this );
      lapsoEspera = new LapsoEspera ( );
      arduino.limpiarPuerto ( );
      
      irAMensajePrincipal ( );
      //estado = MarimbaInclusivaEstados.INSTRUCCION_SELECCIONAR_MODO;
      //proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionSeleccionarModo );

    break;
    
    case MarimbaInclusivaEstados.ESPERA:
      proyeccionMarimba.actualizarProyeccion ( );
      if ( detectorMouse.obtenerActivacion ( ) && !simularMarimbaConMouse )
      {
          estado = MarimbaInclusivaEstados.CONFIGURACION_PROYECCION;
          proyeccionMarimba.irAModoConfiguracionProyeccion ( );
      }
    break;
    
    case MarimbaInclusivaEstados.AUTOMATICO:
    break;
    
    case MarimbaInclusivaEstados.CONFIGURACION_PROYECCION:
      proyeccionMarimba.actualizarProyeccion ( );
      if ( !detectorMouse.obtenerActivacion ( )  && !simularMarimbaConMouse )
      {
          irAMensajePrincipal ( );
          //estado = MarimbaInclusivaEstados.INSTRUCCION_SELECCIONAR_MODO;
          //arduino.limpiarPuerto ( );
          //proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionSeleccionarModo );
      }
    break;
    
    case MarimbaInclusivaEstados.CONFIGURACION_TABLA:
    break;
    
    case MarimbaInclusivaEstados.IMAGEN_LOGO:
      proyeccionMarimba.actualizarProyeccion ( );
      if ( lapsoEspera.esperando )
      {
        if ( lapsoEspera.esperaTerminada ( ) )
        {
          irASeleccionarModo ( );
        }
      }
    break;
    
    case MarimbaInclusivaEstados.MENSAJE_PRINCIPAL:
      msgEstado.add(2);//INTRO - VIDEO
      oscP5.send(msgEstado, pantalla2);
      proyeccionMarimba.actualizarProyeccion ( );
      if ( lapsoEspera.esperando )
      {
        if ( lapsoEspera.esperaTerminada ( ) )
        {
          //irASeleccionarModo ( );
          irAImagenLogo ( );
        }
      }
    break;
    
    case MarimbaInclusivaEstados.MENSAJE_SECUENCIA:
      proyeccionMarimba.actualizarProyeccion ( );
      if ( lapsoEspera.esperando )
      {
        if ( lapsoEspera.esperaTerminada ( ) )
        {
          irAInstruccionMemorizarSecuencia ( );
          //irASeleccionarModo ( );
          //irAImagenLogo ( );
        }
      }
    break;
    
    case MarimbaInclusivaEstados.INSTRUCCION_NOMBRE_PROYECTO: //Estado inicial de proyeccion
      proyeccionMarimba.actualizarProyeccion ( );
      if ( proyeccionMarimba.instruccionActual.verificarFinalEspera ( ) )
      {
          estado = MarimbaInclusivaEstados.INSTRUCCION_SELECCIONAR_MODO;
          arduino.limpiarPuerto ( );
          proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionSeleccionarModo );
      }
    break;
    
    case MarimbaInclusivaEstados.INSTRUCCION_SELECCIONAR_MODO: //Estado de menu (seleccion modo libre-juego)
      msgEstado.add(3);//SELECCIONAR_MODO
      oscP5.send(msgEstado, pantalla2);
    
      proyeccionMarimba.actualizarProyeccion ( );
      
      if ( lapsoEspera.esperando )
      {
        if ( lapsoEspera.esperaTerminada ( ) )
        {
            switch ( proyeccionMarimba.valorSeleccionRealizada )
            {
              case OpcionesSeleccion.LIBRE:
                println ( "MODO LIBRE SELECCIONADO" );
                estado = MarimbaInclusivaEstados.INSTRUCCION_TOCAR_LIBRE;
                proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionTocarLibre );
              break;
              
              case OpcionesSeleccion.JUEGO:
                println ( "MODO JUEGO SELECCIONADO" );
                secuenciasLista.indiceLista = 0;
                secuenciasLista.listaCompletada = false;
                //estado = MarimbaInclusivaEstados.INSTRUCCION_MEMORIZA_SECUENCIA;
                //proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionMemorizarSecuencia );
                irAInstruccionMemorizarSecuencia ( );
              break;
            }
        }
      }
      else
      {
        if ( proyeccionMarimba.instruccionActual.verificarFinalEspera ( ) )
        {
            irAMensajePrincipal ( );
            //estado = MarimbaInclusivaEstados.INSTRUCCION_NOMBRE_PROYECTO;
            //proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionNombreProyecto );
        }
        else
        {
        
          golpe = arduino.leerPuerto ( );
          if ( golpe != 0 )
          {
            switch (golpe)
            {
              case 15:
                proyeccionMarimba.seleccionRealizada = true;
                proyeccionMarimba.valorSeleccionRealizada = OpcionesSeleccion.LIBRE;
              break;              
              case 16:
                proyeccionMarimba.seleccionRealizada = true;
                proyeccionMarimba.valorSeleccionRealizada = OpcionesSeleccion.JUEGO;
              break;              
            }
          }
          
          if ( proyeccionMarimba.seleccionRealizada )
          {
            switch ( proyeccionMarimba.valorSeleccionRealizada )
            {
              case OpcionesSeleccion.LIBRE:
                lapsoEspera.iniciarEspera ( 500 );
              break;
              
              case OpcionesSeleccion.JUEGO:
                lapsoEspera.iniciarEspera ( 500 );
              break;
            }
          }
        }
      }
     break;
    
    case MarimbaInclusivaEstados.MODO_LIBRE: /*Estado de modo libre*/
      msgEstado.add(4);//TOCAR_LIBRE
      oscP5.send(msgEstado, pantalla2);
    
      proyeccionMarimba.actualizarProyeccion ( );
      
      golpe = arduino.leerPuerto ( );
      if ( golpe != 0 )
      {
        println("ARDUINO TABLA : " + golpe );
        proyeccionMarimba.golpearTabla ( golpe );
        //sonidos.reproducirShaker(golpe);
        
        if ( simularMarimbaConMouse ) {
          detectorMouse.activarMouse ( );
        }
      }
      
      if ( !detectorMouse.obtenerActivacion ( ) && simularMarimbaConMouse )
      {          
          estado = MarimbaInclusivaEstados.INSTRUCCION_SELECCIONAR_MODO;
          arduino.limpiarPuerto ( );
          proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionSeleccionarModo );
      }
      
    break;
    
    
    case MarimbaInclusivaEstados.INSTRUCCION_TOCAR_LIBRE:
      proyeccionMarimba.actualizarProyeccion ( );
      if ( proyeccionMarimba.instruccionActual.verificarFinalEspera ( ) )
      {
          estado = MarimbaInclusivaEstados.MODO_LIBRE;
          arduino.limpiarPuerto ( );
          detectorMouse.activarMouse ( );
          proyeccionMarimba.irAModoLibre ( );
      }
    break;
    
    case MarimbaInclusivaEstados.INSTRUCCION_MODO_JUEGO:

    break;
    
    case MarimbaInclusivaEstados.INSTRUCCION_MEMORIZA_SECUENCIA:
      msgEstado.add(5);//MEMORIZA_SECUENCIA
      oscP5.send(msgEstado, pantalla2);
      proyeccionMarimba.actualizarProyeccion ( );
      if ( proyeccionMarimba.instruccionActual.verificarFinalEspera ( ) )
      {
          proyeccionMarimba.irAModoPresentacionSecuencia ( );
          estado = MarimbaInclusivaEstados.PAUSA_INICIO_PRESENTACION_SECUENCIA;
          lapsoEspera.iniciarEspera ( 700 );
          //proyeccionMarimba.irAModoPresentacionSecuencia ( );
          //estado = MarimbaInclusivaEstados.PRESENTACION_SECUENCIA;
          //secuenciador.definirSecuencia ( secuenciasLista.obtenerSecuencia ( ) );
          //println ( "MODO PRESENTACIÓN SECUENCIA" );
      }
    break;
    
    case MarimbaInclusivaEstados.PAUSA_INICIO_PRESENTACION_SECUENCIA:
      proyeccionMarimba.actualizarProyeccion ( );
      if ( lapsoEspera.esperando )
      {
        if ( lapsoEspera.esperaTerminada ( ) )
        {
          irAModoPresentacionSecuencia ( );
          //irAInstruccionMemorizarSecuencia ( );
          //irASeleccionarModo ( );
          //irAImagenLogo ( );
        }
      }
    break;
    
    case MarimbaInclusivaEstados.INSTRUCCION_REPETIR_SECUENCIA: /*Estado intentar de nuevo*/
      proyeccionMarimba.actualizarProyeccion ( );
      if ( proyeccionMarimba.instruccionActual.verificarFinalEspera ( ) )
      {
         estado = MarimbaInclusivaEstados.LECTURA_SECUENCIA;
         proyeccionMarimba.irAModoRepeticionSecuencia ( );
         arduino.limpiarPuerto ( );
         secuenciaComparador.definirSecuencia ( secuenciasLista.obtenerSecuencia ( ) );
         proyeccionMarimba.tablaGolpeada = false;
         println ( "MODO REPETICION SECUENCIA" );
      }
      
    break;
    
    case MarimbaInclusivaEstados.INSTRUCCION_INTENTAR_NUEVAMENTE_O_TERMINAR: /*Estado intentar nuevamente-continuar*/
      proyeccionMarimba.actualizarProyeccion ( );
      
      if ( lapsoEspera.esperando )
      {
        if ( lapsoEspera.esperaTerminada ( ) )
        {
        switch ( proyeccionMarimba.valorSeleccionRealizada )
            {
              case OpcionesSeleccion.INTENTAR:
                println ( "SELECCIÓN INTENTAR DE NUEVO" );
                irAInstruccionMemorizarSecuencia ( );
                //estado = MarimbaInclusivaEstados.INSTRUCCION_MEMORIZA_SECUENCIA;
                //proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionMemorizarSecuencia );
              break;
              
              case OpcionesSeleccion.SALIR:
                println ( "SELECCIÓN TERMINAR JUEGO" );
                estado = MarimbaInclusivaEstados.INSTRUCCION_SELECCIONAR_MODO;
                arduino.limpiarPuerto ( );
                proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionSeleccionarModo );
              break;
            }
        }
      }
      else
      {
        if ( proyeccionMarimba.instruccionActual.verificarFinalEspera ( ) )
        {
          irAMensajePrincipal ( );
           //estado = MarimbaInclusivaEstados.INSTRUCCION_NOMBRE_PROYECTO;
           // proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionNombreProyecto );
        }
        
        else
        {
          golpe = arduino.leerPuerto ( );
          if ( golpe != 0 )
          {
            switch (golpe)
            {
              case 15:
                proyeccionMarimba.seleccionRealizada = true;
                proyeccionMarimba.valorSeleccionRealizada = OpcionesSeleccion.INTENTAR;
              break;
              
              case 16:
                proyeccionMarimba.seleccionRealizada = true;
                proyeccionMarimba.valorSeleccionRealizada = OpcionesSeleccion.SALIR;
              break;
            }
          }
          
          if ( proyeccionMarimba.seleccionRealizada )
          {
            switch ( proyeccionMarimba.valorSeleccionRealizada )
            {
              case OpcionesSeleccion.INTENTAR:
                lapsoEspera.iniciarEspera ( 500 );
              break;
              
              case OpcionesSeleccion.SALIR:
                lapsoEspera.iniciarEspera ( 500 );
              break;
            }
          }
        }
      }
      
      
    break;

    case MarimbaInclusivaEstados.INSTRUCCION_SECUENCIA_LOGRADA: /*Estado finalizar*/
      proyeccionMarimba.actualizarProyeccion ( );
      
      if ( proyeccionMarimba.instruccionActual.verificarFinalEspera ( ) )
      {
          estado = MarimbaInclusivaEstados.INSTRUCCION_SELECCIONAR_MODO;
          arduino.limpiarPuerto ( );
          proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionSeleccionarModo );        
      }
      else
      {
        golpe = arduino.leerPuerto ( );
        if ( golpe != 0 )
        {
          switch (golpe)
          {
            case 15:
              proyeccionMarimba.seleccionRealizada = true;
              proyeccionMarimba.valorSeleccionRealizada = OpcionesSeleccion.REPETIR;
            break;
            
            case 16:
              proyeccionMarimba.seleccionRealizada = true;
              proyeccionMarimba.valorSeleccionRealizada = OpcionesSeleccion.CONTINUAR;
            break;
          }
        }
        
        if ( proyeccionMarimba.seleccionRealizada )
        {
          
          switch ( proyeccionMarimba.valorSeleccionRealizada )
          {
            case OpcionesSeleccion.REPETIR:
              println ( "SELECCIÓN REPETIR SECUENCIA" );
              irAInstruccionMemorizarSecuencia ( );
              //estado = MarimbaInclusivaEstados.INSTRUCCION_MEMORIZA_SECUENCIA;
              //proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionMemorizarSecuencia );
            break;
            
            case OpcionesSeleccion.CONTINUAR:
              println ( "SELECCIÓN CONTINUAR" );
              //->EVALUAR SI SE COMPLETARON TODAS LAS SECUENCIAS
              if ( secuenciasLista.listaCompletada )
              {
                println ( "->LISTA DE SECUENCIAS COMPLETADA" );
                println ( "INSTRUCCIÓN JUEGO COMPLETADO" );
                estado = MarimbaInclusivaEstados.INSTRUCCION_JUEGO_COMPLETADO;
                proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionJuegoCompletado );
              }
              else
              {
                println ( "->IR A SIGUIENTE SECUENCIA" );
                secuenciasLista.siguienteSecuencia ( );
                estado = MarimbaInclusivaEstados.INSTRUCCION_SIGUIENTE_SECUENCIA;
                proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionSiguienteSecuencia );
              }
              
            break;
          }
        }
      }

    break;
    
    case MarimbaInclusivaEstados.INSTRUCCION_REPETIR_AVANZAR_SECUENCIA:
    break;
    
    case MarimbaInclusivaEstados.INSTRUCCION_SIGUIENTE_SECUENCIA:
      proyeccionMarimba.actualizarProyeccion ( );
      if ( proyeccionMarimba.instruccionActual.verificarFinalEspera ( ) )
      {
        //irAInstruccionMemorizarSecuencia ( );
        irAMensajeSecuencia ( );
        //estado = MarimbaInclusivaEstados.INSTRUCCION_MEMORIZA_SECUENCIA;
        //proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionMemorizarSecuencia );
      }
    break;
    
    case MarimbaInclusivaEstados.INSTRUCCION_COMENZAR_NUEVAMENTE:
    break;
    
    case MarimbaInclusivaEstados.INSTRUCCION_JUEGO_COMPLETADO:
      proyeccionMarimba.actualizarProyeccion ( );
      if ( proyeccionMarimba.instruccionActual.verificarFinalEspera ( ) )
      {
        irAMensajePrincipal ( );
        //estado = MarimbaInclusivaEstados.INSTRUCCION_NOMBRE_PROYECTO;
        //proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionNombreProyecto );
      }
    break;
    
    case MarimbaInclusivaEstados.PRESENTACION_SECUENCIA:
      proyeccionMarimba.actualizarProyeccion ( );
      secuenciador.actualizar ( );
      if ( secuenciador.siguienteAcorde )
      {
        int[ ] acorde = secuenciador.obtenerAcordeActual ( );
        if ( acorde == null )
        {
         estado = MarimbaInclusivaEstados.LECTURA_SECUENCIA;
         proyeccionMarimba.irAModoRepeticionSecuencia ( );
         arduino.limpiarPuerto ( );
         secuenciaComparador.definirSecuencia ( secuenciasLista.obtenerSecuencia ( ) );
         proyeccionMarimba.tablaGolpeada = false;
         println ( "MODO REPETICION SECUENCIA" );
        }
        else
        {
          //Envia señal a Arduino
          proyeccionMarimba.golpearAcorde ( acorde);
          
          if(usarArduino){
            println("Escribe Serial Arduino");
            //arduino.escribirPuerto();
          }
          sonidos.reproducirAcorde ( acorde );
        }
      }
    
    break;
    
    case MarimbaInclusivaEstados.LECTURA_SECUENCIA:
      
      proyeccionMarimba.actualizarProyeccion ( );
      
      if ( secuenciaComparador.secuenciaActual.completada )
      {
        if ( lapsoEspera.esperaTerminada ( ) )
        {
          msgEstado.add(7);//SECUENCIA_LOGRADA
          oscP5.send(msgEstado, pantalla2);
          println ( "LAPSO ESPERA TERMINADA" );
          estado = MarimbaInclusivaEstados.INSTRUCCION_SECUENCIA_LOGRADA;
          proyeccionMarimba.irAModoResultado ( instruccionesLista.instruccionSecuenciaLograda );
          arduino.limpiarPuerto ( );
        }
      }
      
      else
      {
        int golperepeticion = arduino.leerPuerto ( );
        if ( golperepeticion != 0 )
        {
          println("ARDUINO TABLA : " + golperepeticion );
          proyeccionMarimba.golpearTabla (golperepeticion);
          
          if ( simularMarimbaConMouse )
          {
            detectorMouse.activarMouse ( );
          }
        }
        if ( proyeccionMarimba.tablaGolpeada )
        {
          //COMPARAR EL GOLPE DEL USUARIO CON LA SECUENCIA
          golpe = proyeccionMarimba.obtenerTablaGolpeada ( );
          boolean golpeCorrecto = secuenciaComparador.compararGolpe ( golpe  );
          
          if ( golpeCorrecto )
          {
            println ( "GOLPE CORRECTO" );
            if ( secuenciaComparador.acordeActual.completado )
            {
              println ( "ACORDE COMPLETADO" );
              secuenciaComparador.secuenciaActual.siguienteAcorde ( );
              secuenciaComparador.generarAcordeActual ( );
              if ( secuenciaComparador.secuenciaActual.completada )
              {
                lapsoEspera.iniciarEspera ( 500 );
              }
            }
          }
          else
          {
            println ( "GOLPE FALLADO" );
            msgEstado.add(6);//INTENTAR_NUEVAMENTE
            oscP5.send(msgEstado, pantalla2);
            secuenciaComparador.secuenciaFallada = true;
            estado = MarimbaInclusivaEstados.INSTRUCCION_INTENTAR_NUEVAMENTE_O_TERMINAR;
            arduino.limpiarPuerto ( );
            proyeccionMarimba.seleccionRealizada = false;
            proyeccionMarimba.irAModoResultado ( instruccionesLista.instruccionIntentarNuevamente );
            println ( "MODO INSTRUCCIÓN INTENTAR NUEVAMENTE" );
          }
        }
      }

    break;
    
  }
}

void keyPressed(){ //Tecla Q/q de reinicio
  if (key == 'q' || key == 'Q') {
    
    irAMensajePrincipal ( );
    //estado = MarimbaInclusivaEstados.INSTRUCCION_NOMBRE_PROYECTO;
    //proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionNombreProyecto );
  }
}

void irAImagenLogo ( )
{
    println ( "IMAGEN LOGO" );
    proyeccionMarimba.irAModoMostrarImagen ( imagenesLista.imgLogo );
    estado = MarimbaInclusivaEstados.IMAGEN_LOGO;
    lapsoEspera.iniciarEspera ( 2000 );
}

void irAMensajePrincipal ( )
{
    println ( "MENSAJE PRINCIPAL" );
    estado = MarimbaInclusivaEstados.MENSAJE_PRINCIPAL;
    //proyeccionMarimba.irAModoMostrarMensaje ( mensajesLista.mensajePrincipal , imagenesLista.imgLogoPeq );
    proyeccionMarimba.irAModoMostrarMensaje ( "www.marimbainclusiva.com" , imagenesLista.imgLogoPeq );
    lapsoEspera.iniciarEspera ( 2000 );
}

void irAMensajeSecuencia ( )
{
  OscMessage msgEstado = new OscMessage("/estado");
  msgEstado.add(1);//INICIO
  oscP5.send(msgEstado, pantalla2);
  println ( "MENSAJE DE SECUENCIA" );
  estado = MarimbaInclusivaEstados.MENSAJE_SECUENCIA;
  //proyeccionMarimba.irAModoMostrarMensaje ( mensajesLista.obtenerMensaje ( ) , imagenesLista.imgLogoPeq );
  proyeccionMarimba.irAModoMostrarMensaje ( "www.marimbainclusiva.com" , imagenesLista.imgLogoPeq );
  lapsoEspera.iniciarEspera ( 2500 );
}

void irASeleccionarModo ( )
{
  println ( "INSTRUCCIÓN DE SELECCIONAR MODO" );
  estado = MarimbaInclusivaEstados.INSTRUCCION_SELECCIONAR_MODO;
  arduino.limpiarPuerto ( );
  //lapsoEspera.iniciarEspera ( 4500 );
  proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionSeleccionarModo );
  
}

void irAInstruccionMemorizarSecuencia ( )
{
  println ( "INSTRUCCIÓN DE MEMORIZAR SECUENCIA" );
  estado = MarimbaInclusivaEstados.INSTRUCCION_MEMORIZA_SECUENCIA;
  proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionMemorizarSecuencia );
}

void irAModoPresentacionSecuencia ( )
{
  proyeccionMarimba.irAModoPresentacionSecuencia ( );
  estado = MarimbaInclusivaEstados.PRESENTACION_SECUENCIA;
  secuenciador.definirSecuencia ( secuenciasLista.obtenerSecuencia ( ) );
  println ( "MODO PRESENTACIÓN SECUENCIA" );
}

void mouseMoved()
{
  detectorMouse.activarMouse ( );
}