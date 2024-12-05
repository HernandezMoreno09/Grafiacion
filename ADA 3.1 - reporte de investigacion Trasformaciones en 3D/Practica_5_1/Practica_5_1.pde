int numBolas = 20; // Número de bolas
float[] x, y;      // Posiciones
float[] vx, vy;    // Velocidades
float diametroBola = 20;

void setup() {
  size(600, 400);
  x = new float[numBolas];
  y = new float[numBolas];
  vx = new float[numBolas];
  vy = new float[numBolas];
  
  // Inicializar posiciones y velocidades
  for (int i = 0; i < numBolas; i++) {
    x[i] = random(diametroBola, width - diametroBola);
    y[i] = random(diametroBola, height - diametroBola);
    vx[i] = velocidadAleatoria();
    vy[i] = velocidadAleatoria();
  }
}

void draw() {
  // Fondo semitransparente para crear el efecto de rastro
  fill(0, 20); // Negro con baja opacidad
  rect(0, 0, width, height); 
  
  noStroke();
  fill(255, 200); // Color de las bolas (blanco semitransparente)
  
  for (int i = 0; i < numBolas; i++) {
    // Dibujar la bola
    ellipse(x[i], y[i], diametroBola, diametroBola);
    
    // Actualizar posición
    x[i] += vx[i];
    y[i] += vy[i];
    
    // Rebotar en los bordes
    if (x[i] < diametroBola / 2 || x[i] > width - diametroBola / 2) {
      vx[i] *= -1;
    }
    if (y[i] < diametroBola / 2 || y[i] > height - diametroBola / 2) {
      vy[i] *= -1;
    }
  }
}

// Función para generar velocidades aleatorias entre -4 y +4, excluyendo 0
float velocidadAleatoria() {
  float v;
  do {
    v = random(-4, 4);
  } while (v == 0);
  return v;
}
