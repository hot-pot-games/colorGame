//基础区域

//矩形区域
class RectArea {
  PVector pos;
  PVector size;

  RectArea(float xx, float yy, float ww, float hh) {
    pos  = new PVector(xx, yy);
    size = new PVector(ww, hh);
  }

  RectArea(PVector ppos, PVector psize) {
    pos     = ppos.copy();
    size    = psize.copy();
  }

  boolean isIn(float mx, float my) {
    if (mx>pos.x && mx<pos.x+size.x && my>pos.y && my<pos.y+size.y) {
      return true;
    } else {
      return false;
    }
  }
}

//这里的KnowMouseArea和Clickable在结构上十分相像
//但是为了整体的低耦合性必须要分出来，即：绘图与逻辑分开

//绘制接口
interface KnowMouseArea
{
  boolean isIn(float mx, float my);
  void    draw();
  void    click();
  void    drag();
  void    release();
}


//用多种颜色绘制的矩形区域（能感知到鼠标）
class ColorSetRectArea extends RectArea implements KnowMouseArea
{
  //常量
  final  color  default_base_color            = color(255);
  final  color  default_hover_color           = color(100);
  final  color  default_clicked_color         = color(0);
  final  color  default_text_base_color       = color(0);
  final  color  default_text_hover_color      = color(0);
  final  color  default_text_clicked_color    = color(255);
  final  String default_str                   = "Butt";
  final  int    default_font_size             = 24;


  String str;
  int    fontSize;
  color  baseCol;
  color  hoverCol;
  color  clickedCol;
  color  textBaseCol;
  color  textHoverCol;
  color  textClickedCol;

  boolean isInside;
  boolean isClicked;
  PFont   sysFont;

  void setDefaults() {
    baseCol        = default_base_color;
    hoverCol       = default_hover_color;
    clickedCol     = default_clicked_color;
    textBaseCol    = default_text_base_color;
    textHoverCol   = default_text_hover_color;
    textClickedCol = default_text_clicked_color;
    str            = default_str;
    fontSize       = default_font_size;
    sysFont        = null;
  }


  ColorSetRectArea(float xx, float yy, float ww, float hh) {
    super(xx, yy, ww, hh);
    setDefaults();
  }

  ColorSetRectArea(PVector ppos, PVector psize) {
    super(ppos, psize);
    setDefaults();
  }

  ColorSetRectArea setFont(PFont pf) {
    sysFont = pf;
    return this;
  }

  boolean isIn(float mx, float my) {
    isInside = super.isIn(mx, my);
    return isInside;
  }

  void click() {
    isClicked = true;
  }

  void drag() {
  }

  void release() {
    isClicked = false;
  }

  void draw() {
    pushMatrix();

    translate(pos.x, pos.y);

    noStroke();

    fill(baseCol);
    if (isInside)  fill(hoverCol);
    if (isClicked) fill(clickedCol);

    rect(0, 0, size.x, size.y);

    fill(textBaseCol);
    if (isInside)  fill(textHoverCol);
    if (isClicked) fill(textClickedCol);
    if (sysFont!=null)
    {
      textFont(sysFont, fontSize);
    } else {
      textSize(fontSize);
    }
    textAlign(CENTER);
    text(str, size.x/2, size.y/1.2);

    popMatrix();
  }
}

//枚举类型 button_type_enum
public enum button_type {
  DEFAULT_BUTT, IMAGE_BUTT;
}


class uiButton implements Clickable
{
  //常量
  static final float default_w = 80;
  static final float default_h = 30;

  KnowMouseArea area;
  function_type value;

  uiButton(float xx, float yy)
  {
    area  = new ColorSetRectArea(xx, yy, default_w, default_h);
    value = function_type.NONE;
  }

  uiButton link(function_type val) {
    value = val;
    return this;
  }

  boolean isIn(float mx, float my)
  {
    return area.isIn(mx, my);
  }

  void draw()
  {
    area.draw();
  }
  void clickEvent()
  {
    area.click();
    doEvent(value);
  }

  void releaseEvent()
  {
    area.release();
  }
}

class UIfactory {
  PFont pf;
  UIset tus;

  UIfactory(UIset pus) {
    pf   = createFont("Arial", 40);
    tus  = pus;
  }

  void addButton(float xx, float yy) {
    uiButton nb = new uiButton(xx, yy);
    tus.add(nb);
  }

  void addButton(float xx, float yy, function_type val) {
    uiButton nb = new uiButton(xx, yy).link(val);
    tus.add(nb);
  }
}

//接口
interface Clickable {
  boolean isIn(float mx, float my); //确认有没有处于范围
  void    draw();                   //绘制
  void    clickEvent();             //触发点击事件
  void    releaseEvent();           //触发释放事件
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