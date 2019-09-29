void rgb_average(PGraphics pg, Capture cam){
  
  pg.beginDraw();
  pg.background(100);
  int dimension = cam.width * cam.height;
  cam.loadPixels();
  pg.loadPixels();
  for (int i = 0; i < dimension; i++) { 
    
      float r = red(cam.pixels [i]);
      float g = green(cam.pixels[i]);
      float b = blue(cam.pixels[i]);
      float avg_rgb = (r+g+b)/3;
      pg.pixels[i] = color(avg_rgb,avg_rgb,avg_rgb);
  } 
  pg.updatePixels();
  pg.endDraw();
 
}
