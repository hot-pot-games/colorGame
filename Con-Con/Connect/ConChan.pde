class ConChan{
  Color     col;
  ConChan[] mate;
  
  float strokeSize;
  float edgeSize;
  
  boolean isDead;
  
  ConChan(Color pcol){
    this.col        = pcol.copy();
    this.strokeSize = 0.02;
    this.edgeSize   = 0.8;
  }
  
  void display(){
    strokeWeight(strokeSize);
    stroke(col.darkEdge().col);
    fill(col.col);
    ellipse(0,0,edgeSize,edgeSize);
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