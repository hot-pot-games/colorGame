class Bubble{
  PVector pos;
  PVector speed;
  PVector force;
  float   radius;
  color   col;
  float   nowbase;
  
  
  Bubble(float x, float y, float r){
    this.pos     = new PVector(x,y);
    this.speed   = new PVector(random(-5,5),random(-5,5));
    this.force   = new PVector(0,0);
    this.radius  = r;
    this.nowbase = random(0,8);
    this.col     = color(255,255,255);
  }
  
  void updateExtra(){
    nowbase += 1f;
    if(nowbase>8){
      nowbase-=8;
    }
  }
  
  void update(){
    color c1,c2;
    float rate;
    if(nowbase>=7){
      rate = 8-nowbase;
      c1 = standardColor[7];
      c2 = standardColor[0];
  }
    else{
      int basenum;
      basenum = (int)nowbase;
      rate = nowbase-basenum;
      c1 = standardColor[basenum];
      c2 = standardColor[basenum+1];
    }
    col = lerpColor(c1,c2,rate);
    
    nowbase += changeColorSpeed;
    if(nowbase>8){
      nowbase-=8;
    }
    
    this.speed.add(force);
    this.pos.add(speed);
    this.force.mult(0);
  }
  
  void display(){
    pushMatrix();
    translate(pos.x,pos.y);
    //ellipse(0,0,radius,radius);
    tint(col);
    image(bubbleTexture,0,0,radius*1.1,radius*1.1);
    noTint();
    popMatrix();
  }
  
  void addForce(PVector fo)
  {
    this.force.add(fo);
  }
}