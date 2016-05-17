import de.looksgood.ani.*;

float x = 256;
float y = 256;
int diameter = 50;

Ani diameterAni;

void setup()
{
  size(512,512);
  smooth();
  noStroke();
  
  Ani.init(this);
  diameterAni = new Ani(this,1.5,"diameter",150,Ani.EXPO_IN_OUT,"onStart:itsStarted,onEnd:newRandomDiameter");
}

void draw()
{
  background(255);
  fill(0);
  ellipse(x,y,diameter,diameter);
}

void mouseReleased()
{
  Ani.to(this,1.5,"x",mouseX,Ani.ELASTIC_OUT);
  Ani.to(this,1.5,"y",mouseY,Ani.ELASTIC_OUT);
  diameterAni.start();
}

void itsStarted()
{
  println("diameterAni started");
}

void newRandomDiameter(Ani theAni)
{
  float end = theAni.getEnd();
  float newEnd = end + random(-20,20);
  theAni.setEnd(newEnd);
}