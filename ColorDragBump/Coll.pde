boolean isShowTail = true;
int     tailNum    = 60;

class Coll extends Clickable
{
  PVector speed;
  PVector size;
  PVector force;
  color   col;
  ArrayList<PVector>ppos;
  
  
   Coll(float pox, float poy,float ps)
  {
    super.hoverable = true;
    super.clickable = true;
    super.draggable = true;
    this.pos      = new PVector(pox,poy);
    this.size     = new PVector(ps,ps);
    this.speed    = new PVector(random(-0.1,0.1),random(-0.1,0.1));
    this.force    = new PVector(0,0);
    this.col      = getRandomColor();
    this.ppos       = new ArrayList<PVector>();
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
  
  void update(){
    this.speed.add(force);
    this.pos.add(speed);
    this.force.mult(0);
  }
  
  void display()
  {
    if(isShowTail && ppos.size()>0)
    {
      float trans = 0;
      float step;
      
      step  = 255f/ppos.size();
      
      
      for(PVector p: ppos){
        fill(col,trans);
        //stroke(80,trans);
        //strokeWeight(1.5);
        noStroke();
        ellipse(p.x,p.y,size.x,size.y);
        
        trans+=step;
      }
    }
    else
    {
      fill(col);
      //stroke(80);
      //strokeWeight(2);
      noStroke();
      ellipse(pos.x,pos.y,size.x,size.y);
    }
    
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