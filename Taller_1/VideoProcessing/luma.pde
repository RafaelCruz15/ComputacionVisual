void luma(PGraphics pg, PImage mS){

  pg.beginDraw();
  
  pg.background(100);
  int dimension = mS.width * mS.height;
  mS.loadPixels();
  pg.loadPixels();
  for (int i = 0; i < dimension; i++) { 
    
      float r = red(mS.pixels [i]);
      float g = green(mS.pixels[i]);
      float b = blue(mS.pixels[i]);
      float luma = 0.2126*r + 0.7152*g + 0.0722*b;
    
      pg.pixels[i] = color(luma,luma,luma);
  } 
  
  println("luma: ", frameRate);
  
  pg.updatePixels(); 
  pg.endDraw();
  
  
}
