Drop drop1,drop2;
ArrayList<SmallDrop> sds;

void setup()
{
  size(1200,800);
  drop1 = new Drop(new PVector(200,600),5);
  drop2 = new Drop(new PVector(1000,500),25);
  sds = new ArrayList<SmallDrop>();
}

void draw()
{
  background(0);
  drop1.display();
  drop2.display();
  for(SmallDrop sd:sds)
  {
    sd.display();
  }
}