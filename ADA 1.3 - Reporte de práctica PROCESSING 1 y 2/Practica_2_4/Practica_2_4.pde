void setup() {
  size(800, 800); // Tamaño de la ventana
  background(0); // Fondo negro

  float[] valores = {25.0, 45.0, 5.0, 15.0, 10.0}; // Ejemplo de valores porcentuales
  drawBarChart(valores); // Dibujar gráfico de barras
}

void drawBarChart(float[] values) {
  float maxValue = 0;
  for (int i = 0; i < values.length; i++) {
    if (values[i] > maxValue) {
      maxValue = values[i]; // Encontrar el valor máximo
    }
  }

  float barWidth = (float) width / values.length; // Ancho de las barras

  stroke(255); // Contorno blanco para los ejes
  strokeWeight(1);
  line(0, height, width, height); // Eje X
  line(0, 0, 0, height); // Eje Y

  for (int i = 0; i < values.length; i++) {
    float barHeight = map(values[i], 0, maxValue, 0, height); // Calcular la altura de la barra
    float x = i * barWidth; // Posición X de la barra
    float y = height - barHeight; // Posición Y de la barra (invertida)

    // Elegir un color aleatorio para cada barra
    color barColor = color(random(255), random(255), random(255));
    fill(barColor);

    // Dibujar la barra
    rect(x, y, barWidth - 5, barHeight); // Ajuste de -5 para espacio entre barras
  }
}
