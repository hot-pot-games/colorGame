class Coll extends Clickable
{
  PVector speed;
  PVector size;
  PVector force;
  color   col;
  
  //一堆构造函数
  Coll(PVector ppos,PVector psi)
  {
    super.hoverable = true;
    super.clickable = true;
    super.draggable = true;
    this.pos      = ppos.copy();
    this.size     = psi.copy();
    this.speed    = new PVector(0,0);
    this.force    = new PVector(0,0);
    this.col      = getRandomColor();
  }
  
  Coll(float pox, float poy,float psx, float psy)
  {
    super.hoverable = true;
    super.clickable = true;
    super.draggable = true;
    this.pos      = new PVector(pox,poy);
    this.size     = new PVector(psx,psy);
    this.speed    = new PVector(0,0);
    this.force    = new PVector(0,0);
    this.col      = getRandomColor();
  }
  
   Coll(float pox, float poy,float ps)
  {
    super.hoverable = true;
    super.clickable = true;
    super.draggable = true;
    this.pos      = new PVector(pox,poy);
    this.size     = new PVector(ps,ps);
    this.speed    = new PVector(0,0);
    this.force    = new PVector(0,0);
    this.col      = getRandomColor();
  }
  
  color getRandomColor(){
    return color((int)random(0,256),(int)random(0,256),(int)random(0,256));
  }
  
  //检测函数
  
  
  void addForce(PVector fo)
  {
    this.force.add(fo);
  }
  
  
  boolean isIn(int mx, int my){
    if(dist(mx,my,pos.x,pos.y)<size.x){
      return true;
    }
    return false;
  }
  
  
  
  void display()
  {
    this.speed.add(force);
    this.pos.add(speed);
    this.force.mult(0);
    fill(col);
    stroke(0);
    strokeWeight(3);
    ellipse(pos.x,pos.y,size.x,size.y);
    
  }
  
  void drawHover(){
    fill(50,150);
    noStroke();
    ellipse(pos.x,pos.y,size.x,size.y);
  }
  
  void drawClick(){
    noFill();
    stroke(200,0,0);
    strokeWeight(3);
    ellipse(pos.x,pos.y,size.x*1.4,size.y*1.4);
  }
  
  void drawDrag(){
    noFill();
    stroke(200,0,0);
    strokeWeight(3);
    ellipse(pos.x,pos.y,size.x*1.4,size.y*1.4);
  }
  
  void clickEvent(){
  }
  
  void releaseEvent(){
  }
  
}