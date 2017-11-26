class Inicio extends Ventana {

   private PImage letrero;
   private int e;
   
   Inicio(){}
   
   @Override
   void drawV(){
     letrero = loadImage("/data/Images/Sokoban/sokoban.png");
     letrero.resize(500, 420);
     image(letrero, 100 , height/8);
     pushStyle();
       Pixel = loadFont("PressStart2P-20.vlw");
       textFont(Pixel);
       textAlign(CENTER, CENTER);
       text("Nuevo Juego", width/2, height/2);
       text("Creador", width/2, (height/2)+50);
       text("Opciones", width/2, (height/2)+100);
       text("Creditos", width/2, (height/2)+150);

       Pixel = loadFont("PressStart2P-7.vlw");
       textFont(Pixel);  
       textAlign(CENTER, CENTER);
       text("Powered by Processing, Universidad Nacional de Colombia, 2017", width/2, height-50);
     popStyle();

     if (e==5){
       cursor(WAIT);
       pushStyle();
         Pixel = loadFont("PressStart2P-20.vlw");
         fill(#B8C652);
         textFont(Pixel);
         textAlign(CENTER, CENTER);
         text("Juegos Extra", width/2, (height/2)+190);
       popStyle();
     }
   }
   
   @Override
   public void opening(){     
     background(255,255,255);
     fill(color(10,30,400));textSize(100); text("Powered by processing", 100,100);  
     ventana_actual = 'i';   
   }
   
   public void botones(){

     if (X > (width/2)-150 && X < (width/2)+150 && 
         Y > height/2-10 && Y < height/2+30) {
       ventana_actual = 'l';  
     }
     
     if (X > (width/2)-100 && X < (width/2)+100 && 
         Y > height/2+50 && Y < height/2+70) {
       ventana_actual = 'v';  
     }
     
     if (X > (width/2)-100 && X < (width/2)+100 && 
         Y > height/2+100 && Y < height/2+130) {
       ventana_actual = 'o';  
     }
     
     if (X > (width/2)-100 && X < (width/2)+100 && 
         Y > height/2+150 && Y < height/2+170) {
       ventana_actual = 'c';  
     }
      
     if (X > 100 && X < 500 && 
         Y > height/8 && Y < 270){
       e++;
       if(e==0)
         cursor(ARROW);
       if(e==1)
         cursor(CROSS);
       if(e==2)
         cursor(HAND);
       if(e==3)
         cursor(MOVE);
       if(e==4)
         cursor(TEXT);     
     }
     if(e==5){ 
       if (X > (width/2)-100 && X < (width/2)+100 && 
           Y > height/2+190 && Y < height/2+220){
         ventana_actual = 'e';  
       }
     }
     if(e==6)
       cursor(ARROW);

     X = 0;
     Y = 0;     
   }

}