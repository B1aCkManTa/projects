class player {
  final int shotDelay=20;
  PVector pos;
  PImage img;
  int timer;
  int life;
  player() {
    pos=new PVector(width/2, height/1.1);
    img=loadImage("sunset.png");
    life=3;
  }
  void updateTimer()
  {
    if (timer != 0 && timer!=shotDelay)
      timer++;
    else
      timer=0;
  }
  void show() {
    updateTimer();
    image(img, pos.x, pos.y);
  }
  void moveUp()
  {
    if (pos.y>img.height/2)
      pos.y-=speed;
  }
  void moveDown()
  {
    if (pos.y<height-img.height/2)
      pos.y+=speed;
  }
  void moveLeft()
  {
    if (pos.x>img.width/2)
      pos.x-=speed;
  }
  void moveRight()
  {
    if (pos.x<width-img.width/2)
      pos.x+=speed;
  }
}