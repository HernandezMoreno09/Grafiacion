void setup() {
  size(800, 800); // Tamaño de la ventana
  background(0); // Fondo negro

  drawPolygon(width / 2, height / 2, 200, 6, color(255, 255, 255)); // Dibujar un hexágono blanco
}

void drawPolygon(float centerX, float centerY, float radius, int sides, color lineColor) {
  if (sides < 3) return; // Un polígono debe tener al menos 3 lados

  stroke(lineColor); // Establecer el color del borde
  strokeWeight(2); // Grosor de la línea
  noFill(); // Sin relleno

  beginShape();
  for (int i = 0; i < sides; i++) {
    float angle = TWO_PI / sides * i; // Calcular el ángulo para cada vértice
    float x = centerX + cos(angle) * radius; // Coordenada X del vértice
    float y = centerY + sin(angle) * radius; // Coordenada Y del vértice
    vertex(x, y); // Agregar vértice a la forma
  }
  endShape(CLOSE); // Cerrar el polígono
}
