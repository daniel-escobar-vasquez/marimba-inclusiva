// Marimba Inclusiva
// 2017

//Clase ImagenesLista
class MensajesLista
{
    String mensajePrincipal;    
    ArrayList<String> lista = new ArrayList<String>();
    int indiceLista = 0;
  
  MensajesLista ( )
  {
    mensajePrincipal = "Vive la experiencia de;transformar el silencio en sonidos.; ;Mediglobal te ayuda a escuchar";
 
    lista.add ("La experiencia de escuchar");
    lista.add ("Los placeres de la vida,;convertidos en sonidos");
    lista.add ("Disfrutando sonidos mágicos;en momentos únicos");
    lista.add ("Escucha cada palabra:;vive cada momento");
    lista.add ("El placer de escuchar");
    lista.add ("El arte de oír");
    lista.add ("La magia de escuchar");
    lista.add ("Los sonidos son vida");
    lista.add ("Transformando sonidos;en recuerdos");
    lista.add ("Oír es recordar,;recordar es vivir");
    lista.add ("Vive la emoción;de cada sonido");
    lista.add ("Escucha y comparte");
    lista.add ("Vive el mundo de los sonidos");
    lista.add ("Experimenta;a través de los sonidos");
    lista.add ("Recuerda experiencias;gracias a los sonidos");
    lista.add ("Los sonidos te acercan");
    lista.add ("Los sonidos te guían");
    lista.add ("Escucha, confía");
    lista.add ("La sorpresa de escuchar");
    lista.add ("Con sonidos,;la vida es más bella");
    lista.add ("Sonidos que sorprenden ");
    lista.add ("Las voces que nunca olvidarás");
    lista.add ("La alegría de comunicarnos");
    lista.add ("Momentos especiales,;palabras únicas");
    lista.add ("Cada palabra importa");
    lista.add ("El mundo quiere oír tu voz");
    lista.add ("La vida te habla");
    lista.add ("Sonidos que te alegran");
    lista.add ("La felicidad de oírte");
    lista.add ("Escucha la vida;en cada momento");
    lista.add ("Alegra tus instantes;con sonidos");
  }
  
  String obtenerMensaje ( )
  {
    if ( indiceLista == lista.size ( ) )
    {
      indiceLista = 0;
    }
    String mensaje = lista.get ( indiceLista );
    indiceLista ++;
    return mensaje;
  }
}