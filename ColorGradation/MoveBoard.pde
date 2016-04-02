class MoveBoard extends Clickable
{
  int index;
  
  PVector size;
  color   col;
  
  MoveBoard(PVector ppos, PVector psize, color pcol, int i){
    super.pos  = ppos.copy();
    this.size = psize.copy();
    this.col  = pcol;
    
    super.hoverable = true;
    super.clickable = true;
    super.draggable = true;
    
    this.index = i;
  }
  
  
  void display(){
    fill(col);
    stroke(50);
    strokeWeight(2);
    rect(pos.x,pos.y,size.x,size.y,5);
  }
  
  void clickEvent(){
    println(index);
  }
  
  void releaseEvent(){
  
  }
  
  void drawHover(){
    fill(50,150);
    noStroke();
    rect(pos.x,pos.y,size.x,size.y,5);
  }
  
  void drawClick(){
    noFill();
    stroke(200,0,0);
    strokeWeight(3);
    rect(pos.x-5,pos.y-5,size.x+10,size.x+10,5);
  }
  
  void drawDrag(){
    noFill();
    stroke(200,0,0);
    strokeWeight(3);
    rect(pos.x-5,pos.y-5,size.x+10,size.x+10,5);
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