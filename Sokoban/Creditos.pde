class Creditos extends Ventana {

   Creditos(){
    }
   
   @Override
   void drawV(){
     
     fill(color(10,30,400));textSize(100); text("creditos", 75,75);
     fill(10,1,120);rect(87,610,60,40,7);
     fill(1000,1000,1000);textSize(9); text("Complete?", 95,632);
     
   }
    @Override
   public void opening(){

   }
    
   public void botones(){
     if (X > 77 && X < 77+60 && 
     Y> 610 && Y < 610+40) {
     ventana_actual = 'j';  
      }
     
     
     X = 0;
     Y = 0;
     
   }

}