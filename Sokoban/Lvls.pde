class lvls extends Ventana {

  private PImage lvls;
  
  lvls(){}
   
  @Override
  public void drawV(){
    for (int j = 0; j < 3; j = j+1) {
      for (int i = 0; i < 4; i = i+1) {
        lvls = loadImage("/data/Images/Niveles/nivel"+(i+1+(j*4))+".png");
        lvls.resize(120, 120);
        image(lvls, 60+(i*150) , 180+(j*160));
        pushStyle();
          Pixel = loadFont("PressStart2P-10.vlw");
          textFont(Pixel);  
          textAlign(CENTER, CENTER);
          text("-Nivel " +(i+1+(j*4))+"-", 120+(i*150), 320+(j*160));
        popStyle();     
      }
    }
      
    pushStyle();
      Pixel = loadFont("PressStart2P-30.vlw");
      textFont(Pixel);
      textAlign(CENTER, CENTER);
      text("Niveles", width/2, 90);
           
      Pixel = loadFont("PressStart2P-20.vlw");
      textFont(Pixel);  
      textAlign(CENTER, CENTER);
      text("Selecciona un nivel", width/2, 130);
     
      Pixel = loadFont("PressStart2P-10.vlw");
      textFont(Pixel);  
      textAlign(CENTER, CENTER);
      text("Atras", 50, 670);
      
      Pixel = loadFont("PressStart2P-10.vlw");
      textFont(Pixel);  
      textAlign(CENTER, CENTER);
      text("Siguiente", 630, 670);
    popStyle();
  }

  public void opening(){
    
  }
   
  public void botones(){
    if (X > 30 && X < 80 && 
        Y> 650 && Y < 700){
      ventana_actual = 'i';  
    }
     
    for (int j = 0; j < 3; j = j+1){
      for (int i = 0; i < 4; i = i+1){
        if (X > 60+(i*150) && X < 60+(i*150)+120 && 
            Y > 180+(j*160) && Y < 180+(j*160)+120){
          lvl = (i+1+(j*4));
          ventana_actual = 'j';     
        } 
      }
    }
    X = 0;
    Y = 0;         
  }

}