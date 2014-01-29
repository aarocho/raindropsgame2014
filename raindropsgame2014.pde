Raindrop[] r = new Raindrop[550];
Catcher catcher;
int index = 1;
int oldTime = 0;
int threshold = 3000;
int score;
PImage dew, kitty, paw;
PImage startScreen;
boolean start = false;
int timeCount;
PFont whoa;
PVector textloc, textvel;

void setup() {
  whoa = loadFont("Broadway-48.vlw");
  dew = loadImage("Rain.jpg");
  kitty = loadImage("background2.png");
  paw = loadImage("paw.png");
  startScreen = loadImage("Rain.png");
  textloc = new PVector(width/2,50);
  textvel = new PVector(-1,0);
  size(dew.width, dew.height);
  for (int i = 0; i < r.length; i++) {
    r[i] = new Raindrop();
  } 
  catcher = new Catcher();
  timeCount = 0;
}


void draw() {
  background(startScreen);
  fill(255);
  textSize(10);
  textAlign(CENTER);
  textFont(whoa);
  rectMode(CENTER);
  fill(255);
  rect(50, height/2, 50, 25, 10); 
  if (timeCount == 0) {
    text("Click to begin!", width/2, height/2+100);
    textSize(15);
    fill(20);
    text("Start", 50, height/2+5);
    textSize(40);
    fill(255);
    text("RAINDROPS GAME", textloc.x,textloc.y);
    textloc.add(textvel);
    if(textloc.x < 0) {
      textloc.set(width, 50);
    }
  }
  if (timeCount > 0) {
    text("Click to resume", width/2, height/2+100);
    textSize(10);
    fill(20);
    text("Resume", 50, height/2+5);
  }
  if (start) {
    background(dew);
    textSize(50);
    fill(10);
    textAlign(LEFT);
    text("Score:", 10, 50);
    text(score, 10, 100);
    for (int i = 0; i < index; i++) {
      r[i].display();
      r[i].drop();
      if (catcher.catchDrop(r[i]) == true) {
        r[i].goAway();
        score++;
        threshold-=50;
        if (threshold < 2500) {
          threshold-=20;
        }
      }
    } 
    catcher.display();
    catcher.update();
    if (millis() - oldTime > threshold) {
      if (index < r.length) {
        index++;
        oldTime = millis();
      }
    }
    if (score >= 100) {
      background(kitty);
      textAlign(CENTER);
      text("CONGRATULATIONS", width/2, height/2);
    }
  }
}

void mousePressed() {
  if (mouseX < 75 && mouseX > 25 && mouseY < 176 && mouseY > 151) {
    start = !start;
    timeCount++;
  }
  
}

/*void keyPressed() {
 if(key == 'S') {
 frameRate(150);
 }
 }
 */
