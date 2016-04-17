final float cellLength = 20.0f;

class Cell{
  
  PVector position;
  //float length = 20;
  color col;
  boolean isDestination;
  int specialEvent;
  boolean isPoisonous;
  boolean hasViableBacteria;
  
  Cell(PVector p)
  {
    this.position = p;

    this.col = color(255);
    this.isDestination = false;
    this.specialEvent = 0;
    this.isPoisonous = false;
    this.hasViableBacteria = false;
  }
  
  boolean isInside(float x, float y){
    if(x > position.x && x < position.x + cellLength && y > position.y && y < position.y + cellLength){
      return true;
    }
    else{
      return false;
    }
  }
  
  void display()
  {
    fill(col);
    noStroke();
    rect(position.x,position.y,cellLength,cellLength);
  }
}