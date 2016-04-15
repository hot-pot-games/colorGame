class ConChan{
  Color     col;
  ConChan[] mate;
  int x;
  int y;
  
  
  ConChan(int xx,int yy){
    x = xx;
    y = yy;
  }
  
  void display(){
    strokeWeight(0.02);
    stroke(#46C654);
    ellipse(x,y,0.83,0.83);
  }
  
  void drawDot(float rate){
    float rx,ry;
    rx = 0.36*cos(PI*rate);
    ry = 0.36*sin(PI*rate);
    ellipse(rx+x,ry+y,0.1,0.1);
  }
  
  PVector getDot(float rate){
    float rx,ry;
    rx = 0.36*cos(PI*rate);
    ry = 0.36*sin(PI*rate);
    return new PVector(rx,ry);
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
  
  
  Color copy(){
    Color cl = new Color(r,g,b);
    return cl;
  }
  
  void mixColor(Color[] other){
  }
}