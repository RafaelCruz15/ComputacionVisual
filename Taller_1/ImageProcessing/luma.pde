void luma(PGraphics pg, PImage photo){

  pg.beginDraw();
  
  pg.background(100);
  int dimension = photo.width * photo.height;
  photo.loadPixels();
  pg.loadPixels();
  for (int i = 0; i < dimension; i++) { 
    
      float r = red(photo.pixels [i]);
      float g = green(photo.pixels[i]);
      float b = blue(photo.pixels[i]);
      float luma = 0.2126*r + 0.7152*g + 0.0722*b;
    
      pg.pixels[i] = color(luma,luma,luma);
  } 
  pg.updatePixels(); 
  pg.endDraw();
  
}
