// Marimba Inclusiva
// Octubre 2016, Cartagena, Colombia
// https://marimbainclusiva.wordpress.com/
// https://github.com/marimba-inclusiva/marimba-inclusiva

//Clase SecuenciasLista, Definición de secuencias a reproducir
class SecuenciasLista
{
  
  int DO4= 1; int RE4 = 2; int MI4 = 3; int FA4 = 4; int SOL4 = 5; int LA4 = 6; int SI4 = 7; int DO5 = 8; int RE5 = 9;
  int MI5 = 10; int FA5 = 11; int SOL5 = 12; int LA5 = 13; int SI5 = 14; int DO6 = 15; int RE6 = 16;// int MI6 = 16;
  int SILENCIO = 0;  
  
  ArrayList<Secuencia> lista = new ArrayList<Secuencia>();
  int indiceLista = 0;
  boolean listaCompletada = false;
  
  /*Nuevos*/
  Secuencia secuenciaIntro01 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia secuenciaIntro02 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia secuencia01 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia secuencia02 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia secuencia03 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia secuencia04 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia secuencia05 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia secuencia06 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia secuencia07 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia secuencia08 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia secuencia09 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia secuencia10 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia secuencia11 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia secuencia12 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia secuencia13 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia secuencia14 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia secuencia15 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  
  Secuencia bordon00 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia bordon01 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia bordon02 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia bordon03 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia bordon04 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia bordon05 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia bordon06 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia bordon07 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia bordon08 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia bordon09 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia bordon10 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia bordon11 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia bordon12 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia bordon13 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia bordon14 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  Secuencia bordon15 =  new Secuencia(SecuenciaCompas.CORCHEA,90);
    
  Secuencia bordon16 = new Secuencia ( SecuenciaCompas.CORCHEA , 90 );
  Secuencia bordon17 = new Secuencia ( SecuenciaCompas.CORCHEA , 90 );
  Secuencia bordon18 = new Secuencia ( SecuenciaCompas.CORCHEA , 120 );
  Secuencia bordon19 = new Secuencia ( SecuenciaCompas.CORCHEA , 120 );
  Secuencia piragua  =  new Secuencia(SecuenciaCompas.SEMICORCHEA,90);
  
 /* Secuencia undostres = new Secuencia ( SecuenciaCompas.CORCHEA , 60 );
  Secuencia undostresdoble = new Secuencia ( SecuenciaCompas.CORCHEA , 60 );
  Secuencia cumple = new Secuencia ( SecuenciaCompas.CORCHEA , 60 );
*/  
  
  SecuenciasLista ( )
  {
    crearSecuencias ( );
    lista.add(secuenciaIntro01);
    lista.add(secuenciaIntro02);
    lista.add(secuencia01);
    lista.add(secuencia02);
    lista.add(secuencia03);
    lista.add(secuencia04);
    lista.add(secuencia05);
    lista.add(secuencia06);
    lista.add(secuencia07);
    lista.add(secuencia08);
    lista.add(secuencia09);
    lista.add(secuencia10);
    lista.add(secuencia11);
    lista.add(secuencia12);
    lista.add(secuencia13);
    lista.add(secuencia14);
    lista.add(secuencia15);
    
    //lista.add(bordon00);
    //lista.add(bordon01);
    //lista.add(bordon02);
    //lista.add(bordon03);
    //lista.add(bordon04);
    //lista.add(bordon05);
    lista.add(bordon06);
    lista.add(bordon07);
    lista.add(bordon08);
    lista.add(bordon09);
    lista.add(bordon10);
    lista.add(bordon11);
    lista.add(bordon12);
    lista.add(bordon13);
    lista.add(bordon14);
    lista.add(bordon15);
    lista.add(bordon16);
    lista.add(bordon17);
    lista.add(bordon18);
    lista.add(bordon19);
    lista.add(piragua);
/*    lista.add ( undostres );
    lista.add ( undostresdoble );
    lista.add ( cumple );
*/    
  }
  
