int Square_size = 80;

void setup() {
  size(1000, 1000, P3D);
}

void cube() {
  
  background(0);
  int x = width/2;
  int y = height/2;
  lights();
  
  translate(x, y, -Square_size);
  rotateY (frameCount * .02);
  //rotateX (frameCount * .01);
  //rotateZ (frameCount * .01);
  translate(x, 0, 0);
  //rotate(1.0);
  for(int i = -Square_size; i <= Square_size; i+=20) {
    if(sommeDesDiviseur(i) == 2 * i) { 
     fill(16, 52, 166); // Nombre parfait en bleu egyptien
    }
    for(int j = -Square_size; j <= Square_size; j+=20) {
      for(int k = -Square_size; k <= Square_size; k+=20) {
        
        pushMatrix();
        translate(i, j, k);
        box(80);
        popMatrix();
      }
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
  cube();
  endShape();
}
