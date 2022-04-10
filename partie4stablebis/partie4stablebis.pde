// ================= Projet D'ulam ==============
//PImage txt;
//PGraphics pg;

// ============ Variables =======================

// Pour la spirale
int step = 1; // le nombre de pas
int stepSize = 20; // la taille des pas
int valeur = 1;
int current = 0; // le point courant
int compt = 1; 
int totalS;

//________________________________________

int step2 = 1; // le nombre de pas
int stepSize2 = 20; // la taille des pas
int valeur2 = 1;
int current2 = 0; // le point courant
int compt2 = 1;
/*color couleurCyan =
color couleur*/

// ============ Void Setup =======================

void setup() {
  size(1000, 1000, P3D);
  strokeWeight(0);
  
  noLoop();
}

// ============== Somme des diviseur ============== 

int sommeDesDiviseur(int n) {
  int somme = 0;
  for (int i = 1; i <= n ; i++) {
    if (n % i == 0) {
      somme += i;
    }
  }
  return somme;
}

// ============== Text =============================

PGraphics textImager(int s) {
  
  PGraphics pg = createGraphics(50, 50);
  pg.beginDraw();
  if(sommeDesDiviseur(s) == 2 * s) { 
     
     pg.background(16,52,166);//fill(16, 52, 166); // Nombre parfait en bleu egyptien
     
   } else if (sommeDesDiviseur(s) == s + 1) {
     
     pg.background(121,248,248);//fill(121, 248, 248); // Nombre premier en bleu cyan
     
   } else if (sommeDesDiviseur(s) <= 2 * s) {
     
     pg.background(6, 119, 144);//fill(6, 119, 144); // Nombre deficient bleu paon
     
   } else if (sommeDesDiviseur(s) >= 2 * s) { 
     
     pg.background(142, 162, 198);//fill(142, 162, 198); // Nombre abondant bleu charron
     
   }
  
  //pg.background(s);
  pg.textAlign(CENTER);
  pg.fill(255);
  pg.textSize(20);
  pg.text(s, 25, 25);
  pg.endDraw();
  return pg;

}

// ============= Cube function =====================

PShape myBox(int cubeSide, PImage img){
  // Inspiré du tp6
  PShape c = createShape();
        // floor
   c.beginShape(QUADS);
        c.texture(img);
        c.vertex(0, 0 , 0, 0, 50);
        c.vertex(cubeSide, 0 , 0, 50, 50);
        c.vertex(cubeSide, cubeSide , 0, 50, 0);
        c.vertex(0, cubeSide , 0, 0, 0);
        
        //up
        texture(img);
        c.vertex(0, 0 , 0, 0, 50);
        c.vertex(0, 0 , cubeSide, 50, 50);
        c.vertex(cubeSide, 0 , cubeSide, 50, 0);
        c.vertex(cubeSide, 0 , 0, 0, 0);
        
        //right
        texture(img);
        c.vertex(cubeSide, 0 , 0, 0, 50);
        c.vertex(cubeSide, 0 , cubeSide, 50, 50);
        c.vertex(cubeSide, cubeSide, cubeSide, 50, 0);
        c.vertex(cubeSide, cubeSide, 0, 0, 0);
        
        // floor
        texture(img);
        c.vertex(cubeSide, cubeSide , cubeSide, 0, 50);
        c.vertex(cubeSide, cubeSide , 0, 50, 50);
        c.vertex(0, cubeSide , 0, 50, 0);
        c.vertex(0, cubeSide, cubeSide, 0, 0);
        
        //left
        texture(img);
        c.vertex(0, 0 , 0);
        c.vertex(0, 0 , cubeSide);
        c.vertex(0, cubeSide , cubeSide);
        c.vertex(0, cubeSide , 0);
       
        // roof
        texture(img);
        c.vertex(0, 0 , cubeSide);
        c.vertex(cubeSide, 0 , cubeSide);
        c.vertex(cubeSide, cubeSide , cubeSide);
        c.vertex(0, cubeSide , cubeSide);
        
    c.endShape();
    return c;
}

// ============= Pyramide 1 ========================

PShape pyramid(int spiralSize) {
  PShape pyr = createShape();
  pyr.beginShape();

  for(int i = 1; i < spiralSize; i++) {

   shape(myBox(20, textImager(i)));
   shape(spiralFunction());
   pyr.endShape();
  }
  return pyr;
}

// ============= Pyramide 2 ========================

PShape pyramid2(int spiralSize) {
  
  PShape pyr = createShape();
  pyr.beginShape();

  for(int i = 1; i < spiralSize; i++) {

   shape(myBox(20, textImager(i)));
   shape(spiralFunction2());
   pyr.endShape();
  }
  return pyr;
}

// ============= Spirale Function 1 ===============

PShape spiralFunction() {
  PShape spiral = createShape();
  spiral.beginShape();
  switch (current) {
    case 0: 
    if ( step % valeur == 0) {
      translate(stepSize, 0, -stepSize);
    } else {
      translate(stepSize, 0, 0);
    }
    break;
    case 1: translate(0, -stepSize);
    break;
    case 2: translate(-stepSize, 0);
    break;
    case 3: translate(0, stepSize);
    break;
  }
  
  if (step % valeur == 0) {
    current = (current + 1) % 4;
    compt++;
    if(compt % 2 == 0) {
      valeur++;
    }
  }
  step++;
  if( step > totalS) { return spiral; }
  return spiral;
}

// ============= Spirale Function 2 ===============

PShape spiralFunction2() {
  PShape spiral = createShape();
  spiral.beginShape();
  switch (current2) {
    case 0: 
    if ( step2 % valeur2 == 0) {
      translate(stepSize2, 0, -stepSize2);
    } else {
      translate(stepSize2, 0, 0);
    }
    break;
    case 1: translate(0, -stepSize2);
    break;
    case 2: translate(-stepSize2, 0);
    break;
    case 3: translate(0, stepSize2);
    break;
  }
  
  if (step2 % valeur2 == 0) {
    current2 = (current2 + 1) % 4;
    compt2++;
    if(compt2 % 2 == 0) {
      valeur2++;
    }
  }
  step2++;
  if( step2 > totalS) { return spiral; }
  return spiral;
}

// ================================================

// ================ Draw ==========================

void draw() {
  background(0);
  // Variables
 int x = width/2;
 int y = height/2;
  
 //translate(x, y, 0);
 
 // vue
 rotateX(0.5);

 // la lumière
 lights();
 
 // Camera/ Animation
 //rotateZ(frameCount * .02);

 int pyrSize = 82;
 pushMatrix();
 translate(300, y);
 shape(pyramid2(pyrSize));
 popMatrix();
 
 pushMatrix();
 translate(700, y);
 shape(pyramid(pyrSize));
 popMatrix();
 
  // ========= Somme Des diviseurs tests :===========

    println(sommeDesDiviseur(9)); // 13
    println(sommeDesDiviseur(28)); // 56
    println(sommeDesDiviseur(12)); // 25
    println(sommeDesDiviseur(13)); // 14
    println(sommeDesDiviseur(6)); // 12
    
// =================================================
 
 
}
