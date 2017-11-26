Level prueba = new Level();
Player jugador = new Player();
Ventana inicio = new Inicio();
Ventana creditos = new Creditos();
Ventana lvls = new lvls();

Table dataTable;
int lvl = 2;
int piso = 4;
int pared = 2;
int caja = 1;
int diamante = 7;
int J = 1;
int mov = 2;
int numero_elemento;
char ventana_actual = 'i';
int X, Y;

void setup(){
  size(700,700);
  prueba.level(lvl);
  jugador.xyJugador(); 
}

void draw(){
  switch(ventana_actual){
    case 'o':
      inicio.opening();
    break;
    case 'i':
      inicio.drawVentana();
    break;
    case 'c':
      creditos.drawVentana();
    break;
    case 'l':
      lvls.drawVentana();
    break;
    case 'j':
      background(72,47,23);
      prueba.escenario(pared, piso);
      prueba.elementos(caja, diamante);
      jugador.draw(lvl);
    break;
  }
}

void colision(int direccionX, int direccionY){
  int xJugador;
  int yJugador;
  xJugador = jugador.getxJugador();  
  yJugador = jugador.getyJugador();
  
  xJugador  += direccionX;
  yJugador  += direccionY;
  
  numero_elemento = prueba.conocer_elemento(yJugador,xJugador);
}

void moverCaja(int direccionX, int direccionY, int caso){
  int xJugador;
  int yJugador;
  xJugador = jugador.getxJugador();  
  yJugador = jugador.getyJugador();
  
  xJugador  += direccionX;
  yJugador  += direccionY;
  
  switch(caso){
    case 1:
      prueba.movCajaArriba(xJugador, yJugador);
    break;
    case 2:
      prueba.movCajaAbajo(xJugador, yJugador);
    break;
    case 3:
      prueba.movCajaDerecha(xJugador, yJugador);
    break;
    case 4:
      prueba.movCajaIzquierda(xJugador, yJugador);
    break;
  }
}
  public void mousePressed() {
    X = mouseX;
    Y = mouseY;
 /* if (X > 100 && X < 77+100 && 
      Y> 610 && Y < 610+200) {
     ventana_actual = 'j';  
      }*/

  }


  void keyPressed() {
    if ((key == CODED && keyCode == UP) || (key == 'w') || (key == 'W'))
      mov = 1;
    if ((key == CODED && keyCode == DOWN) || (key == 's') || (key == 'S'))
      mov = 2;
    if ((key == CODED && keyCode == RIGHT) || (key == 'd') || (key == 'D'))
      mov = 3;
    if ((key == CODED && keyCode == LEFT) || (key == 'a') || (key == 'A'))
      mov = 4;
  }
  

   public int getxMouse(){
    return X;
  }
   public int getyMouse(){
    return Y;
  }