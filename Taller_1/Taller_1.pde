PGraphics pg,pg1,pg2;
PImage photo;


void setup() {
  size(800, 1280);
  photo = loadImage("Ana.jpg");
  photo.resize(350,200);
  pg = createGraphics(photo.width, photo.height);
  pg1 = createGraphics(photo.width, photo.height);
  pg2 = createGraphics(photo.width, photo.height);

  
}

void draw() {
  
  
  rgb_average(pg,photo);
  luma(pg1,photo);
  blur(pg2,photo);
  
  image(photo, 10, 15);
  image(pg,10,215);
  image(pg1,10,415);
  image(pg2,375,15);

}
