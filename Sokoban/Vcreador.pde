class Vcreador extends Ventana {
  
   protected PImage planeta;
   
   Vcreador(){}
   
   @Override
   void drawV(){
     planeta = loadImage("/data/Images/Sokoban/planeta.jpg");
     planeta.resize(width, height);
     image(planeta, 0 , 0);
      
     pushStyle();
       fill (0,0,0);
       Pixel = loadFont("PressStart2P-30.vlw");
       textFont(Pixel);
       textAlign(CENTER, CENTER);
       text("Creador", width/2, 100);
            
       Pixel = loadFont("PressStart2P-20.vlw");
       textFont(Pixel);  
       textAlign(CENTER, CENTER);
       text("Crear nivel", width/2, height/2 - 50);
       text("Jugar nivel creado", width/2, height/2 + 100);
      
       Pixel = loadFont("PressStart2P-10.vlw");
       textFont(Pixel);  
       textAlign(CENTER, CENTER);
       text("Atras", 50, 670);
     popStyle();    
   }
   
   @Override
   public void opening(){

   }
    
   public void botones(){
    
     if (X > 30 && X < 80 && 
         Y > 650 && Y < 700) {
       ventana_actual = 'i';  
     }
      
     if (X > width/2 - 200  && X <  width/2 + 200   && 
         Y > height/2 - 40 && Y < height/2 - 80) {
       //ventana_actual = ''; enviar a ventana creador de nivel  
     }
     
     if (X > width/2 - 220  && X <  width/2 + 220   && 
         Y > height/2 - 100 && Y < height/2 - 140) {
       //ventana_actual = ''; enviar a ventana niveles creados
     }
      
     X = 0;
     Y = 0;     
   }

}