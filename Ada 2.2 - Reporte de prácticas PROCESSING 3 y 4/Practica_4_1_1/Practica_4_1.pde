void setup() {
  size(800, 800); // Tamaño de la ventana
  background(0); // Fondo negro
  strokeWeight(2);

  drawAxes(); // Dibujar ejes cartesianos
  drawSinCos(); // Dibujar funciones seno y coseno
}

void drawAxes() {
  stroke(255); // Color blanco para los ejes
  line(0, height / 2, width, height / 2); // Eje X
  line(0, 0, 0, height); // Eje Y
}

void drawSinCos() {
  stroke(255, 0, 0); // Color rojo para seno
  noFill();
  beginShape();
  for (float x = 0; x < width; x++) {
    float angle = map(x, 0, width, 0, TWO_PI); // Cambiar de [0, width] a [0, 2*PI]
    float y = map(sin(angle), -1, 1, height, 0); // Cambiar de [-1, 1] a [height, 0]
    vertex(x, y);
  }
  endShape();

  stroke(0, 0, 255); // Color azul para coseno
  beginShape();
  for (float x = 0; x < width; x++) {
    float angle = map(x, 0, width, 0, TWO_PI); // Cambiar de [0, width] a [0, 2*PI]
    float y = map(cos(angle), -1, 1, height, 0); // Cambiar de [-1, 1] a [height, 0]
    vertex(x, y);
  }
  endShape();
}
