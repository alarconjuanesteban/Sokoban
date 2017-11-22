class Movimiento extends Player{

  //  Todo lo relacionado con el movimiento del jugador:
  //    - Colisiones
  //    - Desplazamientos
  //    - Controles
  
  void keyPressed(){
    if ((key == CODED && keyCode == UP) || (key == 'w') || (key == 'W'))
      jugador = loadImage("/data/Images/Jugador 1/J1-up.png");
    if ((key == CODED && keyCode == DOWN) || (key == 's') || (key == 'S'))
      jugador = loadImage("/data/Images/Jugador 1/J1-down.png");
    if ((key == CODED && keyCode == RIGHT) || (key == 'd') || (key == 'D'))
      jugador = loadImage("/data/Images/Jugador 1/J1-right.png");
    if ((key == CODED && keyCode == LEFT) || (key == 'a') || (key == 'A'))
      jugador = loadImage("/data/Images/Jugador 1/J1-left.png");
  }

}