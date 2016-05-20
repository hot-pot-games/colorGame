//接口
interface Clickable {
  boolean isIn(float mx, float my); //确认有没有处于范围
  void    draw();                   //绘制
  void    clickEvent();             //触发点击事件
  void    releaseEvent();           //触发释放事件
  void    reset();                  //不触发事件的解除焦点
}

//枚举类型 proxy_enum
public enum proxy_ui {
  NULL_UI, CLICK_UI;
}

//可操纵UI代理类
public static class uiProxy {

  static uiProxy instance = null;
  Clickable   ck;
  proxy_ui    superType;

  private uiProxy() {
    ck        = null;
    superType = proxy_ui.NULL_UI;
  }

  public static uiProxy getInstance() {
    if (instance==null) {
      return new uiProxy();
    } else {
      return instance;
    }
  }

  void setSele(Clickable pck) {
    ck = pck;
    superType = proxy_ui.CLICK_UI;
  }

  void selePress() {
    switch(superType) {
    case NULL_UI: 
      break;
    case CLICK_UI: 
      ck.clickEvent(); 
      break;
    }
  }

  void seleRelease() {
    switch(superType) {
    case NULL_UI: 
      break;
    case CLICK_UI: 
      ck.releaseEvent(); 
      break;
    }
  }

  void seleDrag() {
    switch(superType) {
    case NULL_UI: 
      break;
    case CLICK_UI: 
      break;
    }
  }

  boolean hasSele() {
    if (superType!=proxy_ui.NULL_UI) {
      return true;
    } else
    {
      return false;
    }
  }

  void setNull() {
    superType = proxy_ui.NULL_UI;
  }
}

class cf {
  PFont pf;
  cf() {
    pf = createFont("Arial", 40);
  }

  PFont getFont() {
    return pf;
  }
}

//单例
public static class UIset {
  //实例域
  ArrayList<Clickable> cks;      //可点击列表
  uiProxy seleUp;                //选中的ui组件  

  //函数域

  //内部类持有唯一引用
  static class Holder {
    static final UIset set = new UIset();
  }
  //获取唯一引用的函数
  static UIset getInstance() {
    return Holder.set;
  }



  //私有的构造函数
  private UIset() { 
    cks     = new ArrayList<Clickable>();
    seleUp  = uiProxy.getInstance();
  }

  void add(Clickable ck) {
    cks.add(ck);
  }


  void checkHover(float mx, float my) {
    for (Clickable ck : cks) {
      if (ck.isIn(mx, my)) {
        seleUp.setSele(ck);
      }
    }
  }

  void checkPress(float mx, float my) {
    seleUp.setNull();
    checkHover(mx, my);
    if (seleUp.hasSele()) {
      seleUp.selePress();
    }
  }

  void checkRelease() {
    for (Clickable ck : cks) {
      if (ck!=seleUp) {
        ck.reset();
      }
    }
    
    if (seleUp.hasSele()) {
      seleUp.seleRelease();
    }
    
  }


  void display() {
    for (Clickable ck : cks) {
      ck.draw();
    }
  }
}