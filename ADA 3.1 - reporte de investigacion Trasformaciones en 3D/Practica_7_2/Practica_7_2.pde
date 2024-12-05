import processing.opengl.*;
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
}

float funcion(float x, float y) {
  return x*x*x + y*y*y;
}

void draw() {
  background(0);
  
  // Activar luces
  lights();

  // Centramos resultado sobre ventana
  translate(gX/2, gY/2, zoomZ);

  // Rotaciones según ratón
  rotateY(rotY + distX);
  rotateX(rotX + distY);
  
  // Centramos la gráfica sobre el (0, 0);
  translate(-gX/2, -gY/2);

  // Hacemos la función que cubra 400 x 400 x scaleZ
  scale(gX, gY, scaleZ);

  // Dibujamos la gráfica
  fill(100, 150, 255); // Color sólido
  stroke(255);
  dibujarFuncion();

  // Dibujamos ejes
  stroke(255, 0, 0);
  line(0, 0, 0, 2000, 0, 0);
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 2000, 0);
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, 2000);
}

void dibujarFuncion() {
  float x, y;
  int i = 0, j = 0;
  float in_steps = 1.0 / steps;

  float[][] matriz = new float[steps+1][steps+1];

  for (y = 0.0, j = 0; y <= 1.0; y += in_steps, j++)
    for (x = 0.0, i = 0; x <= 1.0; x += in_steps, i++)
      matriz[i][j] = funcion(x, y);

  for (j = 0, y = 0.0; j < steps; j++, y += in_steps) {
    beginShape(QUAD_STRIP);
    for (i = 0, x = 0.0; i <= steps; i++, x += in_steps) {
      vertex(x, y, matriz[i][j]);
      vertex(x, y + in_steps, matriz[i][j+1]);
    }
    endShape();
  }
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
