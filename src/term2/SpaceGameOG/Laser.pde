class Laser {
  // Member variables
  int x, y, w, h, speed;


  //constructor middle of the screen, x,y.
  Laser(int x, int y) {
    this.x = x;
    this.y =y;
    w = 5;
    h = 10;
    speed = 3;
  }

  //member Methods
  void display() {
    rectMode(CENTER);
    fill(#F02C2C);
    noStroke();
    rect(x, y, w, h);
  }

  void move() {
    y -=speed;
  }

  boolean reachedTop() {
    if (y<-20) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock r) {
    float d = dist(x,y,r.x,r.y);
    if(d<45){
    return true;
    }else{
    return false;
    }
  }
}
