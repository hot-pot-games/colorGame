ConChan c1,c2;
float xc;
int   sc;

void setup(){
  size(800,600);
  c1 = new ConChan(0,0);
  c2 = new ConChan(0,1);
  xc=30;
  sc=1;
}

void draw(){
  background(255);
  translate(400,300);
  
  
  scale(100);
  
  
  
  pushMatrix();
  
  float rate = radians(xc);
  
  xc+=0.3*sc;
  if(xc>45){
    sc=-1;
  }
  else if(xc<30){
    sc=1;
  }
  
  //c1.drawDot(0.6);
  //c1.drawDot(0.5);
  //c1.drawDot(0.4);
  //c2.drawDot(-0.4);
  //c2.drawDot(-0.6);
  //c2.drawDot(-0.5);
  PVector p1,p2,p3,p4,cp;
  p1 = c1.getDot(rate);
  p2 = c2.getDot(-rate);
  p3 = c2.getDot(rate-1);
  p4 = c1.getDot(1-rate);
  
  cp = c1.getDot(0.5).add(c2.getDot(-0.5));
  cp.mult(0.5);
  
  cp.y+=0.75;
  p2.y+=1;
  p3.y+=1;
  
  
  PVector vl1,vl2,vl3,vl4;
  
  vl1 = new PVector(c1.x,c1.y);
  vl1.y = 1f/cos(rate-1);
  vl1.x=vl1.x*0.4+p1.x*0.6;
  vl1.y=vl1.y*0.4+p1.y*0.6;
  
  vl2 = new PVector(c2.x,c2.y);
  vl2.y = 1f/cos(rate-1)-1;
  vl2.x=vl2.x*0.4+p2.x*0.6;
  vl2.y=vl2.y*0.4+p2.y*0.6;
  
  
  vl3 = new PVector(c2.x,c2.y);
  vl3.y = 1f/cos(rate-1)-1;
  vl3.x=vl3.x*0.4+p3.x*0.6;
  vl3.y=vl3.y*0.4+p3.y*0.6;
  
  
  vl4 = new PVector(c1.x,c1.y);
  vl4.y = 1f/cos(rate-1);
  vl4.x=vl4.x*0.4+p4.x*0.6;
  vl4.y=vl4.y*0.4+p4.y*0.6;
  
  if(vl1.y>vl2.y){
    float xx = c1.y+c2.y;
    vl1.y = xx/2f;
    vl2.y = xx/2f;
  }
  
  if(vl4.y>vl3.y){
    float xx = c1.y+c2.y;
    vl3.y = xx/2f;
    vl4.y = xx/2f;
  }
  
  if(vl3.x>vl1.x){
    float xx = vl1.x+vl3.x;
    vl1.x = xx/2f;
    vl2.x = xx/2f;
    vl3.x = xx/2f;
    vl4.x = xx/2f;
  }
  
  //stroke(255,0,0);
  //ellipse(vl1.x,vl1.y,0.05,0.05);
  //ellipse(p1.x,p1.y,0.05,0.05);
  //line(vl1.x,vl1.y,p1.x,p1.y);
  
  //ellipse(vl2.x,vl2.y,0.05,0.05);
  //ellipse(p2.x,p2.y,0.05,0.05);
  //line(vl2.x,vl2.y,p2.x,p2.y);
  
  //ellipse(vl3.x,vl3.y,0.05,0.05);
  //ellipse(p3.x,p3.y,0.05,0.05);
  //line(vl3.x,vl3.y,p3.x,p3.y);
  
  //ellipse(vl4.x,vl4.y,0.05,0.05);
  //ellipse(p4.x,p4.y,0.05,0.05);
  //line(vl4.x,vl4.y,p4.x,p4.y);
  
  //ellipse(vl2.x,vl2.y,0.05,0.05);
  
  //noStroke();
  strokeWeight(0.02);
  stroke(#46C654);
  fill(#81F58D,100);
  //translate(0,0.5);
  beginShape();
  vertex(p1.x,p1.y);
  bezierVertex(vl1.x,vl1.y,vl2.x,vl2.y,p2.x,p2.y);
  vertex(p3.x,p3.y);
  bezierVertex(vl3.x,vl3.y,vl4.x,vl4.y,p4.x,p4.y);
  endShape(CLOSE);
  popMatrix();
  
  
  fill(#81F58D);
  c1.display();
  c2.display();
}