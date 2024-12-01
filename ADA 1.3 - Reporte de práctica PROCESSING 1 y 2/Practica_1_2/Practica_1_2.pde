void setup() {
  size(500, 500); // Tamaño de la ventana
  gradient(0, 0, 255, 255, 0, 0); // Gradiente de azul a rojo
}

void gradient(int rStart, int gStart, int bStart, int rEnd, int gEnd, int bEnd) {
  for (int y = 0; y < height; y++) {
    float t = map(y, 0, height - 1, 0, 1); // Interpolación lineal entre 0 y 1

    // Calcular componentes interpoladas del color
    int r = int(lerp(rStart, rEnd, t));
    int g = int(lerp(gStart, gEnd, t));
    int b = int(lerp(bStart, bEnd, t));

    stroke(r, g, b); // Color de la línea
    line(0, y, width, y); // Dibujar línea horizontal
  }
}
