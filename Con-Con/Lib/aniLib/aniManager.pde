//接口
interface Aniable{
  aniState getState();
  void setState(aniState nst);
  void doAni(aniState nst, float sec);
  void draw();
}


static class aniManager{
  ArrayList<Aniable>avas;
  
  //内部类持有唯一引用
  static class Holder{
    static final aniManager anim = new aniManager();
  }
  //获取唯一引用的函数
  static aniManager getInstance(){
    return Holder.anim;
  }
  
  //私有的构造函数
  private aniManager(){ 
    avas     = new ArrayList<Aniable>();
  }
  
  void add(Aniable ab){
    avas.add(ab);
  }
  
  Aniable get(int index){
    if(index>=avas.size()){
      return null;
    }
    else{
      return avas.get(index);
    }
  }
  
  void display(){
    for(Aniable ava: avas){
      ava.draw();
    }
  }
}