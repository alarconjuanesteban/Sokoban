class Extra extends Ventana {

  Extra(){}
   
  @Override
  void drawV(){
    pushStyle();
      Pixel = loadFont("PressStart2P-30.vlw");
      textFont(Pixel);
      textAlign(CENTER, CENTER);
      text("Juegos Extra", width/2, 100);
           
      Pixel = loadFont("PressStart2P-20.vlw");
      textFont(Pixel);  
      textAlign(CENTER, CENTER);
      text("Supervivencia", width/2, height/2 - 70);
      text("Contrarreloj", width/2, height/2);
      text("Co-op 2 players", width/2, height/2 + 70);
      
      Pixel = loadFont("PressStart2P-10.vlw");
      textFont(Pixel);  
      textAlign(CENTER, CENTER);
      text("Atras", 50, 670);
    popStyle();  
  }

  public void opening(){
    
  }
   
  public void botones(){
     
    if (X > 30 && X < 80 && 
        Y > 650 && Y < 700) {
      ventana_actual = 'i';  
    }

    if (X > width/2 - 100  && X <  width/2 + 100 && 
        Y > height/2 - 70 && Y < height/2 - 40){
      //ventana_actual = ''; Supervivencia  
    }
      
     if (X > width/2 - 100  && X <  width/2 + 100 && 
         Y > height/2  && Y < height/2 + 30){
       //ventana_actual = ''; Contrarreloj
     }
         
     if (X > width/2 - 100  && X <  width/2 + 100 && 
         Y > height/2 + 70 && Y < height/2 + 110) {
       //ventana_actual = ''; Co-op 2 players
     }

     X = 0;
     Y = 0;         
  }

}