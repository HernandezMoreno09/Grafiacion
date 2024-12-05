import processing.opengl.*;
PImage img;

// Dibujo de una función 3D
float rotX = 0.0, rotY = 0.0;
int lastX, lastY;
float distX = 0.0, distY = 0.0;
// Pasos de función
int steps = 50;
// Escala z
float scaleZ = 200.0;
// Zoom z
float zoomZ = -300.0;
// Tamaño gráfica
float gX = 500.0, gY = 500.0;

void setup() {
  size(500, 500, OPENGL);
  img = loadImage("image.jpg"); // Cargar imagen
  img.filter(GRAY); // Convertir a escala de grises
}

void draw() {
  background(0);
  
  // Activar luces
  lights();

  // Centramos resultado sobre ventana
  translate(gX / 2, gY / 2, zoomZ);

  // Rotaciones según ratón
  rotateY(rotY + distX);
  rotateX(rotX + distY);
  
  // Dibujamos la gráfica y los ejes sin hacer translaciones adicionales
  drawAxes();
  
  // Centramos la gráfica sobre el (0, 0);
  translate(-gX / 2, -gY / 2);
  
  // Hacemos la función que cubra 400 x 400 x scaleZ
  scale(gX, gY, scaleZ);

  // Dibujamos la gráfica
  noStroke(); // Sin contornos para una superficie suave
  dibujarImagen();
}

void drawAxes() {
  // Dibujamos ejes como líneas
  strokeWeight(2); // Aumentar el grosor de las líneas de los ejes
  stroke(255, 0, 0); // Rojo
  line(0, 0, 0, 200, 0, 0); // Eje X
  stroke(0, 255, 0); // Verde
  line(0, 0, 0, 0, 200, 0); // Eje Y
  stroke(0, 0, 255); // Azul
  line(0, 0, 0, 0, 0, 200); // Eje Z
  strokeWeight(1); // Volver al grosor de línea normal
}

void dibujarImagen() {
  float x, y;
  int i = 0, j = 0;
  float in_steps = 1.0 / steps;

  float[][] matriz = new float[steps + 1][steps + 1];

  // Calcular valores de la imagen en escala de grises
  for (j = 0, y = 0.0; j <= steps; j++, y += in_steps) {
    for (i = 0, x = 0.0; i <= steps; i++, x += in_steps) {
      int imgX = int(map(x, 0, 1, 0, img.width - 1));
      int imgY = int(map(y, 0, 1, 0, img.height - 1));
      matriz[i][j] = brightness(img.get(imgX, imgY)) / 255.0; // Normalizar
    }
  }

  // Dibujar la superficie
  for (j = 0, y = 0.0; j < steps; j++, y += in_steps) {
    beginShape(QUAD_STRIP);
    for (i = 0, x = 0.0; i <= steps; i++, x += in_steps) {
      // Color del vértice basado en el valor de z
      float z1 = matriz[i][j];
      float z2 = matriz[i][j + 1];
      int c1 = calcularColor(z1);
      int c2 = calcularColor(z2);

      fill(c1);
      vertex(x, y, z1);
      fill(c2);
      vertex(x, y + in_steps, z2);
    }
    endShape();
  }
}

int calcularColor(float z) {
  float normalizedZ = map(z, 0, 1, 0, 1); // Normalizar z entre 0 y 1
  return lerpColor(color(255, 0, 0), color(255, 255, 0), normalizedZ);
}

void mousePressed() {
  lastX = mouseX;
  lastY = mouseY;
}

void mouseDragged() {
  distX = radians(mouseX - lastX);
  distY = radians(lastY - mouseY);
}

void mouseReleased() {
  rotX += distY;
  rotY += distX;
  distX = distY = 0.0;
}
