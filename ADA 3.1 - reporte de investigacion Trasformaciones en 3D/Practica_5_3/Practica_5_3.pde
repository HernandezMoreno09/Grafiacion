int numPlanetas = 4;
float[] distancias;  // Distancias de los planetas al "sol"
float[] velocidades; // Velocidades orbitales
float[] angulos;     // Ángulos actuales de los planetas
float[] radios;      // Tamaños de los planetas
color[] colores;     // Colores de los planetas

// Variables específicas para el sol
float distanciaSol = 50;  // Distancia del sol al centro
float velocidadSol = 0.01; // Velocidad orbital del sol
float anguloSol = 0;       // Ángulo actual del sol

// Variables específicas para las lunas
float[] distanciasLunas = {20, 35}; // Distancias de las lunas al planeta
float[] velocidadesLunas = {0.05, 0.03}; // Velocidades orbitales de las lunas
float[] angulosLunas; // Ángulos actuales de las lunas

void setup() {
  size(600, 600);
  distancias = new float[] {70, 120, 200, 300};  // Distancias al "sol"
  velocidades = new float[] {0.02, 0.015, 0.01, 0.005}; // Velocidades orbitales
  angulos = new float[numPlanetas];
  radios = new float[] {10, 15, 20, 25}; // Tamaños de los planetas
  colores = new color[] {
    color(255, 255, 0), // Amarillo
    color(100, 255, 100), // Verde claro
    color(0, 255, 255),   // Azul
    color(50, 150, 50)    // Verde oscuro
  };
  angulosLunas = new float[distanciasLunas.length]; // Inicializar ángulos para las lunas
}

void draw() {
  background(0);
  
  // Dibujar órbita del "sol"
  noFill();
  stroke(255, 100);
  ellipse(width / 2, height / 2, distanciaSol * 2, distanciaSol * 2);

  // Calcular posición del "sol"
  float solX = width / 2 + cos(anguloSol) * distanciaSol;
  float solY = height / 2 + sin(anguloSol) * distanciaSol;

  // Dibujar el "sol"
  fill(255, 204, 0);
  noStroke();
  ellipse(solX, solY, 50, 50); // Sol en su nueva posición

  // Actualizar ángulo del sol para movimiento
  anguloSol += velocidadSol;

  for (int i = 0; i < numPlanetas; i++) {
    // Dibujar órbita
    noFill();
    stroke(255, 100);
    ellipse(solX, solY, distancias[i] * 2, distancias[i] * 2);

    // Calcular posición del planeta
    float x = solX + cos(angulos[i]) * distancias[i];
    float y = solY + sin(angulos[i]) * distancias[i];
    
    // Dibujar planeta
    fill(colores[i]);
    noStroke();
    ellipse(x, y, radios[i], radios[i]);

    // Actualizar ángulo para movimiento
    angulos[i] += velocidades[i];
    
    // Dibujar lunas si el planeta tiene
    if (i == 2) { // Por ejemplo, el tercer planeta tiene lunas
      drawLunas(x, y, distanciasLunas.length); // Dibujar lunas alrededor del planeta
    }
  }
}

// Dibujar lunas alrededor de un planeta
void drawLunas(float planetaX, float planetaY, int numLunas) {
  for (int i = 0; i < numLunas; i++) {
    // Dibujar órbita de la luna
    noFill();
    stroke(150);
    ellipse(planetaX, planetaY, distanciasLunas[i] * 2, distanciasLunas[i] * 2);
    
    // Calcular posición de la luna
    float lunaX = planetaX + cos(angulosLunas[i]) * distanciasLunas[i];
    float lunaY = planetaY + sin(angulosLunas[i]) * distanciasLunas[i];
    
    // Dibujar luna
    fill(200);
    noStroke();
    ellipse(lunaX, lunaY, 7, 7);
    
    // Actualizar ángulo para movimiento
    angulosLunas[i] += velocidadesLunas[i];
  }
}
