float ang; // Ángulo de rotación para las esferas

void setup() {
  size(800, 400, P3D); // Crear una ventana en 3D
  ang = 0;             // Inicializar el ángulo
  noStroke();          // Sin bordes en las esferas
  sphereDetail(60);    // Detalle de las esferas
}

void draw() {
  background(200); // Fondo claro

  // Activar iluminación si se presiona el ratón
  if (mousePressed) {
    lights();
  } else {
    noLights();
  }

  // Dibujo de objetos
  // Primera esfera
  pushMatrix();
  translate(width / 4, height / 2, 0); // Posición de la primera esfera
  rotateX(radians(-30));              // Rotación en X
  rotateY(radians(ang));              // Rotación en Y
  sphere(75);                         // Dibujar la esfera
  popMatrix();

  // Segunda esfera
  pushMatrix();
  translate(width / 2, height / 2, 0); // Posición de la segunda esfera
  rotateX(radians(-30));              // Rotación en X
  rotateY(radians(ang));              // Rotación en Y
  sphere(75);                         // Dibujar la esfera
  popMatrix();

  // Tercera esfera
  pushMatrix();
  translate(3 * width / 4, height / 2, 0); // Posición de la tercera esfera
  rotateX(radians(-30));                   // Rotación en X
  rotateY(radians(ang));                   // Rotación en Y
  sphere(75);                              // Dibujar la esfera
  popMatrix();

  // Incrementar el ángulo para la rotación continua
  ang += 1;
}
