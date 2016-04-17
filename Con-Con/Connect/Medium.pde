final float MAX_SCALE = 3.0f;
final float MIN_SCALE = 0.2f;

class Medium{
  PVector pos;
  float   cellSize;
  float   scale;
  ArrayList<Cell>cells;
  
  Medium(PVector ppos, float pceSize, float pscale){
    this.pos      = ppos.copy();
    this.cellSize = pceSize;
    this.scale    = pscale;
    this.cells    = new ArrayList<Cell>();
  }
  
  void add(Cell cl){
    cells.add(cl);
  }
  
  void drag(){
    pos.x+= mouseX-pmouseX;
    pos.y+= mouseY-pmouseY;
  }
  
  void scaleUp(){
    if(scale>MAX_SCALE){
      return;
    }
    float baseX = pos.x-mouseX;
    float baseY = pos.y-mouseY;
    baseX*=1.1;
    baseY*=1.1;
    pos.x = mouseX+baseX;
    pos.y = mouseY+baseY;
    
    scale*=1.1;
  }
  
  void scaleDown(){
    if(scale<MIN_SCALE){
      return;
    }
    float baseX = pos.x-mouseX;
    float baseY = pos.y-mouseY;
    baseX*=0.9;
    baseY*=0.9;
    pos.x = mouseX+baseX;
    pos.y = mouseY+baseY;
    
    scale*=0.9;
  }
 
  
  void display(){
    pushMatrix();
    translate(pos.x,pos.y);
    scale(scale);
    scale(cellSize);
    for(Cell cl: cells){
      cl.display();
    }
    popMatrix();
  }
}


class Cell{
  Color col;
  PVector pos;
  
  float strokeSize;
  float edgeSize;
  
  boolean isPoison;
  boolean hasC;
  ConChan cc;
  
  Cell(float xx, float yy){
    this.pos  = new PVector(xx,yy);
    this.strokeSize = 0.04f;
    this.edgeSize   = 1f;
    this.col  = new Color(1,1,1);
    this.isPoison = false;
    this.hasC     = false;
  }
  
  void poison(Color pcl){
    this.col      = pcl.copy();
    this.isPoison = true;
  }
  
  void live(ConChan ch){
    this.cc   = ch;
    this.hasC = true; 
  }
  
  void wipe(){
    this.cc   = null;
    this.hasC = false;
  }
  
  void display(){
    strokeWeight(strokeSize);
    stroke(0);
    fill(col.col);
    rect(pos.x,pos.y,edgeSize,edgeSize);
    if(hasC)
    {
      translate(pos.x+0.5f,pos.y+0.5f);
      cc.display();
    }
  
  }
}