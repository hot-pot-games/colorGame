final float MAX_SCALE = 1.5f;
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
  
  void limitPos(){
    float lit = 2*1024*scale*cellSize/100;
    
    if(pos.x>lit-50){
      pos.x = lit-50;
    }
    
    if(pos.x<width-lit){
     pos.x = width-lit;
    }
    
    if(pos.y>lit+200){
     pos.y = lit+200;
    }
    
    if(pos.y<height-lit-300){
     pos.y = height-lit-300;
    }
    
  }
  
  void drag(){
    pos.x+= mouseX-pmouseX;
    pos.y+= mouseY-pmouseY;
    limitPos();
  }
  
  void scaleUp(){
    if(scale>MAX_SCALE){
      return;
    }
    float baseX = pos.x-mouseX;
    float baseY = pos.y-mouseY;
    baseX*=1.1;
    baseY*=1.1;
    scale*=1.1;
    pos.x = mouseX+baseX;
    pos.y = mouseY+baseY;
    limitPos();
  }
  
  void scaleDown(){
    if(scale<MIN_SCALE){
      return;
    }
    float baseX = pos.x-mouseX;
    float baseY = pos.y-mouseY;
    baseX*=0.9;
    baseY*=0.9;
    scale*=0.9;
    pos.x = mouseX+baseX;
    pos.y = mouseY+baseY;
    limitPos();
  }
 
  
  void display(){
    pushMatrix();
    translate(pos.x,pos.y);
    scale(scale);
    scale(cellSize);
    imageMode(CENTER);
    image(backP,0,0,100,100);
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
  
  int cellState;
  
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
  
  void copyFrom(Cell that){
    this.pos        = that.pos.copy();
    this.strokeSize = that.strokeSize;
    this.edgeSize   = that.edgeSize;
    this.col        = that.col.copy();
    this.isPoison   = that.isPoison;
    this.hasC       = that.hasC;
    this.cc         = that.cc;
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
    strokeWeight(0);
    stroke(0);
    fill(col.col,120);
    rect(pos.x,pos.y,edgeSize,edgeSize);
    if(hasC)
    {
      pushMatrix();
      translate(pos.x+0.5f,pos.y+0.5f);
      cc.display();
      popMatrix();
    }
  
  }
}


class StartCell extends Cell
{
  StartCell(Cell that){
    super(0,0);
    copyFrom(that);
  }
  
  void display(){
    strokeWeight(0);
    stroke(0);
    fill(col.col,120);
    rect(pos.x,pos.y,edgeSize,edgeSize);
    imageMode(CORNERS);
    image(startP,pos.x,pos.y,pos.x+1,pos.y+1);
    if(hasC)
    {
      pushMatrix();
      translate(pos.x+0.5f,pos.y+0.5f);
      cc.display();
      popMatrix();
    }
  }
}


class EndCell extends Cell
{
  EndCell(Cell that){
    super(0,0);
    copyFrom(that);
  }
  
  void display(){
    strokeWeight(0);
    stroke(0);
    fill(col.col,120);
    rect(pos.x,pos.y,edgeSize,edgeSize);
    imageMode(CORNERS);
    image(endP,pos.x,pos.y,pos.x+1,pos.y+1);
    
    if(hasC)
    {
      pushMatrix();
      translate(pos.x+0.5f,pos.y+0.5f);
      cc.display();
      popMatrix();
    }
  }
}