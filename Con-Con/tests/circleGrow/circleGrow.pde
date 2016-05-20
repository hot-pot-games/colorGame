import de.looksgood.ani.*;

float r,nextR;
color c,nextC;

void setup(){
  size(512,512);
  smooth();
  r = random(50,200);
  nextR = random(50,200);
  c = color(random(255),random(255),random(255));
  nextC = color(random(255),random(255),random(255));
  Ani.init(this);
}

void draw(){
  background(255);
  strokeWeight(5);
  
  //the circle
  stroke(c);
  ellipse(width/2,height/2,r,r);
  Ani.to(this, 1.5, "r", nextR);
  
  //next circle
  stroke(nextC);
  ellipse(width/2,height/2,nextR,nextR);
  
  if(r == nextR){
    nextR = random(50,200);
    nextC = color(random(255),random(255),random(255));
  }
}