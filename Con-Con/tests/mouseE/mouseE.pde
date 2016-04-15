int mx;
int my;
float scales;

void setup(){
  size(200,200);
  mx = 50;
  my = 50;
  scales = 5;
}

void draw(){
  background(255);
  translate(mx,my);

  scale(scales);
  ellipse(0,0,10,10);
  ellipse(-10,0,10,10);
  ellipse(-20,0,10,10);
  ellipse(-20,-10,10,10);
  ellipse(10,0,10,10);
  ellipse(0,10,10,10);
}

void mouseMoved(){
}

void mouseDragged(){
  mx+= mouseX-pmouseX;
  my+= mouseY-pmouseY;
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if(e>0){
    scales*=1.1;
  }
  else{
    scales*=0.9;
  }
  
  println(scales);
}