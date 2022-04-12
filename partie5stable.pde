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
int totalS=0;
int a = 0; // polynome
int b = 0; 
int c = 0;

//________________________________________

int step2 = 1; // le nombre de pas
int stepSize2 = 20; // la taille des pas
int valeur2 = 1;
int current2 = 0; // le point courant
int compt2 = 1;

// ============ Void Setup =======================

void setup() {
  size(1000, 1000, P3D);
  strokeWeight(0);
// le point courant
 compt2 = 1;
  //noLoop();
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
  pg.fill(255); // white
  pg.textSize(30);
  pg.text(s, 20, 25);
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
        
        // Up
        texture(img);
        c.vertex(0, 0 , 0, 0, 50);
        c.vertex(0, 0 , cubeSide, 50, 50);
        c.vertex(cubeSide, 0 , cubeSide, 50, 0);
        c.vertex(cubeSide, 0 , 0, 0, 0);
        
        // Right
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
        
        // Left
        texture(img);
        c.vertex(0, 0 , 0, 0, 50);
        c.vertex(0, 0 , cubeSide,50, 50);
        c.vertex(0, cubeSide , cubeSide, 50, 0);
        c.vertex(0, cubeSide , 0,0,0);
       
        // roof
        texture(img);
        c.vertex(0, 0 , cubeSide, 0, 50);
        c.vertex(cubeSide, 0 , cubeSide,50,50);
        c.vertex(cubeSide, cubeSide , cubeSide, 50, 50);
        c.vertex(0, cubeSide , cubeSide, 0, 0);
        
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


// ============== Bouton et Polynome =================

void boutonPoly1(int a, int b, int c) {
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
 textSize(20);
 fill(255);
 //text(sommeDesPolynomes(a, b, c, tx), 10, 10);
 text(("f(x)=" + a + "x2+"+ b + "+" + c), 10, 10);
}

void boutonPoly2(int a, int b, int c) {
  // polynome et boutons
 
 // polynome 1
 // boutons haut
 square(950, 10, 20);
 square(880, 10, 20);
 square(800, 10, 20);
 // bouton bas
 square(880, 90, 20);
 square(800, 90, 20);
 square(950, 90, 20);
 
 translate(800, 60, 0);
 textSize(20);
 fill(255);
 //text(sommeDesPolynomes(a, b, c, tx), 10, 10);
 text(("f(x)=" + a + "x2+"+ b + "+" + c), 10, 10);
}

// ================================================

// ============ MouseClicked() ====================
// See Problematic frame for where to report the bug
// could not run the sketch (Target VM failed to initialize).
// For more information, read Help ? troubleshooting.

void mouseClicked() {
  if((mouseX <= 10) && (mouseY <=10)) {
    text(("f(x)=" + a++ + "x2+"+ b + "+" + c), 10, 10);
 } else if ((mouseX <= 80) && (mouseY <=10)){
    text(("f(x)=" + a + "x2+"+ b++ + "+" + c), 10, 10);
  } else if ((mouseX <= 150) && (mouseY <=10)) {
    text(("f(x)=" + a + "x2+"+ b + "+" + c++), 10, 10);
  } else if ((mouseX <= 10) && (mouseY <=90)) {
    text(("f(x)=" + a-- + "x2+"+ b + "+" + c), 10, 10);
  } else if ((mouseX <= 80) && (mouseY <=90)) {
    text(("f(x)=" + a + "x2+"+ b-- + "+" + c), 10, 10);
  } else if ((mouseX <= 150) && (mouseY <=90)) {
    text(("f(x)=" + a + "x2+"+ b + "+" + c--), 10, 10);
  }
  
}

// ================ Draw ==========================

void draw() {
  // On reinitialise les variable pour regler le probleme du no loop
    step = 1; // le nombre de pas
 stepSize = 20; // la taille des pas
 valeur = 1;
 current = 0; // le point courant
 compt = 1; 
 a = 0; // polynome
 b = 0; 
 c = 0;
  step2 = 1; // le nombre de pas
 stepSize2 = 20; // la taille des pas
 valeur2 = 1;
 current2 = 0; 
  background(0); // background noir
  // Variables
 int x = width/2;
 int y = height/2;
 
 // Milieu
 //translate(x, y, 0);
 
 // la lumière
 lights();
 
 //int polyx = 0; 
 
 // boutons droite
 pushMatrix();
 boutonPoly1(a, b, c);
 popMatrix();
 
 // boutons gauche
 pushMatrix();
 boutonPoly2(a, b, c);
 popMatrix();
 
 // vue
 pushMatrix();
 rotateX(0.5);
 
 

 int pyrSize = 82;
 
 // pyramid 2
 pushMatrix();
 
 translate(300, y);
 // Camera/ Animation
 // Bug ca detruit la pyramide en tournant autour du sommet
 // update : Reglé --> source du probleme noLoop() mais aussi l'update des variable
 rotateZ(frameCount * .02);
 shape(pyramid2(pyrSize));
 popMatrix();
 
 // pyramid 1
 pushMatrix();
 translate(700, y);
 // Camera/ Animation
 // Bug ca detruit la pyramide en tournant autour du sommet
 // update : Reglé --> source du probleme noLoop() mais aussi l'update des variable
 rotateZ(frameCount * .02);
 shape(pyramid(pyrSize));
 popMatrix();
 
  // ========= Somme Des diviseurs tests :===========

    println(sommeDesDiviseur(9)); // 13
    println(sommeDesDiviseur(28)); // 56
    println(sommeDesDiviseur(12)); // 25
    println(sommeDesDiviseur(13)); // 14
    println(sommeDesDiviseur(6)); // 12
    
// =================================================
 
  popMatrix();

}
