// ================= Projet D'ulam ==============

// ============ Variables =======================

int SQUARE_TAB = 10; // size du tableau

// Pour la spirale
int step = 1; // le nombre de pas
int stepSize = 20; // la taille des pas
int valeur = 1;
int current = 0; // le point courant
int compt = 1; 

//________________________________________

int pas = 1; // le nombre de pas
int stepS = 20; // la taille des pas
int val = 1;
int cur = 0; // le point courant
int compteur = 1;

// ============ Void Setup =======================

void setup() {
  size(1000, 1000, P3D);
  strokeWeight(0);
  
  noLoop();
}

// ============= Spirale Function 1 ===============

void spiralFunction() {
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
}

// ============= Spirale Function 2 ===============

void spiralFunction2() {
  switch (cur) {
    case 0: 
    if ( pas % val == 0) {
      translate(stepS, 0, -stepS);
    } else {
      translate(stepS, 0, 0);
    }
    break;
    case 1: translate(0, -stepS);
    break;
    case 2: translate(-stepS, 0);
    break;
    case 3: translate(0, stepS);
    break;
  }
  
  if (pas % val == 0) {
    cur = (cur + 1) % 4;
    compteur++;
    if(compteur % 2 == 0) {
      val++;
    }
  }
  pas++;
}

// ============== Somme des diviseur ============== 
// Source : Internet

int sommeDesDiviseur(int n) {
  int somme = 0;
  for (int i = 1; i <= n ; i++) {
    if (n % i == 0) {
      somme += i;
    }
  }
  return somme;
}

// ============== Polynome ======================== 

int sommeDesPolynomes(int a, int b, int c, int x) {
  return (a*x*x) + (b*x) + c;
}


// ============== Bouton Polynome ==================

/*void bouton(int size) {
  square(12
  
}*/


// ============= Cube function =====================

void myBox(int cubeSide){
  // Inspiré du tp6
  
        beginShape(QUADS);
        vertex(0, 0 , 0);
        vertex(cubeSide, 0 , 0);
        vertex(cubeSide, cubeSide , 0);
        vertex(0, cubeSide , 0);
        endShape();
        
        beginShape(QUADS);
        vertex(0, 0 , 0);
        vertex(0, 0 , cubeSide);
        vertex(cubeSide, 0 , cubeSide);
        vertex(cubeSide, 0 , 0);
        
        beginShape(QUADS);
        vertex(cubeSide, 0 , 0);
        vertex(cubeSide, 0 , cubeSide);
        vertex(cubeSide, cubeSide, cubeSide);
        vertex(cubeSide, cubeSide, 0);
        endShape();
        
        beginShape(QUADS);
        vertex(cubeSide, cubeSide , cubeSide);
        vertex(cubeSide, cubeSide , 0);
        vertex(0, cubeSide , 0);
        vertex(0, cubeSide, cubeSide);
        endShape();
        
        beginShape(QUADS);
        vertex(0, 0 , 0);
        vertex(0, 0 , cubeSide);
        vertex(0, cubeSide , cubeSide);
        vertex(0, cubeSide , 0);
        endShape();
        
        beginShape(QUADS);
        vertex(0, 0 , cubeSide);
        vertex(cubeSide, 0 , cubeSide);
        vertex(cubeSide, cubeSide , cubeSide);
        vertex(0, cubeSide , cubeSide);
        endShape();
}


// ============= Pyramide 1 ========================

void pyramid() {
 int spiralSize = 81;
  for(int i = 0; i < spiralSize; i++) {
   //stroke(4000);
   rectMode(CENTER);
   if(sommeDesDiviseur(i) == 2 * i) { 
     fill(16, 52, 166); // Nombre parfait en bleu egyptien
   } else if (sommeDesDiviseur(i) == i + 1) { 
     fill(121, 248, 248); // Nombre premier en bleu cyan
   } else if (sommeDesDiviseur(i) <= 2 * i) { 
     fill(6, 119, 144); // Nombre deficient bleu paon
   } else if (sommeDesDiviseur(i) >= 2 * i) { 
     fill(142, 162, 198); // Nombre abondant bleu charron
   }
   
   //box(20);
   myBox(20);
   translate(-17,8,20);            // On 'surelève' la camera pour dessiner le texte par dessus le bloc
   textSize((spiralSize/8)+1);     // On définie la taille du texte
   fill(0);                        // Couleur = noir
   text(i, 0, 0);                  // On dessine le texte
   translate(17, -8, -20);         // On 'redescend' la camera pour continuer à dessiner les autres blocs
   spiralFunction();
   
  }
}

// ============= Pyramide 2 ========================

void pyramid2() {
 int spiralSize = 81;
  for(int i = 0; i < spiralSize; i++) {
   //stroke(4000);
   rectMode(CENTER);
   if(sommeDesDiviseur(i) == 2 * i) { 
     fill(16, 52, 166); // Nombre parfait en bleu egyptien
   } else if (sommeDesDiviseur(i) == i + 1) { 
     fill(121, 248, 248); // Nombre premier en bleu cyan
   } else if (sommeDesDiviseur(i) <= 2 * i) { 
     fill(6, 119, 144); // Nombre deficient bleu paon
   } else if (sommeDesDiviseur(i) >= 2 * i) { 
     fill(142, 162, 198); // Nombre abondant bleu charron
   }
   
   //box(20);
   myBox(20);
   translate(-17,8,20);            // On 'surelève' la camera pour dessiner le texte par dessus le bloc
   textSize((spiralSize/8)+1);     // On définie la taille du texte
   fill(0);                        // Couleur = noir
   text(i, 0, 0);                  // On dessine le texte
   translate(17, -8, -20);         // On 'redescend' la camera pour continuer à dessiner les autres blocs
   spiralFunction2();
   
  }
}


// ================================================

// ================ Draw ==========================

void draw() {
  
  // Variables
 int x = width/2;
 int y = height/2;
  
 //float px = width/4;
 float py = height/2;
 
 // vue
 rotateX(0.5);

 // la lumière
 lights();
 
 // Camera/ Animation
 //translate(x, y, -SQUARE_TAB);
 //rotateY(frameCount * .2);
 //translate(x, 0, 0);
  
  background(0);
  //float rotation = 0;
 // float random = 10;
 //camera(cos(rotation)*random , 50, sin(rotation)*random, 0, 0, 0, 0, -1, 0);
 //rotation ++;//= PI/3;
 // pyramide 1
 pushMatrix();
 translate(200, y, 0); //z);
 pyramid();
 //rotateY(frameCount * .02);
 //translate(x, 0, 0);
 popMatrix();
 
 // pyramide 2
 //pushMatrix();
 translate(800, py);
 pyramid2();
 ////translate(200, py);
 //popMatrix();
 int a = 0;
 int b = 1;
 int c = 0;
 int polyx = 0; 
 
 sommeDesPolynomes(a, b, c, polyx);
 // ========= Somme Des diviseurs tests :===========

    println(sommeDesDiviseur(9)); // 13
    println(sommeDesDiviseur(28)); // 56
    println(sommeDesDiviseur(12)); // 25
    println(sommeDesDiviseur(13)); // 14
    println(sommeDesDiviseur(6)); // 12
    
// =================================================

    //noLoop();
    endShape();
 
 
}
