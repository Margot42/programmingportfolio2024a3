// Margot Zollinger |calculator project| 2 Oct 2024 //<>//
Button[] buttons= new Button [23];
String dVal= "0";

//Equation variables!
float l, r, result;
char op;
boolean left;


//button vaules
void setup () {
  size(160, 270);

  l= 0.0;
  r= 0.0;
  result= 0.0;
  op = ' ';
  left= true;

  buttons[0]= new Button (20, 60, 'C', false);
  buttons[1]= new Button (110, 60, '%', false);
  buttons[2]= new Button (50, 60, '±', false);
  buttons[3]= new Button (140, 60, '#', false);
  buttons[4]= new Button (80, 60, '&', false);


  buttons[5]= new Button (20, 250, '0', true);

  buttons[6]= new Button (20, 104, '1', true);
  buttons[7]= new Button (50, 104, '2', true);
  buttons[8]= new Button (80, 104, '3', true);
  buttons[9]= new Button (110, 104, 'x', false);
  buttons[10]= new Button (140, 104, '√', false);


  buttons[11]= new Button (20, 150, '4', true);
  buttons[12]= new Button (50, 150, '5', true);
  buttons[13]= new Button (80, 150, '6', true);
  buttons[14]= new Button (110, 150, '÷', false);
  buttons[15]=new Button(140, 150, '∆', false);


  buttons[16]= new Button (20, 200, '7', true);
  buttons[17]= new Button (50, 200, '8', true);
  buttons[18]= new Button (80, 200, '9', true);
  buttons[19]= new Button (110, 200, '-', false);


  buttons[20]= new Button (50, 250, '.', false);
  buttons[21]= new Button (80, 250, '+', false);
  buttons[22]= new Button (110, 250, '=', false);
}



void draw () {
  //background(255, 0, 106);
  background (73, 54, 99);
  for (int i=0; i< buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }

  updateDisplay ();
}

void updateDisplay () {
  fill(255);
  rectMode(CENTER);
  rect(width/2, 25, 140, 30);
  fill(0);

  //the display text size
  if (dVal.length () <12) {
    textSize(17);
  } else if
    (dVal.length() == 12) {
    textSize(15);
  } else if
    (dVal.length() > 12) {
    textSize(12);
  }



  //textSize(17);
  textAlign(RIGHT);
  text(dVal, width-40, 35);
}

