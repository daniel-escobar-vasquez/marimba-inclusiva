// Marimba Didáctica
// Abril/Mayo 2016
// Daniel Escobar Vásquez  danielescobar.co

import processing.serial.*;
import ddf.minim.*;

int estado;
int siguienteEstado;

Configuracion configuracion;
Marimba marimba;
Utiles utiles;
ProyeccionMarimba proyeccionMarimba;
DetectorMouse detectorMouse;
InstruccionesLista instruccionesLista;
SecuenciasLista secuenciasLista;
Secuenciador secuenciador;
SecuenciaComparador secuenciaComparador;
Arduino arduino;
Sonidos sonidos;
LapsoEspera lapsoEspera;
boolean simularMarimbaConMouse = true;
boolean usarArduino = false;

void setup ( )
{
  size ( 1280 , 720 );
  noStroke();
  
  estado = MarimbaInclusivaEstados.INICIO;
}

void draw ( )
{
  background(0);
  correrEstados ( );
}

void correrEstados ( )
{
  int golpe;
  
  switch ( estado )
  {
    case MarimbaInclusivaEstados.INICIO:
      configuracion = new Configuracion ( "configuracion.xml" );
      marimba = new Marimba ( configuracion.numeroTablas , null , configuracion.anchoMarimba , configuracion.altoTablaGrande , configuracion.altoTablaPequena, configuracion.tablas);
      utiles = new Utiles ( );
      proyeccionMarimba = new ProyeccionMarimba ( marimba , configuracion );
      detectorMouse = new DetectorMouse ( configuracion.lapsoDesactivacionMouse );
      instruccionesLista = new InstruccionesLista ( );
      secuenciasLista = new SecuenciasLista ( );
      secuenciador = new Secuenciador ( );
      secuenciaComparador = new SecuenciaComparador ( );
      arduino = new Arduino ( this, "/dev/ttyACM0" , usarArduino );
      sonidos = new Sonidos ( this );
      lapsoEspera = new LapsoEspera ( );
      
      estado = MarimbaInclusivaEstados.INSTRUCCION_NOMBRE_PROYECTO;
      proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionNombreProyecto );
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
          estado = MarimbaInclusivaEstados.INSTRUCCION_SELECCIONAR_MODO;
          arduino.limpiarPuerto ( );
          proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionSeleccionarModo );
      }
    break;
    
    case MarimbaInclusivaEstados.CONFIGURACION_TABLA:
    break;

    case MarimbaInclusivaEstados.INSTRUCCION_NOMBRE_PROYECTO:
      proyeccionMarimba.actualizarProyeccion ( );
      if ( proyeccionMarimba.instruccionActual.verificarFinalEspera ( ) )
      {
          estado = MarimbaInclusivaEstados.INSTRUCCION_SELECCIONAR_MODO;
          arduino.limpiarPuerto ( );
          proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionSeleccionarModo );
      }
    break;
    
    case MarimbaInclusivaEstados.INSTRUCCION_SELECCIONAR_MODO:
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
                estado = MarimbaInclusivaEstados.INSTRUCCION_MODO_JUEGO;
                proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionModoJuego );
                secuenciasLista.indiceLista = 0;
                secuenciasLista.listaCompletada = false;
              break;
              case OpcionesSeleccion.EXTRA:
                println ( "MODO EXTRA SELECCIONADO" );
                estado = MarimbaInclusivaEstados.INSTRUCCION_MODO_JUEGO;
                proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionModoJuego );
                secuenciasLista.indiceLista = 19;
                secuenciasLista.listaCompletada = false;
              break;              
              
            }
        }
      }
      else
      {
      
        if ( proyeccionMarimba.instruccionActual.verificarFinalEspera ( ) )
        {
            estado = MarimbaInclusivaEstados.INSTRUCCION_NOMBRE_PROYECTO;
            proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionNombreProyecto );
        }
        else
        {
          golpe = arduino.leerPuerto ( );
          if ( golpe != 0 )
          {
            switch (golpe)
            {
              case 14:
                proyeccionMarimba.seleccionRealizada = true;
                proyeccionMarimba.valorSeleccionRealizada = OpcionesSeleccion.LIBRE;
              break;
              
              case 15:
                proyeccionMarimba.seleccionRealizada = true;
                proyeccionMarimba.valorSeleccionRealizada = OpcionesSeleccion.JUEGO;
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
                //println ( "MODO LIBRE SELECCIONADO" );
                /*estado = MarimbaInclusivaEstados.INSTRUCCION_TOCAR_LIBRE;
                proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionTocarLibre );*/
                lapsoEspera.iniciarEspera ( 500 );
              break;
              
              case OpcionesSeleccion.JUEGO:
                //println ( "MODO JUEGO SELECCIONADO" );
                /*estado = MarimbaInclusivaEstados.INSTRUCCION_MODO_JUEGO;
                proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionModoJuego );
                secuenciasLista.indiceLista = 0;
                secuenciasLista.listaCompletada = false;*/
                lapsoEspera.iniciarEspera ( 500 );
              break;
              case OpcionesSeleccion.EXTRA:
                //println ( "MODO JUEGO SELECCIONADO" );
                /*estado = MarimbaInclusivaEstados.INSTRUCCION_MODO_JUEGO;
                proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionModoJuego );
                secuenciasLista.indiceLista = 0;
                secuenciasLista.listaCompletada = false;*/
                lapsoEspera.iniciarEspera ( 500 );
              break;
              
            }
          }
        }
      }
     break;
    
    case MarimbaInclusivaEstados.MODO_LIBRE:
      proyeccionMarimba.actualizarProyeccion ( );
      
      golpe = arduino.leerPuerto ( );
      if ( golpe != 0 )
      {
        println("ARDUINO TABLA : " + golpe );
        proyeccionMarimba.golpearTabla ( golpe );
        
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
    
    
    /*
    case MarimbaInclusivaEstados.INSTRUCCION_REGRESAR_MENU:
      proyeccionMarimba.actualizarProyeccion ( );
      if ( proyeccionMarimba.instruccionActual.verificarFinalEspera ( ) )
      {
          //estado = MarimbaInclusivaEstados.INSTRUCCION_NOMBRE_PROYECTO;
          //proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionNombreProyecto );
      }
      else {
        if ( proyeccionMarimba.seleccionRealizada )
        {
          switch ( proyeccionMarimba.valorSeleccionRealizada )
          {
            case OpcionesSeleccion.MENU:
              println ( "MODO LIBRE SELECCIONADO" );
              estado = MarimbaInclusivaEstados.INSTRUCCION_TOCAR_LIBRE;
              proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionTocarLibre );
            break;
          }
        }
      }
     break;
    */
    
    
    case MarimbaInclusivaEstados.INSTRUCCION_MODO_JUEGO:
      proyeccionMarimba.actualizarProyeccion ( );
      if ( proyeccionMarimba.instruccionActual.verificarFinalEspera ( ) )
      {
          estado = MarimbaInclusivaEstados.INSTRUCCION_MEMORIZA_SECUENCIA;
          proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionMemorizarSecuencia );
      }
    break;
    
    case MarimbaInclusivaEstados.INSTRUCCION_MEMORIZA_SECUENCIA:
      proyeccionMarimba.actualizarProyeccion ( );
      if ( proyeccionMarimba.instruccionActual.verificarFinalEspera ( ) )
      {
          proyeccionMarimba.irAModoPresentacionSecuencia ( );
          estado = MarimbaInclusivaEstados.PRESENTACION_SECUENCIA;
          secuenciador.definirSecuencia ( secuenciasLista.obtenerSecuencia ( ) );
          println ( "MODO PRESENTACIÓN SECUENCIA" );
      }
    break;
    
    case MarimbaInclusivaEstados.INSTRUCCION_REPETIR_SECUENCIA:
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
    
    case MarimbaInclusivaEstados.INSTRUCCION_INTENTAR_NUEVAMENTE_O_TERMINAR:
      proyeccionMarimba.actualizarProyeccion ( );
      
      if ( lapsoEspera.esperando )
      {
        if ( lapsoEspera.esperaTerminada ( ) )
        {
        switch ( proyeccionMarimba.valorSeleccionRealizada )
            {
              case OpcionesSeleccion.INTENTAR:
                println ( "SELECCIÓN INTENTAR DE NUEVO" );
                estado = MarimbaInclusivaEstados.INSTRUCCION_MEMORIZA_SECUENCIA;
                proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionMemorizarSecuencia );
              break;
              
              case OpcionesSeleccion.SALIR:
                println ( "SELECCIÓN TERMINAR JUEGO" );
                estado = MarimbaInclusivaEstados.INSTRUCCION_NOMBRE_PROYECTO;
                proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionNombreProyecto );
              break;
            }
        }
      }
      else
      {
        if ( proyeccionMarimba.instruccionActual.verificarFinalEspera ( ) )
        {
           estado = MarimbaInclusivaEstados.INSTRUCCION_NOMBRE_PROYECTO;
            proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionNombreProyecto );
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
                /*println ( "SELECCIÓN INTENTAR DE NUEVO" );
                estado = MarimbaInclusivaEstados.INSTRUCCION_MEMORIZA_SECUENCIA;
                proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionMemorizarSecuencia );*/
                lapsoEspera.iniciarEspera ( 500 );
              break;
              
              case OpcionesSeleccion.SALIR:
                /*println ( "SELECCIÓN TERMINAR JUEGO" );
                estado = MarimbaInclusivaEstados.INSTRUCCION_NOMBRE_PROYECTO;
                proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionNombreProyecto );*/
                lapsoEspera.iniciarEspera ( 500 );
              break;
            }
          }
        }
      }
      
      
    break;

    case MarimbaInclusivaEstados.INSTRUCCION_SECUENCIA_LOGRADA:
      proyeccionMarimba.actualizarProyeccion ( );
      
      if ( proyeccionMarimba.instruccionActual.verificarFinalEspera ( ) )
      {
         estado = MarimbaInclusivaEstados.INSTRUCCION_NOMBRE_PROYECTO;
         proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionNombreProyecto );
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
              estado = MarimbaInclusivaEstados.INSTRUCCION_MEMORIZA_SECUENCIA;
              proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionMemorizarSecuencia );
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
        estado = MarimbaInclusivaEstados.INSTRUCCION_MEMORIZA_SECUENCIA;
        proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionMemorizarSecuencia );
      }
    break;
    
    case MarimbaInclusivaEstados.INSTRUCCION_COMENZAR_NUEVAMENTE:
    break;
    
    case MarimbaInclusivaEstados.INSTRUCCION_JUEGO_COMPLETADO:
      proyeccionMarimba.actualizarProyeccion ( );
      if ( proyeccionMarimba.instruccionActual.verificarFinalEspera ( ) )
      {
        estado = MarimbaInclusivaEstados.INSTRUCCION_NOMBRE_PROYECTO;
        proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionNombreProyecto );
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
          estado = MarimbaInclusivaEstados.INSTRUCCION_REPETIR_SECUENCIA;
          proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionRepetirSecuencia );
          println ( "MODO INSTRUCCIÓN REPETIR SECUENCIA" );
        }
        else
        {
          //manda señal arduino
          proyeccionMarimba.golpearAcorde ( acorde);
          sonidos.reproducirAcorde ( acorde );
          if(usarArduino){
            println("ESCRIBE SERIAL ARDUINO");
            arduino.escribirPuerto();
          }
        }
      }
    
    break;
    
    case MarimbaInclusivaEstados.LECTURA_SECUENCIA:
      
      proyeccionMarimba.actualizarProyeccion ( );
      
      if ( secuenciaComparador.secuenciaActual.completada )
      {
        if ( lapsoEspera.esperaTerminada ( ) )
        {
          println ( "LAPSO ESPERA TERMINADA" );
          estado = MarimbaInclusivaEstados.INSTRUCCION_SECUENCIA_LOGRADA;
          proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionSecuenciaLograda );
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
          //proyeccionMarimba.fallarTabla ( golperepeticion );
          
          
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
            secuenciaComparador.secuenciaFallada = true;
            estado = MarimbaInclusivaEstados.INSTRUCCION_INTENTAR_NUEVAMENTE_O_TERMINAR;
            arduino.limpiarPuerto ( );
            proyeccionMarimba.seleccionRealizada = false;
            proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionIntentarNuevamente );
            println ( "MODO INSTRUCCIÓN INTENTAR NUEVAMENTE" );
          }
        }
      }
      
      /*if ( !detectorMouse.obtenerActivacion ( ) && simularMarimbaConMouse )
      {          
          estado = MarimbaInclusivaEstados.INSTRUCCION_SELECCIONAR_MODO;
          arduino.limpiarPuerto ( );
          proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionSeleccionarModo );
      }*/
    break;
    
  }
}

void keyPressed(){
  if (key == 'q' || key == 'Q') {
        estado = MarimbaInclusivaEstados.INSTRUCCION_NOMBRE_PROYECTO;
        proyeccionMarimba.irAModoInstruccion ( instruccionesLista.instruccionNombreProyecto );
  }
}

void mouseMoved()
{
  detectorMouse.activarMouse ( );
}