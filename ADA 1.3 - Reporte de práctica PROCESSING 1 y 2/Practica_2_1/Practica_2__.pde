void setup() {
  size(800, 400); // Tamaño de la ventana
  background(0); // Fondo blanco

  drawAxes(color(0), 2); // Dibujar ejes cartesianos con grosor 2 y color negro

  drawSine(color(255, 0, 0), 2, width, height); // Dibujar seno en rojo con grosor 2
  drawCosine(color(0, 0, 255), 2, width, height); // Dibujar coseno en azul con grosor 2
}

void drawAxes(color axisColor, float strokeWeight) {
  stroke(axisColor);
  strokeWeight(strokeWeight);

  // Dibujar eje X
  line(0, height / 2, width, height / 2);
  
  // Dibujar eje Y
  line(0, 0, 0, height);
}

void drawSine(color lineColor, float strokeWeight, int w, int h) {
  stroke(lineColor);
  strokeWeight(strokeWeight);
  noFill();

  beginShape();
  for (float x = 0; x < w; x++) {
    float angle = map(x, 0, w, 0, TWO_PI); // Mapear el ancho al rango de 0 a 2*PI
    float y = h / 2 - sin(angle) * (h / 2 - 10); // Calcular coordenada Y para seno
    vertex(x, y);
  }
  endShape();
}

void drawCosine(color lineColor, float strokeWeight, int w, int h) {
  stroke(lineColor);
  strokeWeight(strokeWeight);
  noFill();

  beginShape();
  for (float x = 0; x < w; x++) {
    float angle = map(x, 0, w, 0, TWO_PI); // Mapear el ancho al rango de 0 a 2*PI
    float y = h / 2 - cos(angle) * (h / 2 - 10); // Calcular coordenada Y para coseno
    vertex(x, y);
  }
  endShape();
}
