Drop drop1,drop2,drop3;
ArrayList<SmallDrop> sds;
ArrayList<Drop> ds;

void setup()
{
  size(1200,800);
  drop1 = new Drop(new PVector(300,600),35);
  drop2 = new Drop(new PVector(720,500),35);
  drop3 = new Drop(new PVector(500,300),35);
  sds = new ArrayList<SmallDrop>();
  ds = new ArrayList<Drop>();
  ds.add(drop1);
  ds.add(drop2);
  ds.add(drop3);
}

void draw()
{
  background(0);
  drop1.display();
  drop2.display();
  drop3.display();
  drop1.attract(drop2);
  drop1.attract(drop3);
  drop2.attract(drop1);
  drop2.attract(drop3);
  drop3.attract(drop1);
  drop3.attract(drop2);

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
  
  for(Drop d:ds)
  {
    d.massLerp();
    d.colorLerp();
  }
}