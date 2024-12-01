void setup() {
  size(500, 500); // Tamaño de la ventana
  background(0); // Color de fondo negro
  stroke(255); // Color de las líneas blanco
  poligon(250, 250, 100, 5); // Dibujar un polígono centrado en (250, 250), con radio 100 y 6 lados
}

void poligon(int centerX, int centerY, int radius, int sides) {
  

  float angleStep = TWO_PI / sides; // Ángulo entre vértices

  float startX = centerX + radius * cos(0); // Coordenada x del primer vértice
  float startY = centerY + radius * sin(0); // Coordenada y del primer vértice
  float prevX = startX;
  float prevY = startY;

  for (int i = 1; i <= sides; i++) {
    float currentAngle = i * angleStep;
    float currentX = centerX + radius * cos(currentAngle);
    float currentY = centerY + radius * sin(currentAngle);

    line(prevX, prevY, currentX, currentY); // Traza la línea entre los vértices

    prevX = currentX;
    prevY = currentY;
  }

  // Cerrar el polígono
  line(prevX, prevY, startX, startY);
}
