void setup() {
  size(800, 800); // Tamaño de la ventana
  background(0); // Fondo negro

  float[] valores = {25.0, 45.0, 5.0, 15.0, 10.0}; // Ejemplo de valores porcentuales
  drawPieChart(width / 2, height / 2, 300, valores); // Dibujar gráfico de tarta
}

void drawPieChart(float centerX, float centerY, float radius, float[] values) {
  float total = 0;
  for (int i = 0; i < values.length; i++) {
    total += values[i];
  }

  float startAngle = 0; // Ángulo de inicio para el primer segmento
  for (int i = 0; i < values.length; i++) {
    float value = values[i];
    float angle = map(value, 0, total, 0, TWO_PI); // Calcular el ángulo del segmento

    // Elegir un color aleatorio para cada segmento
    color segmentColor = color(random(255), random(255), random(255));
    fill(segmentColor);
    stroke(0); // Contorno negro
    strokeWeight(1);

    // Dibujar el segmento de la tarta
    arc(centerX, centerY, radius * 2, radius * 2, startAngle, startAngle + angle, PIE);

    // Actualizar el ángulo de inicio para el siguiente segmento
    startAngle += angle;
  }
}
