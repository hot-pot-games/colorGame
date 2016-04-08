PImage bubbleTexture;
PImage backgroundTexture;
PImage[] backs;
color[]  standardColor;
ArrayList<Bubble>bs;
float  changeColorSpeed = 0.01f;

void setup(){
  size(1280,720);
  backs = new PImage[5];
  standardColor = new color[8];
  bubbleTexture     = loadImage("data/bubble.png");
  for(int i=0; i<5; i++){
    backs[i] = loadImage("data/back0"+i+".jpg");
    backs[i].resize(width,height);
  }
  backgroundTexture = backs[(int)random(0,5)];
  imageMode(CENTER);
  bs = new ArrayList<Bubble>();
  bs.add(new Bubble(300,400,150));
  standardColor[0] = color(232,194,194);
  standardColor[1] = color(230,194,232);
  standardColor[2] = color(194,202,232);
  standardColor[3] = color(194,231,232);
  standardColor[4] = color(194,232,202);
  standardColor[5] = color(211,232,194);
  standardColor[6] = color(232,229,194);
  standardColor[7] = color(232,204,194);
}

void draw(){
  background(backgroundTexture);
  bs.get(0).update();
  bs.get(0).display();
}

void mousePressed(){
  
  bs.get(0).update();
}