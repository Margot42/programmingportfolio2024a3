//Margot Zollinger |Etch A Sketch| Sep 18 2024
int x, y;
PImage e1;

void  setup() {
  size(800, 658);
  background(200);
  x=width/2;
  y=height/2;
  e1=loadImage ("Etch.png");
}

void draw() {
  image(e1, 0, 0);
  strokeWeight(4);
  point(x, y);

  if (keyPressed==true) {
    if (key=='w' || key== 'W') {
      y-=2;
    } else if (key=='s'||key== 'S') {
      y+=2;
    } else if (key=='d'||key== 'D') {
      x+=2;
    } else if (key=='a'||key== 'A') {
      x-=2;
    }
  }
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode== UP) {
      y = y-3;
    } else if (keyCode ==DOWN) {
      y=y+3;
    } else if (keyCode ==LEFT) {
      x=x-3;
    } else if (keyCode ==RIGHT) {
      x=x+3;
    }
  }
}

void mousePressed() {
  saveFrame("line-######.png");
}
