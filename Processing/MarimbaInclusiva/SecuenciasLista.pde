// Marimba Didáctica
// Abril/Mayo 2016
// Daniel Escobar Vásquez  danielescobar.co

class SecuenciasLista
{
  
  //int RE4 = 1; int MI4 = 2; int FA4 = 3; int SOL4 = 4; int LA4 = 5; int SI4 = 6; int DO5 = 7; int RE5 = 8;
  //int MI5 = 9; int FA5 = 10; int SOL5 = 11; int LA5 = 12; int SI5 = 13; int DO6 = 14; int RE6 = 15; int MI6 = 16;
  //int SILENCIO = 0;
  
  int DO4= 1; int RE4 = 2; int MI4 = 3; int FA4 = 4; int SOL4 = 5; int LA4 = 6; int SI4 = 7; int DO5 = 8; int RE5 = 9;
  int MI5 = 10; int FA5 = 11; int SOL5 = 12; int LA5 = 13; int SI5 = 14; int DO6 = 15; int RE6 = 16;// int MI6 = 16;
  int SILENCIO = 0;  
  
  ArrayList<Secuencia> lista = new ArrayList<Secuencia>();
  int indiceLista = 0;
  boolean listaCompletada = false;
  
 /* Secuencia undostres = new Secuencia ( SecuenciaCompas.CORCHEA , 60 );
  Secuencia undostresdoble = new Secuencia ( SecuenciaCompas.CORCHEA , 60 );
  Secuencia cumple = new Secuencia ( SecuenciaCompas.CORCHEA , 60 );
*/  
  Secuencia bordon1 = new Secuencia ( SecuenciaCompas.CORCHEA , 90 );
  Secuencia bordon2 = new Secuencia ( SecuenciaCompas.CORCHEA , 90 );
  Secuencia bordon3 = new Secuencia ( SecuenciaCompas.CORCHEA , 120 );
  Secuencia bordon4 = new Secuencia ( SecuenciaCompas.CORCHEA , 120 );

  /*Nuevos*/
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
  Secuencia piragua  =  new Secuencia(SecuenciaCompas.CORCHEA,90);
  //Secuencia piragua  =  new Secuencia(SecuenciaCompas.SEMICORCHEA,90);
  