//if char do dVal= str(buttons [i].val);
void mouseReleased() {
  //println("Left:"+ l + "Right:" + r + "Result:" + result + "Op:" + op + "L:" + left);

  for (int i=0; i<buttons.length; i++) {
    // settings number left of  the opperator
    if (buttons[i].on && buttons[i].isNum && left== true && dVal.length ()<20) {
      dVal += buttons[i].val;
      l = float (dVal);

      //}else if (buttons[i].on && buttons[i].val =='.')
      //  if (!dVal.contains '.') {
      //    dval +=buttons[i].val;

      //  //settings number left of the operator
    } else if (buttons[i].on && buttons[i].isNum && !left && dVal.length ()<20) {
      dVal += buttons[i].val;
      r = float (dVal);
    } else if (buttons[i].on && buttons[i].val == 'C') {
      dVal = "0.0";
      l= 0.0;
      r= 0.0;
      result= 0.0;
      op= ' ';
      left = true;
    } else if (buttons[i].on && buttons [i].val == '+') {
      handleEvent ("+", false);
     // op = '+';
      ///left =false;
      ///dVal = "0";
    } else if (buttons[i].on && buttons [i].val == '-') {
     //handleEvent ("-", false);
      op = '-';
      left =false;
      dVal = "0";
    } else if (buttons[i].on && buttons [i].val == '÷') {
      op = '÷';
      left =false;
      dVal = "0";
    } else if (buttons[i].on && buttons [i].val == 'x') {
      op = 'x';
      left =false;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val == '=') {
      performCalc();

      ///////The othger calculations that aren't numbers!
      /// Plus or minus
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val == '±') {
      if (left ==true) {
        l *= -1;
        dVal= str(l);
      } else if (left ==false ) {
        r *= -1;
        dVal= str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val == '%') {
      if (left ==true) {
        l= l* 0.01;
        dVal= str(l);
      } else if (left ==false ) {
        r *= r* 0.01;
        dVal= str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val == '∆') {
      if (left) {
        // If '∆' is pressed while on the left side, keep l as it is
        dVal = str(l);
      } else {
        // Calculate the delta (change) and store it in dVal
        float delta = r - l;  // Calculate the change
        dVal = str(delta);     // Convert delta to string for display
        // Optionally, reset r to delta if you want to keep using it
        r = delta;
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val == '.') {
      if (left) {
        dVal = str(l);
      } else {
        float delta = r - l;  
        dVal = str(delta);     
        r = delta;
      }
    }else if (buttons[i].on && !buttons[i].isNum && buttons[i].val == '&') {
      if (left ==true) {
        l *= random(255);
        dVal= str(l);
      } else if (left ==false ) {
        r *= random(255);
        dVal= str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val == '#') {
      if (left ==true) {
        l *= random(255);
        dVal= str(l);
      } else if (left ==false ) {
        r *= random(255-200);
        dVal= str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val == '√') {
      if (left) {
        l = sqrt(l);
        dVal= str(l);
      } else {
        r = sqrt(r);
        dVal= str(r);
      }
    }
  }
}




void performCalc () {
  if (op == '+') {
    result = l+ r;
    dVal = str (result);
  } else if (op == '÷') {
    result = l/r ;
    dVal = str(result);
  } else if (op == '-') {
    result = l-r ;
    dVal = str(result);
  } else if (op == 'x') {
    result = l*r ;
    dVal = str(result);
  }
}


void keyPressed () {
  println ("key:" + key);
  println ("keyCode:" +keyCode);
  if (key == 0 || keyCode ==96 || keyCode == 48) {
    handleEvent ("0", true);
  } else if (key ==1 || keyCode == 49 || keyCode ==97) {
    handleEvent ("1", true);
  } else if (key ==2 || keyCode == 50 || keyCode ==98) {
    handleEvent ("2", true);
  } else if (key ==3 || keyCode == 51 || keyCode ==99) {
    handleEvent ("3", true);
  } else if (key ==4 || keyCode == 52 || keyCode ==100) {
    handleEvent ("4", true);
  } else if (key ==5 || keyCode == 53 || keyCode ==101) {
    handleEvent ("5", true);
  } else if (key ==6 || keyCode == 54 || keyCode ==102) {
    handleEvent ("6", true);
  } else if (key ==7 || keyCode == 55 || keyCode ==103) {
    handleEvent ("7", true);
  } else if (key ==8 || keyCode == 56 || keyCode ==104) {
    handleEvent ("8", true);
  } else if (key ==9 || keyCode == 57 || keyCode ==105) {
    handleEvent ("9", true);
  } else if (key =='+' || keyCode ==107) {
    handleEvent ("+", false);
  } else if (key =='÷' || keyCode == 47 || keyCode ==111) {
    handleEvent ("÷", false);
  } else if (key == 'x'|| keyCode ==106) {
    handleEvent ("x", false);
  } else if (key == '-'|| keyCode == 45 || keyCode ==109) {
    handleEvent ("-", false);
  } else if (key == 'c' || keyCode == 67 || keyCode ==96) {
    handleEvent ("c", false);
  } else if (key == '.' || keyCode == 46 || keyCode ==110) {
    handleEvent (".", false);
  }else if (key == '=' || keyCode == 61 || keyCode == 10) {
    handleEvent ("=", false);
  }
}


void handleEvent(String keyVal, boolean isNum) {
  if (left && dVal.length() <23 && isNum) {
    if (dVal. equals ("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
    //else if for right numbers
  } else if (!left && dVal.length() <23 && isNum) {
    if (dVal. equals ("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    r= float(dVal);
  } else if (keyVal.equals ("+") && !isNum) {
    left =false;
    dVal ="0";
    op = '+';
  }else if (keyVal.equals ("-") && !isNum) {
    left =false;
    dVal ="0";
    op = '-';
  }else if (keyVal.equals ("÷") && !isNum) {
    left =false;
    dVal ="0";
    op = '÷';
  }else if (keyVal.equals ("x") && !isNum) {
    left =false;
    dVal ="0";
    op = 'x';
  }else if (keyVal.equals ("=") && !isNum) {
    left =false;
    dVal ="0";
    op = '=';
  }
}


//    if (dVal. equals ("0")) {
//      dVal = keyVal;
//    } else {
//      dVal += keyVal;
//    }
//    l = float(dVal);
//  }
