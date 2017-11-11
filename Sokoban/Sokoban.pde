Level prueba = new Level();
Player jugador = new Player();
int lvl = 2;

void setup(){
  size(700,700);
  //fullScreen();
}

void draw(){  
  
  background(0,0,0);
  
  prueba.level(lvl);
  prueba.vacio();
  prueba.Print();
  jugador.draw(lvl);
  fill(0,0,0);
  
}

  void keyPressed() {
      //jugador.keyPressed();
  }