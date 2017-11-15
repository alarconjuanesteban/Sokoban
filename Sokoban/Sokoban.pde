Level prueba = new Level();
Player jugador = new Player();
//Movimiento mov = new Movimiento();
Table dataTable;
int lvl = 2;

void setup(){
  size(700,700);
  //fullScreen();
}

void draw(){  
  
  background(0,0,0);
  
  prueba.level(lvl);
  prueba.escenario();
  prueba.elementos();
  jugador.draw(lvl);
  fill(0,0,0);
  
}

  void keyPressed() {
      //mov.keyPressed();
  }