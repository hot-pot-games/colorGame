final float cellLength = 50.0f;

class Cell{
  
  PVector position;
  //float length = 20;
  color col;
  boolean isDestination;
  int specialEvent;
  boolean isPoisonous;
  boolean hasViableBacteria;
  boolean bacteriaHasColor;
  color bacteriaCol;
  
  Cell(PVector p)
  {
    this.position = p;

    this.col = color(0,0,0,0);
    this.isDestination = false;
    this.specialEvent = 0;
    this.isPoisonous = false;
    this.hasViableBacteria = false;
    this.bacteriaHasColor = false;
    this.bacteriaCol = color(0,0,0,0);
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
    noFill();
    stroke(0);
    strokeWeight(2);
    rect(position.x,position.y,cellLength,cellLength);
    
    if(col != color(0,0,0,0))
    {
      fill(col);
      noStroke();
      rect(position.x + 2,position.y + 2,cellLength - 2,cellLength - 2);
    }
    
    if(isPoisonous)
    {
      fill(204);
      textSize(20);
      text("X",position.x + 2,position.y,position.x + 20,position.y + 20);
    }
    
    if(isDestination)
    {
      fill(color(255,0,0));
      stroke(0);
      rect(position.x + cellLength/3,position.y + cellLength/2 - 15,cellLength/3,15);
      line(position.x + cellLength/3,position.y + cellLength/2 - 15,position.x + cellLength/3,position.y + cellLength/2 + 15);
    }
    
    if(hasViableBacteria)
    {
      if(bacteriaHasColor)
        fill(bacteriaCol);
      else
        noFill();
      stroke(0);
      strokeWeight(2);
      ellipse(position.x + cellLength/2,position.y + cellLength/2,45,45);
      ellipse(position.x + cellLength/2,position.y + cellLength/2 - 10,8,8);
      ellipse(position.x + cellLength/2 - 10,position.y + cellLength/2 + 10,8,8);
      ellipse(position.x + cellLength/2 + 12,position.y + cellLength/2 + 8,8,8);
    }
  }
}