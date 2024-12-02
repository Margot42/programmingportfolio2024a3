class Rock {
  // Member variables
  int x, y, diam, speed ;
  PImage r1, r2;
 boolean isFake; // Determines if the rock is fake
  //constructor middle of the screen, x,y.
  Rock() {
    x = int (random(width));
    y = -100;
   diam = int(random(20, 100)); 
    speed = int (random (7, 12));
    r1= loadImage("rocko1.png");
  //r2=loadImage("fakerock.png");
  
  }

  //member Methods
  void display() {
    imageMode(CENTER);
    r1.resize(diam, diam);
    image(r1, x, y);
    
    // r2.resize(diam, diam);
    //image(r2, x, y);
    
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
}

//boolean isFake; // Determines if the rock is fake
//Rock() {
//  x = int(random(width));
//  y = -100;
//  diam = int(random(20, 100));
//  speed = int(random(6, 8));
//  r1 = loadImage("rocko1.png");
//  r2 = loadImage("fakerock.png");
//  isFake = random(1) > 0.5; // 50% chance to be fake
//}
//void display() {
//  imageMode(CENTER);
//  if (isFake) {
//    r2.resize(diam, diam);
//    image(r2, x, y); // Display the fake rock
//  } else {
//    r1.resize(diam, diam);
//    image(r1, x, y); // Display the real rock
//  }
//}