  SecuenciasLista ( )
  {
    crearSecuencias ( );
/*    lista.add ( undostres );
    lista.add ( undostresdoble );
    lista.add ( bordon1 );
    lista.add ( bordon2 );
    lista.add ( bordon3 );
    lista.add ( bordon4 );
*/    //
    //lista.add ( cumple );
    lista.add(bordon01);
    lista.add(bordon02);
    lista.add(bordon03);
    lista.add(bordon04);
    lista.add(bordon05);
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
    lista.add(bordon1);
    lista.add(bordon2);
    lista.add(bordon3);
    lista.add(bordon4);
    lista.add(piragua);
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
*/    
    int [][] acordesBordon1 = {{FA5}, {}, {DO5}, {FA5}, {DO5}, {},{MI5}, {DO5}, {}, {SOL5}, {DO5},{},{FA5}};
    bordon1.melodia = acordesBordon1;
    
    int [][] acordesBordon2 = {{FA5}, { }, {DO5}, {FA5}, {FA5}, { },{MI5}, { }, {DO5}, {SOL5}, {SOL5}, { },{FA5}, { }, {DO5}, {FA5}, {FA5}, { },{MI5}, { }, {DO5}, {SOL5}, {SOL5}};
    bordon2.melodia = acordesBordon2;
     
    int [][] acordesBordon3 =  {{FA5}, { }, {FA5}, { }, {FA5}, { },{MI5}, {SOL5}, { }, {SOL5}, {SOL5}, { },{FA5}, { }, {FA5}, { }, {FA5}, { },{MI5}, {SOL5}, { }, {SOL5}, {SOL5}};
    bordon3.melodia = acordesBordon3;
    
    int [][] acordesBordon4 =  {{FA5}, {FA5, LA5}, { }, {LA5}, {DO5, FA5}, { },{MI5}, {MI5, SOL5}, { }, {SOL5}, {DO5, SOL5}, { },{FA5}, {FA5, LA5}, { }, {LA5}, {DO5, FA5}, { },{MI5}, {MI5, SOL5}, { }, {SOL5}, {DO5, SOL5}};
    bordon4.melodia = acordesBordon4;

    int [][] acordesBordon01 = {{SOL4}, {}, {SOL4}, {SOL4}, {SOL4}};
    bordon01.melodia = acordesBordon01;

    int [][] acordesBordon02 = {{SOL4}, {}, {SOL4}, {SOL4}, {SOL4}, {}, {LA4}, {},{LA4}, {LA4}, {LA4}};
    bordon02.melodia = acordesBordon02;

    int [][] acordesBordon03 = {{SOL4}, {}, {SOL4}, {RE4}, {RE4}, {}, {LA4}, {},{LA4}, {LA4}, {LA4}};
    bordon03.melodia = acordesBordon03;
    
    int [][] acordesBordon04 = {{SOL4}, {}, {SOL4}, {RE4}, {RE4}, {}, {LA4}, {},{LA4}, {FA4}, {FA4}};
    bordon04.melodia = acordesBordon04;
    
    int [][] acordesBordon05 = {{SOL4}, {}, {SOL4}, {SOL4}, {RE4}, {}, {LA4}, {},{LA4}, {LA4}, {FA4}};
    bordon05.melodia = acordesBordon05;
    
    int [][] acordesBordon06 = {{SOL4}, {}, {RE4}, {RE4}, {SOL4}, {}, {LA4}, {},{FA4}, {FA4}, {LA4}};
    bordon06.melodia = acordesBordon06;
    
    int [][] acordesBordon07 = {{SOL4}, {}, {RE4}, {RE4}, {SOL4}, {}, {FA4}, {},{FA4}, {LA4}, {LA4}};
    bordon07.melodia = acordesBordon07;
    
    int [][] acordesBordon08 = {{RE4}, {}, {SOL4}, {SI4}, {SI4}, {}, {FA4}, {},{FA4}, {LA4}, {LA4}};
    bordon08.melodia = acordesBordon08;
    
    int [][] acordesBordon09 = {{RE4}, {}, {SOL4}, {SI4}, {SI4}, {}, {DO5}, {},{LA4}, {FA4}, {FA4}};
    bordon09.melodia = acordesBordon09;
    
    int [][] acordesBordon10 = {{SI4}, {}, {SOL4}, {RE4}, {RE4}, {}, {FA4}, {},{LA4}, {DO5}, {DO5}};
    bordon10.melodia = acordesBordon10;
    
    int [][] acordesBordon11 = {{SI4}, {}, {SOL4}, {RE4}, {RE4}, {}, {DO5}, {},{LA4}, {FA4}, {FA4}};
    bordon11.melodia = acordesBordon11;
    
    int [][] acordesBordon12 = {{SOL4}, {}, {SOL4}, {SOL4}, {RE4}, {}, {LA4}, {},{LA4}, {LA4}, {RE4}};
    bordon12.melodia = acordesBordon12;    

    int [][] acordesBordon13 = {{SOL4}, {}, {RE4}, {SOL4}, {SI4}, {}, {FA4}, {},{RE4}, {FA4}, {LA4}};
    bordon13.melodia = acordesBordon13;    

    int [][] acordesBordon14 = {{SOL4}, {}, {RE4}, {SOL4}, {RE4}, {}, {FA4}, {},{RE4}, {LA4}, {RE4}};
    bordon14.melodia = acordesBordon14;    
    
   int [][] acordesBordon15 = {{SOL4}, {}, {RE4}, {SOL4}, {RE4}, {}, {FA4}, {},{RE4}, {LA4}, {RE4}, {SOL4}, {},{SI4}, {SOL4}, {RE4}, {LA4},{},{RE4}, {FA4}, {RE4}};
    bordon15.melodia = acordesBordon15;
    
   int [][] test = {{DO4}, {RE4}, {MI4}, {FA4}, {SOL4}, {LA4}, {SI4}, {DO5},{RE5}, {MI5}, {FA5}, {SOL5}, {LA5},{SI5}, {DO6}, {RE6}};
    
   int [][] acordesPiragua = {{LA4}, {}, {}, {}, {}, {SOL4}, {}, {}, {}, {}, {LA4}, {}, {}, {}, {LA4}, {}, {}, {},{}, {LA4}, {}, {}, {}, {}, {SOL4}, {}, {}, {}, {}, {LA4}, {}, {}, {}, {LA4}, {}, {}, {},{}, {LA4}, {}, {}, {}, {}, {SOL4}, {}, {}, {}, {}, {LA4}, {}, {}, {}, {LA4}, {}, {}, {},{}, {LA4}, {}, {}, {}, {}, {SOL4}, {}, {}, {}, {}, {LA4}, {}, {}, {}, {LA4}, {}, {}, {},{},{LA4}};
    piragua.melodia = test;    
  }
}