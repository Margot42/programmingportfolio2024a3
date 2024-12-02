class Powerup {
  // Member variables
  int x, y, diam, speed ;
  PImage p1;

  //constructor middle of the screen, x,y.
  Powerup() {
    x = int (random(width));
    y = -100;
    diam = int(random(20, 100));
    speed = int (random (8, 10));
    p1= loadImage("PowerUPChris.gif");
  }



//member Methods
void display() {


  imageMode(CENTER);
  //Powerup.resize(diam, diam);
  image(p1, x, y);
}

void move() {
  y= y + speed;
}

boolean reachedBottom() {
  if (y>height+60) {
    return true;
  } else {
    return false;
  }
}
boolean intersect(Spaceship s) {
  float d = dist(x, y, s.x, s.y);
  return d<50; 
  //  return true;
  //} else {
  //  return false;
  //}
}
}
