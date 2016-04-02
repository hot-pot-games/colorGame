abstract class Clickable{
  boolean hoverable = false;
  boolean clickable = false;
  boolean draggable = false;
  
  abstract boolean isIn(int mx, int my);
  void drawHover(){println("Error: use drawHover without override the past function");};
  void drawClick(){println("Error: use drawClick without override the past function");};
  void drawDrag(){println("Error: use drawDrag without override the past function");};
}

class MoveBoard extends Clickable
{
  PVector pos;
  PVector size;
  color   col;
  
  MoveBoard(PVector ppos, PVector psize, color pcol){
    this.pos  = ppos.copy();
    this.size = psize.copy();
    this.col  = pcol;
    
    super.hoverable = true;
    super.clickable = true;
    super.draggable = true;
  }
  
  void display(){
    fill(col);
    stroke(0);
    strokeWeight(2);
    rect(pos.x,pos.y,size.x,size.y);
  }
  
  void drawHover(){
    fill(50,150);
    noStroke();
    rect(pos.x,pos.y,size.x,size.y);
  }
  
  boolean isIn(int mx, int my){
    if (mx>pos.x&&mx<pos.x+size.x && my>pos.y&&my<pos.y+size.y) {
      return true;
    }
    else{
      return false;
    }
  }

}