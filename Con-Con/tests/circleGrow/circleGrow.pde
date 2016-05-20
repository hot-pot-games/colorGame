import de.looksgood.ani.*;

float r,nextR;
color nextC;

void setup(){
  size(512,512);
  smooth();
  r = random(50,400);
  nextR = random(50,400);
  nextC = color(random(255),random(255),random(255));
  Ani.init(this);
}

void draw(){
  background(255);
  noFill();
  
  //next circle
  stroke(nextC);
  strokeWeight(20);
  ellipse(width/2,height/2,nextR,nextR);
  
  //the circle
  stroke(100);
  strokeWeight(4);
  ellipse(width/2,height/2,r,r);
  Ani.to(this, 5, "r", nextR);
  
  if((r - 2) >= (nextR - 10) && (r + 2) <= (nextR + 10)){
   nextR = random(50,200);
   nextC = color(random(255),random(255),random(255));
  }
}