class SceneManager
{
  ArrayList<Scene>ss;
  Scene   seleScene;
  boolean isLockScene;
  SceneGameView sg;
  float rad;
  
  PImage sceneBack;
  PImage sceneBackStar;

  SceneManager()
  {
    sg = new SceneGameView(0, -1).load();
    ss = new ArrayList<Scene>();
    ss.add(new SceneStartMenu(0, 0).load());
    ss.add(sg);
    ss.add(new SceneAbout(1, 0).load());
    ss.add(new SceneOption(-1, 0).load());
    ss.add(new SceneStore(0, 1).load());

    isLockScene   = true;
    seleScene     = ss.get(0);
    sceneBack     = loadImage("data/images/background.png");
    sceneBackStar = loadImage("data/images/stars.png");
    
  }

  void display() {
    rad+=0.0003f;
    if(rad>2*PI){
      rad -= 2*PI;
    }
    background(200);
    image(sceneBack,-width,-height,width*3,height*3);
    pushMatrix();
    imageMode(CENTER);
    translate(width/2,height/2);
    rotate(rad);
    image(sceneBackStar,0,0,height*1.5,height*1.5);
    imageMode(CORNER);
    popMatrix();
    
    for (Scene s : ss) 
    {
      s.display();
    }
    
    //if (!isLockScene)
    //{
      
    //} 
    //else {
    //  seleScene.display();
    //}
  }
  
  void checkMousePress(){
    if(isLockScene)
    {
      //println(seleScene.anchor.x);
      seleScene.checkPress(transX+mouseX,transY+mouseY);
    }
  }
}