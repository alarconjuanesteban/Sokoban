abstract class Ventana  {
  
  protected PFont Pixel;
    
  Ventana(){}

  public void drawVentana(){
    background(0,0,0);
    drawV();
    botones();
  }
  
  protected abstract void drawV();
  protected abstract void opening();
  protected abstract void botones();
   
}