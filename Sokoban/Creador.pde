class Creador extends Level {
  protected PFont Text;
  protected int numeroElemento=0;
  protected PImage elemento;
  protected String nombre = "Piso";
  protected Table cTable;

  /*  Creador() {
      datacTable = loadTable("data/NivelesC/lvlCdata.csv");
      alto = datacTable.getInt(0, 0);
      ancho = datacTable.getInt(0, 1);
      transAlto = (height-(((int)(height/alto))*alto))/2;
      transAncho = (height-(((int)(height/ancho))*ancho))/2;
      cTable = loadTable("data/NivelesC/lvlCprueba.csv");
  }*/
  public void drawCreador() {
    texto();
    figuras();
    botones();
    selTextura(numeroElemento);
  }
     public void levelCreador(){

    }
  public void selTextura(int elementoActual) {
    if (elementoActual==0) {
      elemento=loadImage("/data/Images/Piso/4.png");
      nombre="Piso";
    }
    if (elementoActual==1) {
      elemento=loadImage("/data/Images/Pared/2.png");
      nombre="Pared";
    }
    if (elementoActual==2) {
      elemento=loadImage("/data/Images/Caja/Brillante/1.png");
      nombre="Caja";
    }
    if (elementoActual==3) {
      elemento=loadImage("/data/Images/Diamante/7.png");
      nombre="Diamante";
    }
    if (elementoActual==4) {
      elemento=loadImage("/data/Images/Caja/Opaca/1.png");
      nombre="CajaD";
    }
    if (elementoActual==5) {
      elemento=loadImage("/data/Images/Jugador/"+ J +"/J"+ J +"-right.png");
      nombre="Jugador";
    }
    if (elementoActual==6) {
      numeroElemento=0;
    }
    if (elementoActual==-1) {
      numeroElemento=4;
    }
    pushStyle();
    elemento.resize(height/6, height/6);
    image(elemento, (width/48)*6, (height/16)*7);
    popStyle();
  }
  public void figuras() {
    pushStyle();
    fill(255);
    beginShape(TRIANGLES);
    vertex((width/6)+width/12, (((height/8)*4))+(height/32));
    vertex((width/6)+width/12, (((height/8)*4))-(height/32));
    vertex((width/3)-width/32, (height/8)*4);
    endShape();
    beginShape(TRIANGLES);
    vertex((width/6)-width/12, (((height/8)*4))+(height/32));
    vertex((width/6)-width/12, (((height/8)*4))-(height/32));
    vertex(width/32, (height/8)*4);
    endShape();
    popStyle();
  }
  public void texto() {
    pushStyle();
    fill (255);
    Text= loadFont("PressStart2P-30.vlw");
    textFont(Text);
    textAlign(CENTER, CENTER);
    text("Size", (width/6), (height/8)-(height/16));
    text("Objeto", (width/6), ((height/8)*3)-(height/16));
    text("Atras", (width/6), ((height/8)*7)-(height/16));
    text("Probar", (width/6), ((height/8)*8)-(height/16));

    Text = loadFont("PressStart2P-20.vlw");
    textFont(Text);  
    textAlign(CENTER, CENTER);
    text(nombre, (width/6), ((height/8)*6)-(height/16));

    Text = loadFont("PressStart2P-10.vlw");
    textFont(Text);  
    textAlign(CENTER, CENTER);
    text("+Columna", (width/12), (height/8)+(height/32));
    text("-Columna", (width/12), (height/8)+(height/32)*3);
    text("+Fila", (width/12)*3, (height/8)+(height/32));
    text("-Fila", (width/12)*3, (height/8)+(height/32)*3);
    popStyle();
  }
  public void botones() {
    if (X >(width/6)-(width/12)  && X < (width/6)+(width/12)  && 
      Y> (((height/8)*7)-(height/16)-height/32) && Y < (((height/8)*7)-(height/16)+height/32)) {
      ventana_actual = 'v';
    }
    if (X >(width/6)+width/12  && X < (width/6)+(width/12)*2  && 
      Y> ((height/8)*3)+(height/16) && Y < ((height/8)*3)+(height/16)*3 ) {
      numeroElemento+=1 ;
    }
    if (X >width/24  && X < (width/12)  && 
      Y> ((height/8)*3)+(height/16) && Y < ((height/8)*3)+(height/16)*3 ) {
      numeroElemento=numeroElemento-1 ;
    }

    X = 0;
    Y = 0;
  }
}