InputManager im;
Physics      ps;
ArrayList<Coll> cls;

float        ss = 4;

void setup()
{
  size(800,600);
  cls = new ArrayList<Coll>();
  im = new InputManager();
  ps = new Physics();
  Add(10);
  
  smooth();
}


void draw()
{
  background(255);
  ps.display();
  
  for(Coll cl: cls){
    cl.update();
    cl.display();
  }
  
  im.display();
  //println(frameRate);
}

void keyPressed(){
  if(key==' '){
    Add(1);
  }
  if(key=='q')
  {
    isShowTail = !isShowTail;
    if(!isShowTail){
      for(Coll cl: cls){
        cl.ppos = new ArrayList<PVector>();
      }
    }
  }
}

void Add(int num)
{
  for(int i=0; i<num; i++){
    Coll temp = new Coll(random(0,800),random(0,800),random(10,50));
    cls.add(temp);
    ps.add(temp);
    im.add(temp);
  }
}