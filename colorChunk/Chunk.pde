class Chunk{
  color   col;
  
  float r;
  float g;
  float b;
  
  PVector pos;
  PVector speed;
  float   mass;
  float   G;
  boolean dragging = false;
  boolean rollover = false;
  boolean pmousePressed = false;
  PVector dragOffset;
  
  Chunk(PVector ppos, float pmass){
    this.pos        = ppos.copy();
    this.speed      = new PVector(0,0);
    this.dragOffset = new PVector(0,0);
    this.mass       = pmass;
    this.G          = 1;
    this.col        = color(255,255,255);
    this.r          = pmass;
    this.g          = pmass;
    this.b          = pmass;
    this.col        = calColor();
  }
  
  PVector attract(Pixer m) {
    PVector force = PVector.sub(pos,m.pos); 
    float d = force.mag();                              
    d = constrain(d,5.0,25.0);                          
    force.normalize();                                  
    float strength = (G * mass * m.mass) / (d * d);    
    force.mult(strength);    
    return force;
  }
  
  void drawSmallBall(float cx, float cy){
    ellipse(cx+8,cy+8,8,8);
    ellipse(cx+8,cy,8,8);
    ellipse(cx,cy+8,8,8);

  }
  
  void display() {
    ellipseMode(CENTER);
    strokeWeight(3);
    stroke(0);
    fill(col);
    
    ellipse(pos.x,pos.y,mass,mass);
    strokeWeight(1.5);
    drawSmallBall(pos.x,pos.y);
    
    noStroke();
    if(rollover){
      fill(0,100);
      ellipse(pos.x,pos.y,mass,mass);
    }
    if(dragging){
      fill(0,200);
       ellipse(pos.x,pos.y,mass,mass);
    }
    
  }
  
  void meet(Pixer pi){
    if(dist(pi.pos.x,pi.pos.y,pos.x,pos.y)<mass/2f+pi.mass*2f){
      eat(pi);
    }
  }
  
  void eat(Pixer pi){
    pi.isDead = true;
    mass  += pi.mass/5f;
    r     += pi.r;
    g     += pi.g;
    b     += pi.b;
    
    col = calColor();
  }
  
  color calColor(){
    float max;
    max = max(r,max(g,b));
    return color(r/max*255,g/max*255,b/max*255);
  }
  
  
  void checkMouse(){
    boolean isIn = isInChunk(mouseX,mouseY);
    if(isIn){
      rollover = true;
    }
    else{
      rollover = false;
    }
    
    if(!mousePressed){
      dragging      = false;
      pmousePressed = false;
    }
    else{
      if(pmousePressed){
          pos.x = mouseX + dragOffset.x;
          pos.y = mouseY + dragOffset.y;
      }
      else if(isIn){
        pmousePressed = true;
        dragging = true;
        dragOffset.x = pos.x-mouseX;
        dragOffset.y = pos.y-mouseY;
      }
    }
    
  }
  
  
  boolean isInChunk(int mx, int my){
    float d = dist(mx,my,pos.x,pos.y);
    if (d < mass/2f) {
      return true;
    }
    else{
      return false;
    }
  }
  
}