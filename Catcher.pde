class Catcher {
  PVector loc;
  int d;

  Catcher() {
    loc = new PVector(mouseX, height-d);
    d = 70;
  }

  void display() {
    fill(255);
    image(paw, loc.x, loc.y);
  }

  void update() {
    loc.set(mouseX, height-d);
  }
  boolean catchDrop(Raindrop drop) {
    if (loc.dist(drop.loc) < d/2 + drop.d/2) {
      drop.colorChange();
      return true;
    }
    else {
      return false;
    }
  }
}
