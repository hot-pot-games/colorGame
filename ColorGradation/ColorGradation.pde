ArrayList<MoveBoard>mbs;

InputManager inm;

boolean hasSele;
PVector dragOffset;
boolean rollover;
boolean dragging;
boolean pmousePressed;

void setup(){
  size(1200,800);
  
  inm = new InputManager();
  
  mbs = new ArrayList<MoveBoard>();
  
  PVector ppos = new PVector(200,400);
  PVector psize = new PVector(80,80);
  color cl1,cl2;
  cl1 = color(255,0,100);
  cl2 = color(100,100,200);
  int num = 8;
  for(int i=0; i<num; i++){
    MoveBoard temp;
    temp = new MoveBoard(new PVector(ppos.x+psize.x*i*1.2,ppos.y),
                          psize.copy(), lerpColor(cl1,cl2,i*1f/num));
    mbs.add(temp);
    inm.add(temp);
  }
}


void draw(){
  background(255);
  hasSele = false;
  for(MoveBoard m: mbs){
    m.display();
  }
  inm.display();
}