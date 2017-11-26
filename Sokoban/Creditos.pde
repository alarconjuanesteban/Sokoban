class Creditos extends Ventana {

   Creditos(){
    }
   
   @Override
   void drawV(){
   
    pushStyle();
    Pixel = loadFont("PressStart2P-30.vlw");
    textFont(Pixel);
    textAlign(CENTER, CENTER);
    text("Creditos", width/2, 100);
         
    Pixel = loadFont("PressStart2P-20.vlw");
    textFont(Pixel);  
    textAlign(CENTER, CENTER);
    text("Creadores", width/2, 140);
   
    Pixel = loadFont("PressStart2P-10.vlw");
    textFont(Pixel);  
    textAlign(CENTER, CENTER);
    text("Juan Esteban Alarcón Bravo", width/2, 200);
    text("Johan Elias Quiroga Quintero", width/2, 220);
    text("Andrés Felipe Rodriguez Florez", width/2, 240);
    text("Especial gracias a:", width/2, 300);
    text("Jean Pierre Charalambos Hernandez ", width/2, 320);
    text("Monitor Nombre???", width/2, 340);
    
    
    text("Texturas y Sprites", width/2, 420);
    text("Link, The Leyend Of Zelda, Nintendo®", width/2, 450);
    text("Universidad Nacional de Colombia", width/2, 600);
    text("2017", width/2, 570);
    
    text("Atras", 50, 670);
    popStyle();
    
     
   
   }
    @Override
   public void opening(){

   }
    
   public void botones(){
    if (X > 30 && X < 80 && 
      Y> 650 && Y < 700) {
     ventana_actual = 'i';  
      }
     
     
     X = 0;
     Y = 0;
     
   }

}