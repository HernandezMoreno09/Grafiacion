PImage img;

void setup() {
  size(600, 600, P3D);
  img = loadImage("imagen.png"); // Asegúrate de que esta imagen esté en la carpeta de datos
}

void draw() {
  background(0);
  translate(width / 2, height / 2);
  
  // Rotaciones basadas en la posición del ratón
  rotateX(radians(360 * mouseX / width));
  rotateY(radians(360 * mouseY / height));
  
  // Modo de textura
  textureMode(NORMAL);
  textureWrap(REPEAT); // Opcional, para repetir la textura si lo prefieres
  
  // Inicia la forma de la tira de triángulos
  beginShape(TRIANGLE_STRIP);
  texture(img);
  
  // Define los vértices con coordenadas de textura
  vertex(-100, -300, 0, 0, 0);
  vertex(100, -300, 0, 1, 0);
  vertex(-100, -100, 0, 0, 1);
  vertex(100, -100, 0, 1, 1);
  vertex(-100, 100, 0, 0, 0);
  vertex(100, 100, 0, 1, 0);
  
  // Finaliza la forma
  endShape();
}
