PGraphics pg;
PImage txtImg;

void setup() {
  size(1000, 1000, P3D);
  strokeWeight(0);
  //background(255);
  pg = createGraphics(300,300,P2D);
  //noLoop();
}


// ============== Polynome ======================== 

int sommeDesPolynomes(int a, int b, int c, int x) {
  return (a*x*x) + (b*x);
}

PImage textImager(String s, PGraphics pg) {
  pg.beginDraw();
  pg.background(255);
  pg.textAlign(CENTER);
  pg.fill(0);
  pg.textSize(128);
  pg.text(s, 150, 180);
  pg.endDraw();
  return pg.get();
}

void textureCube(PImage img) {
  // draw six faces
  textureFace(img, 0, 0, 0);
  textureFace(img, 0,-HALF_PI, 0);
  textureFace(img, 0, HALF_PI, 0);
  textureFace(img, 0, PI, 0);
  textureFace(img, -HALF_PI, 0, 0);
  textureFace(img,  HALF_PI, 0, 0);
}


void textureFace(PImage img, float rx, float ry, float rz){
  // rotate then draw a face
  pushMatrix();
    rotateX(rx);
    rotateY(ry);
    rotateZ(rz);
    beginShape();
      texture( img );
      vertex(-100, -100,  100, 0, 0);
      vertex( 100, -100,  100, 300, 0);
      vertex( 100,  100,  100, 300, 300);
      vertex(-100,  100,  100, 0, 300);
      vertex(-100, -100,  100, 0, 0);
    endShape();
  popMatrix();
}


void boutonPoly1(int a, int b, int c, int tx) {
  // polynome et boutons
 
 // polynome 1
 // boutons haut
 square(10, 10, 20);
 square(80, 10, 20);
 square(150, 10, 20);
 // bouton bas
 square(10, 90, 20);
 square(80, 90, 20);
 square(150, 90, 20);
  
 translate(10, 60, 0);
 textSize(40);
 fill(255);
 text(sommeDesPolynomes(a, b, c, tx), 10, 10);
}

void boutonPoly2(int a, int b, int c, int tx) {
  // polynome et boutons
 
 // polynome 1
 // boutons haut
 square(950, 10, 20);
 square(880, 10, 20);
 square(800, 10, 20);
 // bouton bas
 square(950, 90, 20);
 square(880, 90, 20);
 square(800, 90, 20);
 
 translate(900, 60, 0);
 textSize(40);
 fill(255);
 text(sommeDesPolynomes(a, b, c, tx), 10, 10);
}

void draw() {
  background(128);
   // draw cube
  
 int a = 0;
 int b = 1;
 int c = 0;
 int polyx = 0; 
 
 ////int x = 0;
 //value1 = square(10, 10, 20);
 
  pushMatrix();
  boutonPoly1(a, b, c, polyx);
  popMatrix();
  
  pushMatrix();
  boutonPoly2(a, b, c, polyx);
  popMatrix();
 
  int x = width/2;
  int y = height/2;
   
   translate(x, y);
   /*rotateY(map(mouseX, 0, width, -PI, PI));
   rotateZ(map(mouseY, 0, height, 0, TWO_PI));*/
   
   //int Square_size = 80;
   
   // Camera/ Animation
   //translate(x, y, -Square_size);
   rotateY(frameCount * .02);

   pushStyle();
   noFill();
   stroke(0,255,0);
   
   // make an image with clock text
   String s = "" + millis() / 1000;
   txtImg = textImager(s, pg);
   // draw the image on a cube
   textureCube(txtImg);
    
  popStyle();
}
