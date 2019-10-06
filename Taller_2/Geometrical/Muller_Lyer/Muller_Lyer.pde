//https://en.wikipedia.org/wiki/M%C3%BCller-Lyer_illusion
//https://www.openprocessing.org/sketch/520420
void setup(){
  size(600,600);
  strokeWeight(8);
  background(255);

}
void draw(){
  if(mousePressed){
        background(255);
    line( 150,450, 450,450 );
    line( 150,150, 450,150 );
    pushStyle();
    stroke(255,0,0);
    line(150,100,150,490);
    line(450,100,450,490);
    popStyle();

    
  }else{
    background(255);
  line( 150,150, 450,150 );
  line( 450,150, 525,75 );
  line( 450,150, 525,225 );
  line( 75,75, 150,150 );
  line( 75,225, 150,150 );
  
  line( 150,450, 450,450 );
  line( 375,375, 450,450 );
  line( 375,525, 450,450 );
  line( 150,450, 225,375 );
  line( 150,450, 225,525 );

  }
}
