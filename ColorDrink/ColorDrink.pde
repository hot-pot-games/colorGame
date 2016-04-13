final float SMALL_DROP_DRAW = 10f;

ArrayList<SmallDrop> sds;
ArrayList<Drop> ds;
int planetNum = 10;
boolean isD = false;

void setup()
{
  size(1200, 800);
  sds = new ArrayList<SmallDrop>();
  ds = new ArrayList<Drop>();
  int badCount;
  badCount = 0;
  
  for (int i = 0; i < planetNum; i++) 
  {
    Drop dp;
    dp = new Drop(new PVector(random(100, width - 100), random(100, height - 100)), 35);
    boolean isGood = true;
    
    for (int j = 0; j < ds.size(); j++) {
      if (dp.pos.dist(ds.get(j).pos) < 50) {
        isGood = false;
        break;
      }
    }
    if (isGood)
    {
      ds.add(dp);
      badCount = 0;
    } 
    else 
    {
      i--;
      badCount++;
    }

    if (badCount > 10) {
      println("ended with " + (i + 1));
      break;
    }
  }
}

void draw()
{
  background(0);
  
  //去除已经死亡的Drop和SmallDrop
  for (SmallDrop sd : sds) 
  {
    if (sd.isDead) 
    {
      sds.remove(sd);
      break;
    }
  }
  
  for (Drop dp : ds)
  {
    if (dp.isDead)
    {
      ds.remove(dp);
      break;
    }
  }
  
  
  //整体更新：吸取，显示
  for (int i = 0; i < ds.size(); i++) {
    Drop dp;
    dp = ds.get(i);
    
    dp.massLerp();
    dp.colorLerp();
    dp.display();
   
    if (dp.targetMass < 2)
    {
      dp.kill();
    }
    
    if (dp.isDead)
    {
      for (SmallDrop sp : sds)
      {
        if (sp.target == dp) {
          Drop mp = nearDrop(sp);
          sp.target = mp;
          sp.calSpeed(mp);
        }
      }
      continue;
    }
    
    for (int j = 0; j < ds.size(); j++)
    {
      if (i != j)
      {
        Drop that = ds.get(j);
        if (that.isDead) 
        {
          continue;
        }
        dp.attract(that);

        if (dp.isAbove(that))
        {
          for (SmallDrop sp : sds) {
            if (sp.target == that)
            {
              sp.target = dp;
              sp.calSpeed(dp);
            }
          }
          dp.receive(that);
        }
      }
    }
  }

  for (SmallDrop sd : sds)
  {
    if (sd.isDead) 
    {
      continue;
    }
    sd.display();
    sd.moveToTarget();
    if (sd.isReached())
    {
      sd.target.receive(sd);
    }
  }

  for (Drop dp : ds)
  {
    dp.displayCenter();
  }
}



void keyPressed()
{
  isD = !isD;
}

Drop maxDrop()
{
  Drop dp;
  dp = ds.get(0);
  for(int i = 1; i < ds.size(); i++)
  {
    Drop p = ds.get(i);
    if(p.isDead)
    {
      continue;
    }
    if(p.targetMass>dp.targetMass)
    {
      dp = p;
    }
  }
  
  return dp;
}


Drop nearDrop(SmallDrop sp)
{
  Drop dp;
  dp = maxDrop();
  float d;
  d = sp.pos.dist(dp.pos);
  for(int i = 0; i < ds.size(); i++)
  {
    Drop p = ds.get(i);
    if(p.isDead || p == dp)
    {
      continue;
    }
    float e;
    e = sp.pos.dist(p.pos);
    if(d > e){
      dp = p;
      d = e;
    }
  }
  
  return dp;
}