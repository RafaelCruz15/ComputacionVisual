void rgb_average(PGraphics pg, PImage photo){
  
  pg.beginDraw();
  pg.background(100);
  int dimension = photo.width * photo.height;
  photo.loadPixels();
  pg.loadPixels();
  for (int i = 0; i < dimension; i++) { 
    
      float r = red(photo.pixels [i]);
      float g = green(photo.pixels[i]);
      float b = blue(photo.pixels[i]);
      float avg_rgb = (r+g+b)/3;
      pg.pixels[i] = color(avg_rgb,avg_rgb,avg_rgb);
  } 
  pg.updatePixels();
  pg.endDraw();
 
}
