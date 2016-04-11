class SmallDrop extends Drop{
  Drop target;
  PVector speed;
  boolean isDead;
  
  SmallDrop(PVector ppos, float pmass,color pcol,Drop tt)
  {
    super(ppos,pmass);
    this.col = pcol;
    this.target = tt;
    int reachTime = (int)(random(6000,15000) / tt.mass);
    float xv,yv;
    xv = (tt.pos.x-pos.x)/reachTime;
    yv = (tt.pos.y-pos.y)/reachTime;
    
    this.speed = new PVector(xv,yv);
    isDead = false;
  }
  
  void moveToTarget()
  {
    this.pos.add(speed);
  }
  
  void kill(){
    isDead = true;
  }
  
  boolean isReached(){
    if(pos.dist(target.pos) < mass * density / 2f + target.mass * target.density / 2f){
      return true;
    }
    else{
      return false;
    }
  }
  
  
}