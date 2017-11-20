Level prueba = new Level();
Player jugador = new Player();
//Movimiento mov = new Movimiento();
Table dataTable;
int lvl = 1;
int piso = 4;
int pared = 2;
int caja = 1;
int diamante = 7;
int J = 1;
int mov = 2;
int numero_elemento;

void setup(){
  size(700,700);
  prueba.level(lvl);
  jugador.xyJugador();  
}

void draw(){

  
  background(72,47,23);

  prueba.escenario(pared, piso);
  prueba.elementos(caja, diamante);
  jugador.draw(lvl);
  fill(0,0,0);
  
  
  
}

void el (){
  int xjugador = 0; 
  int yjugador = 0;
  xjugador = jugador.getxJugador(); 
  yjugador = jugador.getyJugador(); 
  yjugador  = yjugador-1;
  numero_elemento = prueba.conocer_elemento(xjugador,yjugador);
  
  println(xjugador,yjugador,numero_elemento );
  }
  
  void keyPressed() {
    if ((key == CODED && keyCode == UP) || (key == 'w') || (key == 'W'))
      el();
      mov = 1;
    if ((key == CODED && keyCode == DOWN) || (key == 's') || (key == 'S'))
      mov = 2;
    if ((key == CODED && keyCode == RIGHT) || (key == 'd') || (key == 'D'))
      mov = 3;
    if ((key == CODED && keyCode == LEFT) || (key == 'a') || (key == 'A'))
      mov = 4;
  }