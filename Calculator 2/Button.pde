class Button {
  // Member Variables 7 peices of info=memory reservation
  int x, y, w, h;
  color c1, c2;
  char val;
  //String val;
  boolean on, isNum;


  // Constructor //(int x,int y, char, int w, int h, char) this. w and y
  Button(int x, int y, char val, boolean isNum) {
    this.x= x;
    this.y= y;
    w = 20;
    h= 30;
    c1= color(61, 99, 85);
    c2= color(143, 191, 175);
    this.val= val;
    on=false;
    this.isNum= isNum;
  }

  // Member Methods
  void display() {
    if (on==true) {
      fill(c2);
    } else {
      fill(c1);
    }
    
    rectMode(CENTER);
    rect(x, y, w, h, 28);
    //triangle (x,y-10, x+10,x-10, y+10)
    fill(250);
    textAlign(CENTER, CENTER);
    text(val, x, y);
  }

  boolean hover (int mx, int my) {
    if (mx > x-w/2 && mx < x+w/2 && my > y-h/2 && my < y+h/2) {
      on=true;
      return on;
    }else{
      on=false;
      return on;
    }
  }
}
