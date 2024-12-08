PImage img;

void setup() {
  size(640, 360, P3D); // Configura la ventana de visualización en 3D
  img = loadImage("imagen.png"); // Carga la imagen de la textura
}

void draw() {
  background(0); // Establece el fondo de la pantalla en negro
  translate(width / 2, height / 2); // Mueve el origen al centro de la pantalla

  textureMode(NORMAL); // Configura el modo de coordenadas de textura
  textureWrap(REPEAT); // Establece que la textura se repita si excede el rango

  beginShape(); // Comienza a dibujar la forma poligonal
  texture(img); // Aplica la textura a la forma

  // Define los vértices con las coordenadas de la forma y las coordenadas de la textura
  vertex(-100, -100, 0, 0, 0);  // Vértice 1: posición y coordenadas de textura
  vertex(100, -100, 0, 2, 0);   // Vértice 2: posición y coordenadas de textura (repite la textura)
  vertex(100, 100, 0, 2, 2);    // Vértice 3: posición y coordenadas de textura (repite la textura)
  vertex(-100, 100, 0, 0, 2);   // Vértice 4: posición y coordenadas de textura (repite la textura)

  endShape(); // Finaliza la forma poligonal
}
