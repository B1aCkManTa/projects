class bullet{
  float x,y;
  int speed;
  PImage img;
  bullet(float Px, float Py){
    x=Px;
    y=Py;
    speed=4;
    img=loadImage("impulse gernade.png");
  }
  void moveBullet(){
    y-=speed;
  }
  
  void drawBullet(){
    image(img,x,y);
  }
}