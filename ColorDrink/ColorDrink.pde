Drop drop1,drop2;
ArrayList<SmallDrop> sds;

void setup()
{
  size(1200,800);
  drop1 = new Drop(new PVector(200,600),35);
  drop2 = new Drop(new PVector(1000,500),35);
  sds = new ArrayList<SmallDrop>();
}

void draw()
{
  background(0);
  drop1.display();
  drop2.display();
  drop1.attract(drop2);
  drop2.attract(drop1);
  for(SmallDrop sd:sds)
  {
    sd.display();
    sd.moveToTarget();
    if(sd.isReached()){
      sd.target.receive(sd);
    }
  }
  
  for(SmallDrop sd:sds){
    if(sd.isDead){
      sds.remove(sd);
      break;
    }
  }
}