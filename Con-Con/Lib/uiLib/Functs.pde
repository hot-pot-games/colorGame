//枚举类型 function_enum
public enum function_type{
  NONE,SCENE_01,SCENE_02,SCENE_03,SCENE_04;
}

void doEvent(function_type value){
  switch(value){
    case NONE:     break;
    case SCENE_01: break;
    case SCENE_02: break;
    case SCENE_03: break;
    default: println("ERROR：使用了未初始化的枚举值（function_enum）"); break;
  }
}