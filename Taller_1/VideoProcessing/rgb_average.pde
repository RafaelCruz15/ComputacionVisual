void rgb_average(PGraphics pg, PImage mS){
  
  pg.beginDraw();
  pg.background(100);
  int dimension = mS.width * mS.height;
  mS.loadPixels();
  pg.loadPixels();
  for (int i = 0; i < dimension; i++) { 
    
      float r = red(mS.pixels [i]);
      float g = green(mS.pixels[i]);
      float b = blue(mS.pixels[i]);
      float avg_rgb = (r+g+b)/3;
      pg.pixels[i] = color(avg_rgb,avg_rgb,avg_rgb);
  } 
  
  println("rgb_average: ", frameRate);
  
  pg.updatePixels();
  pg.endDraw();
 
}
