class Opciones extends Ventana {
  
   private PImage matrix;
    
   Opciones(){}
   
  @Override
  void drawV(){
    matrix = loadImage("/data/Images/Sokoban/matrix.jpg");
    matrix.resize(width, height);
    image(matrix, 0 , 0);
    pushStyle();
      Pixel = loadFont("PressStart2P-30.vlw");
      textFont(Pixel);
      textAlign(CENTER, CENTER);
      text("Opciones", width/2, 100);
           
      Pixel = loadFont("PressStart2P-20.vlw");
      textFont(Pixel);  
      textAlign(CENTER, CENTER);
      text("Muy pronto", width/2, height/2+10);
     
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
        Y > 650 && Y < 700){
      ventana_actual = 'i';  
    }
    X = 0;
    Y = 0;
  }

}