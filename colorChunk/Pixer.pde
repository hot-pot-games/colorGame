boolean isShowTail = false;
int     tailNum    = 40;

class Pixer{
  PVector pos;
  PVector speed;
  PVector acc;
  float   mass;
  float   deadSpeed;
  color   col;
  float     r;
  float     g;
  float     b;
  boolean isDead;
  boolean hasDeadBody;
  ArrayList<PVector>ppos;
  
  Pixer(){
    this.pos        = new PVector(random(0,800),random(0,600));
    this.speed      = new PVector(1,0);
    this.acc        = new PVector(0,0);
    this.mass       = 2;
    this.deadSpeed  = 50f;
    this.isDead     = false;
    this.ppos       = new ArrayList<PVector>();
    this.r          = random(0,mass);
    this.g          = random(0,mass);
    this.b          = random(0,mass);
    this.col        = calColor();
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acc.add(f);
  }
  
  void update() {
    if(isDead){
      if(ppos.size()>0){
        ppos.remove(0);
      }
      else{
        hasDeadBody = false;
      }
      return;
    }
    
    speed.add(acc);
    pos.add(speed);
    acc.mult(0);
    if(speed.mag()>deadSpeed || pos.x>width*1.4|| pos.x<0-width*0.4 
          || pos.y>height*1.4||pos.y<0-height*0.4){
      isDead = true;
    }
    hasDeadBody = true;
    
    if(!isShowTail){
      return;
    }
    
    if(ppos.size()<tailNum){
      ppos.add(pos.copy());
    }
    else{
      ppos.remove(0);
      ppos.add(pos.copy());
    }
  }
  
  color calColor(){
    float max = max(r,max(g,b));
    return color(r/max*255,g/max*255,b/max*255);
  }

  void display() {
    strokeWeight(1.5);
    
    if(isShowTail)
    {
    
      float trans = 0;
      float step;
      if(isDead){
        step  = 255f/tailNum;
      }
      else{
        step  = 255f/ppos.size();
      }
      
      for(PVector p: ppos){
        fill(col,trans);
        stroke(50,trans);
        ellipse(p.x,p.y,mass*4,mass*4);
        trans+=step;
      }
    }
    else
    {
      fill(col);
      stroke(50);
      ellipse(pos.x,pos.y,mass*4,mass*4);
    }
  }
  
  boolean fullyDead(){
    if(isDead && !hasDeadBody){
      return true;
    }
    else{
      return false;
    }
  }
  
}