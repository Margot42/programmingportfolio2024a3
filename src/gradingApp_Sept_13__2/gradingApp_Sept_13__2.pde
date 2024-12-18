//MARGOT ZOLLINGER | Grades App |Sep 13,2024
float grade;

void setup () {
  size(400, 150);
  background(100);
}

void draw() {
  background(100,50,100);

  //title info
  textAlign(CENTER);
  fill(0);
  textSize(24);
  text("GRADES by Margot Zollinger", width/2, 40);

  //refrence line
  stroke(200);
  strokeWeight(3);
  line(0, 100, width, 100);

  //Tic Marks
  //line(200,95,200,105);
  for (int i=0; i<width; i+=50) {
    line(i, 95, i, 105);
    textSize(11);
    text((float)i /width*4.0, i, 95);
  }

  // Marker the circle on line locked in
  ellipse(mouseX, 100, 8, 8);
  textSize(10);
  text((float)mouseX/width*4.0, mouseX, 120);

  assignGrade((float)mouseX/width*4.0);
  
  println(grade);
  
}

void assignGrade (float tgrade) {
  if (tgrade >= 3.51) {
    text("Assign letter grade A.",width/2,135);
  } else if (tgrade >= 3.0) { // In one conditional statement, you can only ever have one if and one else. However, you can have as many else if's as you like!
     text ("Assign Letter grade A-.",width/2,135);
  } else if (tgrade >= 2.84) {
     text ("Assighn letter grade B+.",width/2,135);
  } else if (tgrade >= 2.67) {
     text ("Assign letter grade B.",width/2,135);
  } else if (tgrade >= 2.5) {
     text ("Assign letter grade B-.",width/2,135);
  } else if (tgrade >= 2.34) {
     text ("Assign letter grade C+.",width/2,135);
  } else if (tgrade >= 2.17) {
     text ("Assign letter grade C.",width/2,135);
  } else if (tgrade >= 2.00) {
     text ("Assign letter grade C-.",width/2,135);
  } else if (tgrade >= 1.66) {
     text ("Assign letter grade D+.",width/2,135);
  } else if (tgrade >= 1.33) {
     text ("Assign letter grade D.",width/2,135);
  } else if (tgrade >= 1.00) {
     text ("Assign letter grade D-.",width/2,135);
  } else { // the catch all-if it fails on that check then it WILL receive it- grade letetr F.
     text ("Assign Letter grade F.",width/2,135);
  }
}
