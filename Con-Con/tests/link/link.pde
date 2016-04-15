ConChan c1,c2;

void setup(){
  size(800,600);
  c1 = new ConChan(0,0);
  c2 = new ConChan(0,1);
}

void draw(){
  background(255);
  translate(400,300);
  
  
  scale(100);
  pushMatrix();
  //c1.drawDot(0.6);
  //c1.drawDot(0.5);
  //c1.drawDot(0.4);
  //c2.drawDot(-0.4);
  //c2.drawDot(-0.6);
  //c2.drawDot(-0.5);
  PVector p1,p2,p3,p4,cp;
  p1 = c1.getDot(0.8);
  p2 = c2.getDot(-0.8);
  p3 = c2.getDot(-0.2);
  p4 = c1.getDot(0.2);
  cp = c1.getDot(0.5).add(c2.getDot(-0.5));
  cp.mult(0.5);
  
  //noStroke();
  strokeWeight(0.02);
  stroke(#46C654);
  fill(#81F58D,100);
  translate(0,0.5);
  beginShape();
  vertex(p1.x,p1.y);
  bezierVertex(cp.x,cp.y,cp.x,cp.y,p2.x,p2.y);
  vertex(p3.x,p3.y);
  bezierVertex(cp.x,cp.y,cp.x,cp.y,p4.x,p4.y);
  endShape(CLOSE);
  popMatrix();
  
  fill(#81F58D);
  c1.display();
  c2.display();
  
}