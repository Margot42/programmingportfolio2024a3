//Margot Zollinger |Temp Converter| 23 sept 2024

void setup() {
  size(400, 200);
}


void draw () {
  //Display name and App title
  background(126);
  ellipse(mouseX, 150, 5, 5);
  textSize(15);
  text("Celsius to Fahrenheit by Margot Zollinger",width/2, 80);
  textSize(10);
  line(0, 150, width, 150);
  
  //hashmarks 
  for (int i=0; i <width+1; i=i+20) {
    line(i, 145, i, 155);
    textAlign(CENTER);
    text(i-200, i, 165);
  }
  text("Cel: " + farToCel(mouseX-168), width/2, 100);
  //println("MouseX:"+ mouseX + ":" +farToCel (mouseX));
  text("Far:" +celToFar (mouseX-200), width/2, 110);
  //println("MouseY:" +mouseX+ ":"+ celToFar (mouseX));

  //ToDO: add far info
  // ToDO: Change the number line to go from -200 to +200
 
  
}

float farToCel (float tempFar) {
  //formula to calculate cellsus converson
  tempFar=(tempFar-32) * (5.0/9.0);
  return tempFar;
}

//opposite dircetion

float celToFar (float tempCel) {
  //include formula
  tempCel=((tempCel* 9.0/5.0))+32;
  return tempCel;
}
