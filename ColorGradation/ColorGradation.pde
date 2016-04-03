ArrayList<MoveBoard>mbs;

InputManager inm;
Tray         tr;


void setup(){
  size(1200,800);
  
  int num = 16;
  PVector s = new PVector(60,60);
  
  inm = new InputManager();
  tr  = new Tray(new PVector(s.x,s.y),num,0.05);
  
  mbs = new ArrayList<MoveBoard>();

  PVector psize = s.copy();
  color cl1,cl2;
  cl1 = color(255,0,100);
  cl2 = color(100,100,200);
  for(int i=0; i<num; i++){
    MoveBoard temp;
    temp = new MoveBoard(tr.get(i).copy(),psize.copy(), lerpColor(cl1,cl2,i*1f/num),i);
    temp.findDock(tr.getDock(i));
    mbs.add(temp);
    inm.add(temp);
  }
  
  mbs.get(0).freeze();
  mbs.get(mbs.size()-1).freeze();
  
  reshuffle(20);
}


void draw(){
  background(30);
  tr.display();

  for(MoveBoard m: mbs){
   m.display();
  }
  
  inm.display();
}




void reshuffle(int num){
  for(int i=0; i<num; i++){
   int a,b;
   
   a = 1+(int)random(0,mbs.size()-3);
   b = 1+(int)random(0,mbs.size()-3);
    
   mbs.get(a).exchangeDg(mbs.get(b));
  }
  for(MoveBoard mb: mbs){
    mb.dock();
  }
}

void insert(MoveBoard ma, MoveBoard mb){
  ma.exchangeDg(mb);
  ma.dock();
}