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
     //vacio = loadImage("/data/Images/Vacio/1.png");
     pared = loadImage("/data/Images/Pared/1.png");
   }
   
   void level(int lvl){
      dataTable = loadTable("data/Niveles/lvldata.csv");
      alto = dataTable.getInt(lvl-1, 0);
      ancho = dataTable.getInt(lvl-1, 1);
      transAlto = (height-(((int)(height/alto))*alto))/2;
      transAncho = (height-(((int)(height/ancho))*ancho))/2;
      table = loadTable("data/Niveles/lvl"+ lvl +".csv");
      int elemento = table.getInt(4,1);
      println(elemento);
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
             case 2: // Cajas
               caja = loadImage("/data/Images/Caja/Brillante/"+ tCaja +".png");
               caja.resize(height/ancho, height/alto);
               image(caja, j*(height/ancho), i*(height/alto));
             break;
             case 3: // Diamantes
               diamante = loadImage("/data/Images/Diamante/"+ tDiamante +".png");
               diamante.resize(height/ancho-1, height/alto-1);
               image(diamante, j*(height/ancho), i*(height/alto));
             break;
           }
         popStyle();
       }
     }
     popMatrix();
   }

  
  int conocer_elemento(int i,int j){
    int elemento = table.getInt(i,j);
    return elemento;
  }
  
  void movCajaArriba(int direccionY, int direccionX){
    table.setInt(direccionX, direccionY, 0);
    table.setInt(direccionX-1, direccionY, 2);
  } 
  
  void movCajaAbajo(int direccionY, int direccionX){
    table.setInt(direccionX, direccionY, 0);
    table.setInt(direccionX+1, direccionY, 2);
  }
  
  void movCajaDerecha(int direccionY, int direccionX){
    table.setInt(direccionX, direccionY-1, 0);
    table.setInt(direccionX, direccionY, 2);
  }
  
  void movCajaIzquierda(int direccionY, int direccionX){
    table.setInt(direccionX, direccionY+1, 0);
    table.setInt(direccionX, direccionY, 2);
  }

}