class Particle{
  boolean locked = false;
  Particle xPos,yPos,xNeg,yBeg;  //四个方向接连的Particle
  
  //物理数值
  double mass = 1.0;
  PVector x;                   //位置坐标
  PVector speed;               //速度
  PVector x0;                  //材质坐标
  PVector fExt;                //外部受力

}