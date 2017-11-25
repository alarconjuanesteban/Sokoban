class Inicio extends Ventana {

   Inicio(){
    }
   
   @Override
   void drawV(){
     
     fill(color(10,30,400));textSize(100); text("Sokoban", 75,75);
    
   }
    @Override
   public void opening(){
   
     
   background(255,255,255);
   fill(color(10,30,400));textSize(100); text("power by processing", 100,100);
  
   ventana_actual = 'i';
   
   }
   
   public void botones(){
  
        if (X > 77 && X < 77+60 && 
      Y> 610 && Y < 610+40) {
     ventana_actual = 'c';  
      }
     
  
     
         
     fill(10,1,120);rect(87,610,60,40,7);
     fill(1000,1000,1000);textSize(9); text("Complete?", 95,632);
     
     
     X = 0;
     Y = 0;
     
   }

}

class lvls extends Ventana {

   lvls(){
    }
   
   @Override
   void drawV(){
     
     fill(color(10,30,400));textSize(100); text("lvls", 75,75);
    
     
   }

   public void opening(){
     
     
     
   }
   public void botones(){
          
     if (X > 77 && X < 77+60 && 
      Y> 610 && Y < 610+40) {
     ventana_actual = 'j';  
      }
     
     fill(10,1,120);rect(87,610,60,40,7);
     fill(1000,1000,1000);textSize(9); text("Complete?", 95,632);
     fill(1000,1000,1000);textSize(9); text("algo", 95,100);   
     
     X = 0;
     Y = 0;
         
   }

}