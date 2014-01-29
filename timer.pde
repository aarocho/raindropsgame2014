class timer {
  PVector loc;
  int oldTime;

  timer() {
    oldTime = 0;
  }    
  void display() {
    loc = new PVector(50, 50);
    text(millis()-oldTime, loc.x, loc.y);
  }
}



