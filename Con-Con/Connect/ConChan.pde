final int LEFT_FRIEND  = 1001;
final int RIGHT_FRIEND = 1002;
final int UP_FRIEND    = 1003;
final int DOWN_FRIEND  = 1004;



class ConChan{
  Color     col;
  //ConChan[] mate;
  ConChan   nxm,pxm,nym,pym;
  
  float strokeSize;
  float edgeSize;
  
  boolean isDead;
  
  ConChan(float r, float g, float b){
    this.col        = new Color(r,g,b);
    this.strokeSize = 0.02;
    this.edgeSize   = 0.8;
    this.nxm        = null;
    this.pxm        = null;
    this.nym        = null;
    this.pym        = null;
  }
  
  
  ConChan(Color pcol){
    this.col        = pcol.copy();
    this.strokeSize = 0.02;
    this.edgeSize   = 0.8;
    this.nxm        = null;
    this.pxm        = null;
    this.nym        = null;
    this.pym        = null;
  }
  
  void makeFriends(int index, ConChan friend){
    switch(index){
      case LEFT_FRIEND: 
        nxm = friend;
      break;
      case RIGHT_FRIEND: 
        pxm = friend;
      break;
      case UP_FRIEND: 
        nym = friend;
      break;
      case DOWN_FRIEND: 
        pym = friend;
      break;
    }
  }
  
  void display(){
    strokeWeight(strokeSize);
    stroke(col.darkEdge().col);
    fill(col.col);
    ellipse(0,0,edgeSize,edgeSize);
    displayMates();
  }
  
  void displayMates(){
  }
  
  
}

class Color{
  float r;
  float g;
  float b;
  color col;
  
  Color(float r, float g, float b){
    this.r = r;
    this.g = g;
    this.b = b;
    this.col = color(r*255,g*255,b*255);
  }
  
  Color darkEdge(){
    float rr,gg,bb;
    rr = r*0.3;
    gg = g*0.3;
    bb = b*0.3;
    return new Color(rr,gg,bb);
  }
  
  Color copy(){
    Color cl = new Color(r,g,b);
    return cl;
  }
  
  void mixColor(Color[] other){
  }
}