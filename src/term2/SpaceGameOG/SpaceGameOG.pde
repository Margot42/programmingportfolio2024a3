// Margot Zollinger |Nov.6| SpaceGame

import processing.sound.*;
SoundFile laser;
SoundFile music;
SoundFile pixel;
SoundFile end;
//s1 =TOBYYYYYYyy
Spaceship tobby;
Rock r1;

ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser>lasers= new ArrayList<Laser>();
ArrayList<Powerup>powups= new ArrayList<Powerup>();
ArrayList<Star>stars= new ArrayList<Star>();
int score, level, rockRate;
//true or false
boolean play;
Timer rTime, puTime;

void setup() {
  size(800, 800);
  tobby = new Spaceship();
  r1= new Rock ();
  score = 0;
  level = 1;
  play = false;
  rockRate= 1000;
  rTime= new Timer(rockRate);
  rTime.start();
  puTime= new Timer(15000);
  puTime.start();
  
  music=new SoundFile(this, "intel.wav");
  laser=new SoundFile(this,"laser.wav");
  pixel=new SoundFile(this, "pixel.mp3");
  end=new SoundFile(this, "end.mp3");
}



void draw() {
  
  ///checking play is fasle
  if(!play){
  startScreen();
  } else {
  background (0);
  
  if(frameCount % 1000==0){
  level++;
  rockRate -= 50;
  rTime.totalTime-=50;
  }
  
  //background stars
  stars.add(new Star());
  for(int i=0; i< stars.size(); i++){
  Star s= stars.get(i); 
  s.display();
  s.move();
  if(s.reachedBottom()){
  stars.remove(s);
  }
  }
  
  //render powerups
  if (puTime.isFinished()) {
    powups.add(new Powerup());
    puTime.start();
  }
  for (int i = 0; i< powups.size(); i++) {
    Powerup pu= powups.get(i);





    if (pu.intersect(tobby)) {
      powups.remove(pu);
      //2. health benifit
      tobby.health += 100;
      // health benifit
      //3. laser strenght
      //4. more ammo incrase
      //5. turret count
      //9. temporary score multiplier
    }

    pu.display();
    pu.move();
    if (pu.reachedBottom()) {
      powups.remove(pu);
    }
  }

  //Renders lasers and detects rocks
  for (int i= 0; i<lasers.size(); i++) {
    Laser laser = lasers.get(i);
    for (int j=0; j<rocks.size(); j++) {
      Rock rock = rocks.get(j);
      if (laser.intersect(rock))
      {
        rock.diam -= 10;
        if (rock.diam<10) {
          rocks.remove(rock);
        }
        score += 100;
      }
    } ///rocks distributed
    laser.display();
    laser.move();
    if (laser.reachedTop()) {
      lasers.remove(laser);
    }
  }


  //RENDERING Rocks
  if (rTime.isFinished()) {
    rocks.add(new Rock());
    rTime.start();
  }
  for (int i = 0; i < rocks.size(); i++) {
    Rock rock = rocks.get(i);

    rock.display();
    rock.move();

    //if it touched TOBBY!??
    if (tobby.intersect(rock)) {
      //deduct 10 points
      score -= 10;
      tobby.health -= 10;

      rocks.remove(rock);
      //deduct 10 health
      //delet rock
    }
    if (rock.reachedBottom()) {
      rocks.remove(rock);
    }
  }
  tobby.display ();
  tobby.move(mouseX, mouseY);
  infoPanel();
  
  if(tobby.health<1){
  gameOver();
  noLoop();
  }
}
}

void keyPressed() {
  if (key == ' ' && tobby.fire()) {
    lasers.add(new Laser(tobby.x, tobby.y));
    tobby.laserCount= tobby.laserCount -1;
  }
}

void infoPanel() {
  rectMode(CENTER);
  fill(127, 127);
  rect(width/2, 20, width, 40);
  fill(200);
  text("Score:" + score, 20, 36);
  text("Health:"+ tobby.health, 200, 30);
  text("Level:"+ level, 400, 30);
  text("Ammo:"+ tobby.laserCount, 490, 30);
}




///when i enabled this the Laser wouldn't shoot anymore
void mousePressed () {
  
  if(!laser.isPlaying()) {
  laser.play();
  }
  
  
  //if (tobby.fire() && tobby.turretCount==1) {
    lasers.add (new Laser(tobby.x, tobby.y));
    tobby.laserCount= tobby.laserCount -1;
    tobby.laserCount--;
  //} else if (tobby.fire() && tobby.turretCount== 2) {
  //  lasers.add (new Laser(tobby.x-10, tobby.y));
  //  lasers.add (new Laser(tobby.x+10, tobby.y));
  //  tobby.laserCount-=2;
  //}
}

void startScreen() {
  background (0);
  fill(255);
  text("Welcome Foolish Mortal to SpaceGame!", width/2, 320);
  text("Made by M&M!!!", width/2, 350);
  text("Please click to start !", width/2, 370);
  if (mousePressed) {
    play = true;
    music.play();
    pixel.play();
  }
}


void gameOver() {background (0);
  fill(255);
  text("OH MY WOOMP WOMP", width/2, 320);
  text("YOU are NOT skibidi", width/2, 350);
  text("Score:"+score, width/2, 370);
  text("Level:" + level, width/2, 310);
  end.play();
  if (pixel.isPlaying()) {
    pixel.pause();
  }
}


void ticker() {
}
