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
Player jugador1 = new Player();

   void level(){
     
   caja = loadImage("Caja.jpg");
   diamante = loadImage("diamante.jpg"); //<>//
   texturamapa = loadImage("Textura mapa.jpg"); 
   piso = loadImage("Piso.jpg"); 
   
   
   }
   
   void nivel(int lvl){
     
     if (lvl == 1)
        table = loadTable("data/new3.csv");
     if (lvl == 2)
        table = loadTable("data/new2.csv");
     if (lvl == 3)
        table = loadTable("data/new4.csv");
        
     alto = table.getInt(0,0);
     ancho = table.getInt(0,1);
        
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
             texturamapa = loadImage("Textura mapa.jpg"); 
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
             piso = loadImage("Piso.jpg"); 
             piso.resize(height/ancho, height/alto);
            image(piso, j*(height/ancho), i*(height/alto));
                        
           }
           if (valor == 2){
             caja = loadImage("Caja.jpg");
            caja.resize(height/ancho, height/alto);
            image(caja, j*(height/ancho), i*(height/alto));
           }
           if (valor == 3){
             diamante = loadImage("diamante.jpg");
            diamante.resize(height/ancho-1, height/alto-1);
            image(diamante, j*(height/ancho), i*(height/alto));
           }
           if (valor == 4){
             
             jugador1.draw(alto,ancho);
             jugador1.seti(i);
             jugador1.setj(j);
                             
           }
                          
          popStyle();
          
       }
     }
     popMatrix();
   }
        
 void arriba() {
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
  
  
} 
   
}