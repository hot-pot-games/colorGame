Galaxy gl;

void setup(){
  size(1200,800);
  gl = new Galaxy(new PVector(600,400),40);
}

void draw(){
  background(0);
  gl.display();
}