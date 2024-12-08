PImage img;

void setup() {
  size(640, 360, P3D);
  img = loadImage("imagen.jpg"); // Carga la imagen de la textura
}

void draw() {
  background(0);
  translate(width / 2, height / 2); // Mueve el origen al centro de la pantalla

  textureMode(NORMAL); // Establece el modo de coordenadas de la textura

  // Comienza a dibujar la forma poligonal
  beginShape();
  texture(img); // Aplica la textura a la forma

  // Define los vértices con las coordenadas de la forma y las coordenadas de la textura
  vertex(-100, -100, 0, 0, 0); // Vértice 1: posición (x, y, z) y coordenadas de textura (u, v)
  vertex(100, -100, 0, 1, 0);  // Vértice 2: posición y coordenadas de textura
  vertex(100, 100, 0, 1, 1);   // Vértice 3: posición y coordenadas de textura
  vertex(-100, 100, 0, 0, 1);  // Vértice 4: posición y coordenadas de textura

  endShape(); // Finaliza la forma poligonal
}
