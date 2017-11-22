class Level{

  //  Todo lo relacionado a los niveles:
  //    - Tamaño de la Matriz.
  
  // desplazamiento vertical, centrado. 
 
 int x,y;
 int alto;
 int ancho;
 int transAlto;
 int transAncho;
 int valor;
 boolean tipoCaja;
 PImage caja;
 PImage diamante;
 PImage vacio;
 PImage pared;
 PImage piso;
 Table table;

   void level(){
     caja = loadImage("/data/Images/Caja/Brillante/1.png");
     diamante = loadImage("/data/Images/Diamante/1.png"); //<>//
     piso = loadImage("/data/Images/Piso/1.png");
     pared = loadImage("/data/Images/Pared/1.png");
   }
   
   void level(int lvl){
      dataTable = loadTable("data/Niveles/lvldata.csv");
      alto = dataTable.getInt(lvl-1, 0);
      ancho = dataTable.getInt(lvl-1, 1);
      transAlto = (height-(((int)(height/alto))*alto))/2;
      transAncho = (height-(((int)(height/ancho))*ancho))/2;
      tipoCaja = true;
      table = loadTable("data/Niveles/lvl"+ lvl +".csv");
    }
   
   void escenario(int tPared, int tPiso){
     pushMatrix();
     translate(transAncho,transAlto);
       for(int i=0 ; i<alto ; i++){
         for(int j=0 ; j<ancho; j++){
           int valor = table.getInt(i,j);
           if (valor == 1){
             pushStyle();
               pared = loadImage("/data/Images/Pared/"+ tPared +".png");
               pared.resize(height/ancho, height/alto);
               image(pared, j*(height/ancho), i*(height/alto));
             popStyle();
           }
           if (valor != 1 && valor != 9){
             pushStyle();
               piso = loadImage("/data/Images/Piso/"+ tPiso +".png");
               piso.resize(height/ancho, height/alto);
               image(piso, j*(height/ancho), i*(height/alto));
             popStyle();
           }
         }
       }
     popMatrix();
   }
   
   void elementos(int tCaja, int tDiamante){
     pushMatrix();
     translate(transAncho,transAlto);
     for(int i=0 ; i<alto ; i++){
       for(int j=0 ; j<ancho; j++){
         pushStyle();
           int valor = table.getInt(i,j);
           switch(valor){
             case 2: // Caja Brillante
               caja = loadImage("/data/Images/Caja/Brillante/"+ tCaja +".png");
               caja.resize(height/ancho, height/alto);
               image(caja, j*(height/ancho), i*(height/alto));
             break;
             case 3: // Diamantes
               diamante = loadImage("/data/Images/Diamante/"+ tDiamante +".png");
               diamante.resize(height/ancho-1, height/alto-1);
               image(diamante, j*(height/ancho), i*(height/alto));
             break;
             case 4: // Caja Opaca
               caja = loadImage("/data/Images/Caja/Opaca/"+ tCaja +".png");
               caja.resize(height/ancho, height/alto);
               image(caja, j*(height/ancho), i*(height/alto));
             break;
           }
         popStyle();
       }
     }
     popMatrix();
   }
   
   int contador(){
     int temp = 0;
     for(int i=0 ; i<alto ; i++){
       for(int j=0 ; j<ancho; j++){
         int valor = table.getInt(i,j);
         if (valor == 2)
           temp += 1;
       }
     }
     return temp;
   }
  
   void completo(){
     if (contador() == 0)
       background(255,255,255);
   }
  
  int conocer_elemento(int i,int j){
    int elemento = table.getInt(i,j);
    return elemento;
  }
  
  void movCajaArriba(int direccionX, int direccionY){
    colision(0,-2);
    if (numero_elemento == 3)
      table.setInt(direccionY-1, direccionX, 4);
    else
      table.setInt(direccionY-1, direccionX, 2);
    colision(0,-1);
    if (numero_elemento == 4)
      table.setInt(direccionY, direccionX, 3);
    else
      table.setInt(direccionY, direccionX, 0);
  } 
  
  void movCajaAbajo(int direccionX, int direccionY){
    colision(0,2);
    if (numero_elemento == 3)
      table.setInt(direccionY+1, direccionX, 4);
    else
      table.setInt(direccionY+1, direccionX, 2);
    colision(0,1);
    if (numero_elemento == 4)
      table.setInt(direccionY, direccionX, 3);
    else
      table.setInt(direccionY, direccionX, 0);
  }
  
  void movCajaDerecha(int direccionX, int direccionY){
    colision(2,0);
    if (numero_elemento == 3)
      table.setInt(direccionY, direccionX+1, 4);
    else
      table.setInt(direccionY, direccionX+1, 2);
    colision(1,0);
    if (numero_elemento == 4)
      table.setInt(direccionY, direccionX, 3);
    else
      table.setInt(direccionY, direccionX, 0);
  }
  
  void movCajaIzquierda(int direccionX, int direccionY){
    colision(-2,0);
    if (numero_elemento == 3)
      table.setInt(direccionY, direccionX-1, 4);
    else
      table.setInt(direccionY, direccionX-1, 2);
    colision(-1,0);
    if (numero_elemento == 4)
      table.setInt(direccionY, direccionX, 3);
    else
      table.setInt(direccionY, direccionX, 0);
  }

}