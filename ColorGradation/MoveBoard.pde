MoveBoard seleMB;

class MoveBoard{
  PVector pos;
  PVector size;
  //PVector speed;
  //PVector targetSpeed;
  color   col;
  
  PVector dragOffset;
  boolean rollover;
  boolean dragging;
  boolean pmousePressed;
  
  MoveBoard(PVector ppos, PVector psize, color pcol){
    this.pos  = ppos.copy();
    this.size = psize.copy();
    //this.speed = new PVector(1,0);
    //this.targetSpeed = new PVector(0,0);
    this.col  = pcol;
    this.dragOffset = new PVector(0,0);
    this.rollover   = false;
    this.dragging   = false;
    this.pmousePressed = false;
  }
  
  void display(){
    pushMatrix();
    translate(pos.x,pos.y);
    fill(col);
    stroke(0);
    strokeWeight(2);
    //if(dragging){
    //  rotateY(HALF_PI*speed.x*0.2);
    //}
    rect(0,0,size.x,size.y);
    
    popMatrix();
  }
  
  //float getXspeed(){
  //  float distance;
  //  distance = mouseX-pmouseX;
    
    
  //  return distance/k_rotate;
  //}
  
  void checkMouse(){
    if(hasSele && seleMB!=this){
      println("a");
      return;
    }
    
    boolean isIn = isInBoard(mouseX,mouseY);
    if(isIn){
      rollover = true;
    }
    else{
      rollover = false;
    }
    
    if(!mousePressed){
      dragging      = false;
      hasSele       = false;
      pmousePressed = false;
    }
    else{
      if(pmousePressed){
          pos.x = mouseX + dragOffset.x;
          pos.y = mouseY + dragOffset.y;
      }
      else if(isIn){
        pmousePressed = true;
        hasSele = true;
        seleMB = this;
        dragging = true;
        dragOffset.x = pos.x-mouseX;
        dragOffset.y = pos.y-mouseY;
      }
    }
    
  }
  
  boolean isInBoard(int mx, int my){
    if (mx>pos.x&&mx<pos.x+size.x && my>pos.y&&my<pos.y+size.y) {
      return true;
    }
    else{
      return false;
    }
  }

}