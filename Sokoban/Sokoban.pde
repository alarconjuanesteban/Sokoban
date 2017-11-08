//  Archivo Principal, aquí inicia la ejecución del programa.
Level prueba = new Level();
Player jugador = new Player();
int lvl = 2;

void setup(){
  size(700,700);
  //fullScreen();
}

void draw(){  
  
  background(1000,1000,1000);
  
  prueba.level(lvl);
  prueba.grilla();
  prueba.Print();
  jugador.draw(lvl);
  fill(0,0,0);
  
}

  void keyPressed() {
    //Movimiento.keyPressed()
  }