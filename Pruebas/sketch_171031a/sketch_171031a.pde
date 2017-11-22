// desplazamiento vertical, centrado. 
 
 int alto = 21;
 int ancho = 21;
 int a = 10;
  
Table table;

   void setup(){
     fullScreen();
     
     table = loadTable("data/new2.csv");
     
     /*for (int i=0 ; i<ancho; i++){
       table.addColumn();
     }
     
     for (int i=0 ; i<alto; i++){
       table.addRow();
     }
     
     for(int i=0 ; i<alto ; i++){
       for(int j=0 ; j<ancho; j++){
         table.setInt(i,j,i+j);
       }
     }*/
   }
   
   
   void draw(){
     
     translate((width-height)/2,0);
     for(int i=0 ; i<alto ; i++){
       for(int j=0 ; j<ancho; j++){
         pushStyle();
           int valor = table.getInt(i,j);
           if (valor == 1)
             fill(0,0,50);
           else
             fill(255,255,255);
           rect(j*(height/ancho), i*(height/alto), height/ancho, height/alto);
         popStyle();
       }
     }
   }