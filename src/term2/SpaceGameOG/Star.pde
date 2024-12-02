class Star {
  // Member variables
  int x, y, diam, speed ;


  //constructor middle of the screen, x,y.
  Star() {
    x =  int(random (width));
    y =-10;
    diam=int(random (1, 6));
    speed = int(random (1, 7));
  }

  //member Methods
  void display() {
    fill(random (60,255));
    ellipse(x, y, diam, diam);
  }

  void move() {
    y+=speed;
  }
  boolean reachedBottom () {
    if (y>height+5) {
      return true;
    } else {
      return false;
    }
  }
}
