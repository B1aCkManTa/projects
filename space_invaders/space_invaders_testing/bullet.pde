class bullet {
  PVector pos;
  final double speed=5;
  PImage img;
  boolean isFriendly;
  bullet(float Px, float Py, boolean isFriendly) {
    pos=new PVector(Px, Py);
    img=loadImage("impulse gernade.png");
    this.isFriendly=isFriendly;
  }
  void moveBullet() {
    pos.y+=speed*(isFriendly? -1:1);
  }
  void drawBullet() {
    image(img, pos.x, pos.y);
  }
}