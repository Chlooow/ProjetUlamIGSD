// ================= Projet D'ulam ==============

// ============ Variables =======================

int SQUARE_TAB = 10; // size du tableau
int step = 1;
int stepSize = 50;
int valeur = 1;
int current = 0;
int compt = 1;
int totalDir;
int x;
int y;
int px;
int py;


// ============ Void Setup =======================

void setup() {
  size(1000, 1000, P3D);
  strokeWeight(2);
  background(0);
  noLoop();
}


// ================ Draw ==========================

void draw() {
  
 // =============== Tableau sans Spiral ===========

 /*int k = 0;
 tab(k);*/
 
 // =================== Spiral ====================
 // inspiré de Codin Train (Youtube)
 // variable
 int x = width/2;
 int y = height/2;
 
 
 for(int i = 0; i < 361; i++) {
   stroke(4000);
   rectMode(CENTER);
   if(sommeDesDiviseur(i) == 2 * i) { fill(16, 52, 166); } // Nombre parfait en bleu egyptien
        else if(sommeDesDiviseur(i) == i + 1) { fill(121, 248, 248); } // Nombre premier en bleu cyan
        else if(sommeDesDiviseur(i) <= 2 * i) { fill(6, 119, 144);  } // Nombre deficient bleu paon
        else if(sommeDesDiviseur(i) >= 2 * i) { fill(142, 162, 198); } // Nombre abondant bleu charron
        //square(x,y,45);
        box(45);
        
   // switch for square
        
   /*switch (current) {
    case 0: x += stepSize;
    break;
    case 1: y -= stepSize;
    break;
    case 2: x -= stepSize;
    break;
    case 3: y += stepSize;
    break;
  }*/
  
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
  
}

  //if(step > totalDir){
  //  noLoop();
  //}


// ========= Somme Des diviseurs tests :===========

    println(sommeDesDiviseur(9)); // 13
    println(sommeDesDiviseur(28)); // 56
    println(sommeDesDiviseur(12)); // 25
    println(sommeDesDiviseur(13)); // 14
    
// =================================================

    endShape();
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

// ============= Tableau sans spirales =============

//void tab(int n){
    
//    for(int i = 0; i < SQUARE_TAB; i++) {
//      for(int j = 0; j < SQUARE_TAB; j++) {
//        n++;
//        if(sommeDesDiviseur(n) == 2 * n) { fill(16, 52, 166); } // Nombre parfait en bleu egyptien
//        else if(sommeDesDiviseur(n) == n + 1) { fill(121, 248, 248); } // Nombre premier en bleu cyan
//        else if(sommeDesDiviseur(n) <= 2 * n) { fill(6, 119, 144);  } // Nombre deficient bleu paon
//        else if(sommeDesDiviseur(n) >= 2 * n) { fill(142, 162, 198); } // Nombre abondant bleu charron
        
//        System.out.println( n + " :" + sommeDesDiviseur(n));
//        rect(j*80, i*80, 80, 80);
//    }
//  }
//}
// =================================================
