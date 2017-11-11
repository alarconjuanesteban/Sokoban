class Level{

  //  Todo lo relacionado a los niveles:
  //    - Tamaño de la Matriz.
  
  // desplazamiento vertical, centrado. 
 
 int x,y;
 int alto;
 int ancho;
 int a;
 int valor;
 PImage caja;
 PImage diamante;
 PImage texturamapa;
 PImage piso;
 Table table;
 Table dataTable;

   void level(){
     caja = loadImage("/data/Images/Cajas/1.png");
     diamante = loadImage("/data/Images/diamante.png"); //<>//
     texturamapa = loadImage("/data/Images/Vacio/2.png"); 
     piso = loadImage("/data/Images/Piso.png");
     
   }
   
   void level(int lvl){
      dataTable = loadTable("data/lvldata.csv");
      switch (lvl){
        case 1:
          table = loadTable("data/lvl1.csv");
        break;
        case 2:
          table = loadTable("data/lvl2.csv");
        break;
        case 3:
          table = loadTable("data/lvl3.csv");
        break;
      }
     alto = dataTable.getInt(lvl-1, 0);
     ancho = dataTable.getInt(lvl-1, 1);
    }
   
   void vacio(){
     pushMatrix();
     translate((width-height)/2,0);
     for(int i=0 ; i<alto ; i++){
       for(int j=0 ; j<ancho; j++){
         int valor = table.getInt(i,j);
         if (valor == 0){
           pushStyle();
             texturamapa = loadImage("/data/Images/Vacio/2.png"); 
             texturamapa.resize(height/ancho, height/alto);
             image(texturamapa, 0*(height/ancho), 0*(height/alto));
             image(texturamapa, 1*(height/ancho), 0*(height/alto));
             image(texturamapa, j*(height/ancho), i*(height/alto));
           popStyle();
         }
       }
     }
     popMatrix();
   }
   
   void Print(){
     pushMatrix();
     translate((width-height)/2,0);
     for(int i=0 ; i<alto ; i++){
       for(int j=0 ; j<ancho; j++){
         pushStyle();
           int valor = table.getInt(i,j);
           switch(valor){
             case 1:
               piso = loadImage("/data/Images/Pared/1.png");
               piso.resize(height/ancho, height/alto);
               image(piso, j*(height/ancho), i*(height/alto));
             break;
             case 2:
               caja = loadImage("/data/Images/Cajas/1.png");
               caja.resize(height/ancho, height/alto);
               image(caja, j*(height/ancho), i*(height/alto));
             break;
             case 3:
               diamante = loadImage("/data/Images/Diamante/1.png");
               diamante.resize(height/ancho-1, height/alto-1);
               image(diamante, j*(height/ancho), i*(height/alto));
             break;
           }
         popStyle();
       }
     }
     popMatrix();
   }
}