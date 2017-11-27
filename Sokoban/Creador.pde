class Creador extends Level {
  protected PFont Text;
  protected int numeroElemento=0;
  protected PImage elemento;
  String nombre = "Piso";

  Creador() {
  }
  public void drawCreador() {
    texto();
    figuras();
    botones();
    selTextura(numeroElemento);
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

class Vcreador extends Ventana {
  //  protected PImage planeta;
  Vcreador() {
  }

  @Override
    void drawV() {

    // planeta = loadImage("/data/Images/Sokoban/planeta.jpg");
    //planeta.resize(width, height);
    // image(planeta, 0, 0);

    pushStyle();
    fill (255);
    Pixel = loadFont("PressStart2P-30.vlw");
    textFont(Pixel);
    textAlign(CENTER, CENTER);
    text("Creador", width/2, 100);

    Pixel = loadFont("PressStart2P-20.vlw");
    textFont(Pixel);  
    textAlign(CENTER, CENTER);
    text("Crear nivel", width/2, height/2 );
    text("Jugar nivel creado", width/2, height/2 + 100);


    Pixel = loadFont("PressStart2P-10.vlw");
    textFont(Pixel);  
    textAlign(CENTER, CENTER);
    text("Atras", 50, 670);
    popStyle();
  }
  @Override
    public void opening() {
  }

  public void botones() {

    if (X > 30 && X < 80 && 
      Y> 650 && Y < 700) {
      ventana_actual = 'i';
    }

    if (X > width/2 - 200  && X <  width/2 + 200   && 
      Y> height/2 - 50 && Y < height/2 +50) {
      ventana_actual = 't';
    }

    if (X > width/2 - 220  && X <  width/2 + 220   && 
      Y> height/2 - 100 && Y < height/2 - 140) {
      //ventana_actual = ''; enviar a ventana niveles creados
    }

    X = 0;
    Y = 0;
  }
}