class Raindrop {
  PVector loc, vel, acc;
  int d;
  color c;

  Raindrop() {
    d = 10;
    loc = new PVector(random(width), -d); 
    vel = new PVector(0, random(1, 2));
    acc = new PVector(0, .01);
  }

  void display() {
    noStroke();
    fill(200, 230, 255);
    ellipse(loc.x, loc.y, d, d);
  }
  void drop() {
    vel.add(acc);
    loc.add(vel);
  }
  void reset() {
    //    loc.set( random(width), random(-height/2, -d));
    loc.set( random(width), 0);
    vel.set(0, random(1, 3));
  }

  void goAway() {
    loc.set(height*2, 0);
    vel.set(0, 0);
    acc.set(0, 0);
  }
  void colorChange() {
    c = color(0, random(100, 255), random(100, 255));
  }
}

