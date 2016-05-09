//枚举类型 function_enum
public enum function_type{
  NONE,SCENE_01,SCENE_02,SCENE_03,SCENE_04;
}

void doEvent(function_type value){
  switch(value){
    case NONE:     println("none function");break;
    case SCENE_01: println("scene01 function"); break;
    case SCENE_02: println("scene02 function"); break;
    case SCENE_03: break;
    default: println("ERROR：使用了未初始化的枚举值（function_enum）"); break;
  }
}