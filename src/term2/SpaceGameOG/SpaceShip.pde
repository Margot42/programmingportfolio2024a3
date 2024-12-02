class Spaceship {
  // Member variables
  int x, y, w, laserCount, turretCount, health;
  PImage ship;

  //constructor middle of the screen, x,y.
  Spaceship() {
    x = width/3;
    y = height/3;
    w = 100;
    laserCount = 100000000;
    turretCount= 1;
    health=100;
    ship = loadImage ("spaceShip!2.png");
  }

  //member Methods
  void display() {
    imageMode(CENTER);
    image(ship, x, y, w, ship.height *w / ship.width);
  }

  void move( int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }

  boolean fire() {
    if (laserCount< 1) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock r) {
    float d = dist(x,y,r.x,r.y);
    if(d<50){
    return true;
    }else{
    return false;
    }
  }
}