  SecuenciasLista(ArrayList<Secuencia> lista){
    this.lista =lista;
  }
  
  //Obtener la secuencia actual
  Secuencia obtenerSecuencia ( )
  {
    Secuencia tmpLista = lista.get ( indiceLista );
    return tmpLista;
  }
  
  void siguienteSecuencia ( )
  {
    indiceLista ++;
    if ( indiceLista >= lista.size ( ) - 1  )
    {
      listaCompletada = true;
    }
  }
  
  void crearSecuencias ( )
  {
    //int [][] intro01 = {{DO5}, {}, {DO5}, {}, {DO5}};
    int [][] intro01 = {{DO4}, {}, {RE4}, {}, {MI4}, {}, {FA4}, {}, {SOL4}, {}, {LA4}, {}, {SI4}, {}, {DO5}, {}, {RE5}, {}, {MI5}, {}, {FA5}, {}, {SOL5}, {}, {LA5}, {}, {SI5}, {}, {DO6}, {}, {RE6}};
    secuenciaIntro01.melodia = intro01;
    
    int [][] intro02 = {{DO5}, {}, {SI4}, {}, {LA4}, {}, {SOL4}};
    secuenciaIntro02.melodia = intro02;
    
    int [][] acordesSecuencia01 = {{DO5}, {}, {SOL4}, {}, {SOL4}, {}, {SI4}};
    secuencia01.melodia = acordesSecuencia01;

    int [][] acordesSecuencia02 = {{DO5}, {}, {SI4}, {}, {LA4}, {}, {SOL4}};
    secuencia02.melodia = acordesSecuencia02;

    int [][] acordesSecuencia03 = {{MI5}, {}, {FA5}, {}, {DO5}, {}, {SOL4}};
    secuencia03.melodia = acordesSecuencia03;
    
    int [][] acordesSecuencia04 = {{RE4}, {}, {FA4}, {}, {FA4}, {}, {SOL4}};
    secuencia04.melodia = acordesSecuencia04;
    
    int [][] acordesSecuencia05 = {{DO5}, {}, {DO4}, {}, {FA4}, {}, {FA4}};
    secuencia05.melodia = acordesSecuencia05;

    int [][] acordesSecuencia06 = {{SOL4}, {}, {RE5, SI4}, {}, {SOL4}, {}, {RE5, SI4}};
    secuencia06.melodia = acordesSecuencia06;

    int [][] acordesSecuencia07 = {{RE5}, {}, {RE5}, {}, {RE5}, {}, {DO5, LA4}};
    secuencia07.melodia = acordesSecuencia07;

    int [][] acordesSecuencia08 = {{DO4, LA4}, {}, {DO4, SOL4}, {}, {DO4, FA4}, {}, {DO4}};
    secuencia08.melodia = acordesSecuencia08;
    
    int [][] acordesSecuencia09 = {{DO4, DO5}, {}, {SOL4, SOL5}, {}, {DO4, DO5}, {}, {DO4, DO5}};
    secuencia09.melodia = acordesSecuencia09;

    int [][] acordesSecuencia10 = {{SI4}, {}, {SOL4}, {}, {SOL4}, {}, {SI4}, {}, {SI4}, {}, {SI4}};
    secuencia10.melodia = acordesSecuencia10;

    int [][] acordesSecuencia11 = {{SOL4}, {}, {SI4}, {}, {SI4}, {}, {SOL4}, {}, {DO5}, {}, {DO5}};
    secuencia11.melodia = acordesSecuencia11;
    
    int [][] acordesSecuencia12 = {{SOL4}, {}, {SI4}, {}, {RE5}, {}, {SOL5}, {}, {SOL5}, {}, {SOL5}, {}, {SOL4}, {}, {SI4}, {}, {RE5}, {}, {LA4}, {}, {LA4}, {}, {LA4}};
    secuencia12.melodia = acordesSecuencia12;

    int [][] acordesSecuencia13 = {{DO5, MI5}, {}, {DO5, MI5}, {}, {DO5, MI5}, {}, {MI5}, {}, {RE5}, {}, {DO5}, {}, {DO5, MI5}, {}, {}, {DO5, MI5}, {}, {DO5, MI5}, {}, {LA5}, {}, {SOL5}, {}, {FA5}};
    secuencia13.melodia = acordesSecuencia13;
    
    int [][] acordesSecuencia14 = {{DO5, DO6}, {}, {DO5, RE6}, {}, {DO5, RE6}, {}, {RE5, SI5}, {}, {RE5, LA5}, {}, {SOL5}};
    secuencia14.melodia = acordesSecuencia14;

    int [][] acordesSecuencia15 = {{RE5}, {}, {RE6}, {}, {LA4}, {}, {DO5}, {}, {DO6}, {}, {SOL4}, {}, {MI5}, {SOL4, SOL5}, {}, {DO5, MI5}};
    secuencia15.melodia = acordesSecuencia15;
    
    int [][] acordesBordon00 = {{DO4}, {}, {RE4}, {}, {MI4}};
    bordon00.melodia = acordesBordon00;

    int [][] acordesBordon01 = {{FA4}, {}, {FA4}, {FA4}, {FA4}};
    bordon01.melodia = acordesBordon01;

    int [][] acordesBordon02 = {{FA4}, {}, {FA4}, {FA4}, {FA4}, {}, {SOL4}, {},{SOL4}, {SOL4}, {SOL4}};
    bordon02.melodia = acordesBordon02;

    int [][] acordesBordon03 = {{FA4}, {}, {FA4}, {DO4}, {DO4}, {}, {SOL4}, {},{SOL4}, {SOL4}, {SOL4}};
    bordon03.melodia = acordesBordon03;
    
    int [][] acordesBordon04 = {{FA4}, {}, {FA4}, {DO4}, {DO4}, {}, {SOL4}, {},{SOL4}, {MI4}, {MI4}};
    bordon04.melodia = acordesBordon04;
    
    int [][] acordesBordon05 = {{FA4}, {}, {FA4}, {FA4}, {DO4}, {}, {SOL4}, {},{SOL4}, {SOL4}, {MI4}};
    bordon05.melodia = acordesBordon05;
    
    int [][] acordesBordon06 = {{FA4}, {}, {DO4}, {DO4}, {FA4}, {}, {SOL4}, {},{MI4}, {MI4}, {SOL4}};
    bordon06.melodia = acordesBordon06;
    
    int [][] acordesBordon07 = {{FA4}, {}, {DO4}, {DO4}, {FA4}, {}, {MI4}, {},{MI4}, {SOL4}, {SOL4}};
    bordon07.melodia = acordesBordon07;
    
    int [][] acordesBordon08 = {{DO4}, {}, {FA4}, {LA4}, {LA4}, {}, {MI4}, {},{MI4}, {SOL4}, {SOL4}};
    bordon08.melodia = acordesBordon08;
    
    int [][] acordesBordon09 = {{DO4}, {}, {FA4}, {LA4}, {LA4}, {}, {SI4}, {},{SOL4}, {MI4}, {MI4}};
    bordon09.melodia = acordesBordon09;
    
    int [][] acordesBordon10 = {{LA4}, {}, {FA4}, {DO4}, {DO4}, {}, {MI4}, {},{SOL4}, {SI4}, {SI4}};
    bordon10.melodia = acordesBordon10;
    
    int [][] acordesBordon11 = {{LA4}, {}, {FA4}, {DO4}, {DO4}, {}, {SI4}, {},{SOL4}, {MI4}, {MI4}};
    bordon11.melodia = acordesBordon11;
    
    int [][] acordesBordon12 = {{FA4}, {}, {FA4}, {FA4}, {DO4}, {}, {SOL4}, {},{SOL4}, {SOL4}, {DO4}};
    bordon12.melodia = acordesBordon12;    

    int [][] acordesBordon13 = {{FA4}, {}, {DO4}, {FA4}, {LA4}, {}, {MI4}, {},{DO4}, {MI4}, {SOL4}};
    bordon13.melodia = acordesBordon13;    

    int [][] acordesBordon14 = {{FA4}, {}, {DO4}, {FA4}, {DO4}, {}, {MI4}, {},{DO4}, {SOL4}, {DO4}};
    bordon14.melodia = acordesBordon14;    
    
   int [][] acordesBordon15 = {{FA4}, {}, {DO4}, {FA4}, {DO4}, {}, {MI4}, {},{DO4}, {SOL4}, {DO4}, {FA4}, {},{LA4}, {FA4}, {DO4}, {SOL4},{},{DO4}, {MI4}, {DO4}};
    bordon15.melodia = acordesBordon15;
    
    int [][] acordesBordon16 = {{FA5}, {}, {DO5}, {FA5}, {DO5}, {},{MI5}, {DO5}, {}, {SOL5}, {DO5},{},{FA5}};
    bordon16.melodia = acordesBordon16;
    
    int [][] acordesBordon17 = {{FA5}, { }, {DO5}, {FA5}, {FA5}, { },{MI5}, { }, {DO5}, {SOL5}, {SOL5}, { },{FA5}, { }, {DO5}, {FA5}, {FA5}, { },{MI5}, { }, {DO5}, {SOL5}, {SOL5}};
    bordon17.melodia = acordesBordon17;
     
    int [][] acordesBordon18 =  {{FA5}, { }, {FA5}, { }, {FA5}, { },{MI5}, {SOL5}, { }, {SOL5}, {SOL5}, { },{FA5}, { }, {FA5}, { }, {FA5}, { },{MI5}, {SOL5}, { }, {SOL5}, {SOL5}};
    bordon18.melodia = acordesBordon18;
    
    int [][] acordesBordon19 =  {{FA5}, {FA5, LA5}, { }, {LA5}, {DO5, FA5}, { },{MI5}, {MI5, SOL5}, { }, {SOL5}, {DO5, SOL5}, { },{FA5}, {FA5, LA5}, { }, {LA5}, {DO5, FA5}, { },{MI5}, {MI5, SOL5}, { }, {SOL5}, {DO5, SOL5}};
    bordon19.melodia = acordesBordon19;
    
   int [][] acordesPiragua = {{LA4}, {}, {}, {}, {}, {SOL4}, {}, {}, {}, {}, {LA4}, {}, {}, {}, {LA4}, {}, {}, {},{}, {LA4}, {}, {}, {}, {}, {SOL4}, {}, {}, {}, {}, {LA4}, {}, {}, {}, {LA4}, {}, {}, {},{}, {LA4}, {}, {}, {}, {}, {SOL4}, {}, {}, {}, {}, {LA4}, {}, {}, {}, {LA4}, {}, {}, {},{}, {LA4}, {}, {}, {}, {}, {SOL4}, {}, {}, {}, {}, {LA4}, {}, {}, {}, {LA4}, {}, {}, {},{},{LA4}};
    piragua.melodia = acordesPiragua;
    
/*    
    int[][] acordeundostres = {{RE4},{MI4},{FA4},{SOL4}};
    undostres.melodia = acordeundostres;
    
    int[][] acordeundostresdoble = {{RE4},{MI4},{FA4},{SOL4},{LA4,SI4}};
    undostresdoble.melodia = acordeundostresdoble;
    
    
    int[][] acordesCumple = {{SOL4},{SOL4},{LA4},{SOL4},{DO5},{SI4},{},
                            {SOL4},{SOL4},{LA4},{SOL4},{RE5},{DO5},{},
                            {SOL4},{SOL4},{SOL4},{MI5},{DO5},{SI4},{LA4},{},
                            {FA5},{FA5},{MI5},{DO5},{RE5},{DO5}};
    cumple.melodia = acordesCumple;
    int [][] test = {{DO4}, {RE4}, {MI4}, {FA4}, {SOL4}, {LA4}, {SI4}, {DO5},{RE5}, {MI5}, {FA5}, {SOL5}, {LA5},{SI5}, {DO6}, {RE6}};
*/    
  }
}
