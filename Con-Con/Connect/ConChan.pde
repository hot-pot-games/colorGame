class ConChan{
  Color     col;
  ConChan[] mate;
  
  
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