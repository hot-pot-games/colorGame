ArrayList<MoveBoard>mbs;
boolean hasSele;

void setup(){
  size(1200,800);
  mbs = new ArrayList<MoveBoard>();
  
  PVector ppos = new PVector(200,400);
  PVector psize = new PVector(80,120);
  color cl1,cl2;
  cl1 = color(255,0,100);
  cl2 = color(100,100,200);
  int num = 8;
  for(int i=0; i<num; i++){
    mbs.add(new MoveBoard(new PVector(ppos.x+psize.x*i*1.2,ppos.y),
                          psize.copy(), lerpColor(cl1,cl2,i*1f/num)));
  }
}


void draw(){
  background(255);
  hasSele = false;
  for(MoveBoard m: mbs){
    m.checkMouse();
    m.display();
  }
}