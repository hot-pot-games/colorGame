class uiButton extends Clickable
{
  PVector size;
  
  uiButton(PVector ppos,PVector pv)
  {
    super.pos = ppos.copy();
    super.freeze();
    super.hoverable = true;
    super.clickable = true;
    this.size = pv.copy();
  }
  
  void display(){
    fill(255,200);
    noStroke();
    rect(pos.x,pos.y,size.x,size.y,size.x*0.1f);
    fill(0);
    text("TEST",pos.x+size.x*0.05,pos.y+size.y*0.75);
  }
  
  void drawHover(){
    fill(50,200);
    noStroke();
    rect(pos.x-1,pos.y-1,size.x+2,size.y+2,size.x*0.1f);
  }
  
  void drawClick(){
  }
  
  void drawDrag(){
    fill(0);
    noStroke();
    rect(pos.x-1,pos.y-1,size.x+2,size.y+2,size.x*0.1f);
    fill(255);
    text("TEST",pos.x+size.x*0.05,pos.y+size.y*0.75);
  }
  
  boolean isIn(int mx, int my){
    if (mx>pos.x&&mx<pos.x+size.x && my>pos.y&&my<pos.y+size.y) {
      return true;
    }
    else{
      return false;
    }
  }
  
  void clickEvent(){
  }
  
  void releaseEvent(){
    checkWin();
  }

}