class player{
  float x,y;
  PImage img;
  int life=3;
  player(){
    x=width/2;
    y=height/2;
    img=loadImage("sunset.png");
  }
  void drawPlayer(){
   image(img,x,y);
  }
  
  void updatePlayer(int xDelta,int yDelta){
    x=x+xDelta;
    y=y+yDelta;
    if(offScreen(x,y)){
      x=x-xDelta;
      y=y-yDelta;
    }
  }
  
  boolean offScreen(float x,float y){
    if(x<0 || x>width-50 || y<0 || y>height -55)
    return true;
    return false;
  }
  
  void foundSpray(float Sx,float Sy){
    float d=sqrt((x-Sx)*(x-Sx)+(y-Sy)*(y-Sy));
    if(d<=5){
    }
  }
  float getx(){
    return x;
  }
  float gety(){
    return y;
  }
}