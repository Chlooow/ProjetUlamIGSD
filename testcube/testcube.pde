float x,y,z;
int SQUARE_TAB = 10;

void setup() {
  size(1000,1000,P3D);
  x = width/2;
  y = height/2;
  z = 0;
  noLoop();
}

void tab(int n){
    
    for(int i = 0; i < SQUARE_TAB; i++) {
      for(int j = 0; j < SQUARE_TAB; j++) {
        n++;
        if(sommeDesDiviseur(n) == 2 * n) { fill(16, 52, 166); } // Nombre parfait en bleu egyptien
        else if(sommeDesDiviseur(n) == n + 1) { fill(121, 248, 248); } // Nombre premier en bleu cyan
        else if(sommeDesDiviseur(n) <= 2 * n) { fill(6, 119, 144);  } // Nombre deficient bleu paon
        else if(sommeDesDiviseur(n) >= 2 * n) { fill(142, 162, 198); } // Nombre abondant bleu charron
        
        System.out.println( n + " :" + sommeDesDiviseur(n));
        rect(j*80, i*80, 80, 80);
    }
  }
}


int sommeDesDiviseur(int n) {
  int somme = 0;
  for (int i = 1; i <= n ; i++) {
    if (n % i == 0) {
      somme += i;
    }
  }
  return somme;
}



void draw() {
  int k = 4;
  tab(k);

}
