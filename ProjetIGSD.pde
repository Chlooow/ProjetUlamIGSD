/* Pojet Ulam */

//int pixel = 10; 
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


void setup() {
  size(1000, 1000, P3D);
  strokeWeight(2);
  background(0);
  noLoop();
}

// afficher le tableau 
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

void tab2(int nb) {
  box(10);
  for(int i = 0; i < nb; i++){
    switch (current) {
    case 0: x += stepSize;
    break;
    case 1: y -= stepSize;
    break;
    case 2: x -= stepSize;
    break;
    case 3: y += stepSize;
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
  rect(j*80, i*80, 80, 80);
  }
 
}




/* spirale */

/*int x = width/2;
int y = height/2;*/

void draw() {
 /*int k = 0;
 tab(k);*/
 
 /* deplacements */
  
  
  
  //if(step > totalDir){
  //  noLoop();
  //}
    //vertex(0, 0, 0);
    // Somme Des diviseurs tests :
    println(sommeDesDiviseur(9)); // 13
    println(sommeDesDiviseur(28)); // 56
    println(sommeDesDiviseur(12)); // 25
    println(sommeDesDiviseur(13)); // 14
    // Nombre parfait tests :
    endShape();
}



// Somme des Diviseurs
int sommeDesDiviseur(int n) {
  int somme = 0;
  for (int i = 1; i <= n ; i++) {
    if (n % i == 0) {
      somme += i;
    }
  }
  return somme;
}
