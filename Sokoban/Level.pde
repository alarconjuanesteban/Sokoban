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
//Player jugador1 = new Player();

   void level(){
     caja = loadImage("/data/Images/Caja.jpg");
     diamante = loadImage("/data/Images/diamante.jpg"); //<>//
     texturamapa = loadImage("/data/Images/Textura mapa.jpg"); 
     piso = loadImage("/data/Images/Piso.jpg");
     
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
   
   void grilla(){
   
     pushMatrix();
     translate((width-height)/2,0);
     for(int i=0 ; i<alto ; i++){
       for(int j=0 ; j<ancho; j++){
         
         int valor = table.getInt(i,j);
           if (valor == 0){
         pushStyle();
           /*  fill(0,0,0);
             rect(j*(height/ancho), i*(height/alto), height/ancho, height/alto);*/
             texturamapa = loadImage("/data/Images/Textura mapa.jpg"); 
            texturamapa.resize(height/ancho, height/alto);
            image(texturamapa, 0*(height/ancho), 0*(height/alto));
            image(texturamapa, 1*(height/ancho), 0*(height/alto));
            image(texturamapa, j*(height/ancho), i*(height/alto));
          popStyle();
          
           } }
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
           if (valor == 1){
            /* fill(225,255,255);
             rect(j*(height/ancho), i*(height/alto), height/ancho, height/alto);*/
             piso = loadImage("/data/Images/Piso.jpg"); 
             piso.resize(height/ancho, height/alto);
            image(piso, j*(height/ancho), i*(height/alto));
                        
           }
           if (valor == 2){
             caja = loadImage("/data/Images/Caja.jpg");
            caja.resize(height/ancho, height/alto);
            image(caja, j*(height/ancho), i*(height/alto));
           }
           if (valor == 3){
             diamante = loadImage("/data/Images/diamante.jpg");
            diamante.resize(height/ancho-1, height/alto-1);
            image(diamante, j*(height/ancho), i*(height/alto));
           }
           /*if (valor == 4){
             
             jugador1.draw(alto,ancho);
             jugador1.seti(i);
             jugador1.setj(j);
                             
           }*/
                          
          popStyle();
          
       }
     }
     popMatrix();
   }
        
 /*void arriba() {
 int i=0;
  int j=0;
      i=jugador1.geti();
      println(i);
      jugador1.seti(i);
      j=jugador1.getj();
      jugador1.setj(j);
      int pr = table.getInt(i+1,j);
      table.setInt(i+1,j, 4);
      table.setInt(18,10, 4);
       println(i,j, pr); 
  
} */
   
}