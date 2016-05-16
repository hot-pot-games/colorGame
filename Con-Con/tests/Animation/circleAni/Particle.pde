class Particle {
  PVector loc;
  float lifespan;
  int R;
  color col;
  float r;

  Particle(color mCol, int mR) {
    col = mCol;
    R = mR;
    lifespan = 150.0;
    r = random(3, 10);
    
    float ran = random(100);
    float temX = random(width/2 - mR,width/2 + mR);
    float temY = sqrt(pow(R,2) - pow(abs(width/2 - temX),2));
    if(ran < 50){
      loc = new PVector(temX,height/2 - temY);
    }
    else
      loc = new PVector(temX,height/2 + temY);
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    lifespan -= 2.5;
  }

  // Method to display
  void display() {
    fill(col, lifespan);
    noStroke();
    ellipse(loc.x, loc.y, r, r);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
}