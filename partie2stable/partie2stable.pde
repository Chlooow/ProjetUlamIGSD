// ================= Projet D'ulam ==============

// ============ Variables =======================

//int SQUARE_TAB = 10; // size du tableau
int step = 1;
int stepSize = 50;
int valeur = 1;
int current = 0;
int compt = 1;
int totalStep;
int x;
int y;
int px;
int py;

// ============ Void Setup =======================

void setup() {
  size(1000, 1000, P3D);
  strokeWeight(2);
  //noLoop();
}

// ============= Spirale Function  ===============

void spiralUlam(int sizes) {
  for(int i = 0; i < sizes; i++) {
   stroke(4000);
   //rectMode(CENTER);
   if(sommeDesDiviseur(i) == 2 * i) { fill(16, 52, 166); } // Nombre parfait en bleu egyptien
        else if(sommeDesDiviseur(i) == i + 1) { fill(121, 248, 248); } // Nombre premier en bleu cyan
        else if(sommeDesDiviseur(i) <= 2 * i) { fill(6, 119, 144);  } // Nombre deficient bleu paon
        else if(sommeDesDiviseur(i) >= 2 * i) { fill(142, 162, 198); } // Nombre abondant bleu charron
        //square(x,y,45);
        box(40);
        fill(255);
        text(i, x, y);

  
  // switch for boxes
  switch (current) {
    case 0: translate(stepSize, 0);
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
  if (step > totalStep) { noLoop(); }
  }
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

// =================================================

// ================ Draw ==========================

void draw() {
  background(0);
  //translate(500, 100, -100);
 
  
 int x = width/2;
 int y = height/2;
 textSize(30);
 textAlign(CENTER,CENTER);
 
 int si = 81;
 
 // Camera
 // bug
 
 /*float rotation = 0;
 float random = -150;
 float xpos = cos(rotation);
 float zpos = sin(rotation);
 camera(xpos, -100, zpos , 0, 0, 0, 0, -1, 0);
 rotation += PI/200;//PI/200;*/
 
 
 //rotateZ(frameCount * .02);
 translate (x, y, 0);
 pushMatrix();
 spiralUlam(si);
 popMatrix();
 
 // ========= Somme Des diviseurs tests :===========

    println(sommeDesDiviseur(9)); // 13
    println(sommeDesDiviseur(28)); // 56
    println(sommeDesDiviseur(12)); // 25
    println(sommeDesDiviseur(13)); // 14
    
// =================================================

}
  
