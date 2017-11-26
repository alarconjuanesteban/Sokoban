abstract class Ventana  {

   Ventana(){
      
   }

   public void drawVentana(){
     background(255,255,255);
     drawV();
     botones();
   }
  protected abstract void drawV();
  protected abstract void opening();
  protected abstract void botones();   
   
}