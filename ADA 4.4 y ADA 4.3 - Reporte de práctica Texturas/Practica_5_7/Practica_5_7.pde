float ang; // Ángulo de rotación para las esferas

void setup() {
  size(800, 400, P3D); // Crear una ventana en 3D
  ang = 0;             // Inicializar el ángulo de rotación
  noStroke();          // Sin bordes en las esferas
  sphereDetail(60);    // Nivel de detalle de las esferas
}

void draw() {
  background(200); // Fondo claro

  // Configurar la iluminación
  if (mousePressed) {
    // Configurar la luz ambiental y una fuente de luz direccional
    float val = (float) mouseX / (float) width * 255;
    ambientLight((int) val, 0, 0); // Luz ambiental de color rojo
    directionalLight(50, 200, 50, -1, 0, 0); // Luz direccional con componente verde

    // Configurar la luz puntual en la posición del ratón
    pointLight(204, 153, 0, mouseX, mouseY, 400); // Luz amarilla en la posición del ratón
  } else {
    lights(); // Iluminación por defecto si el ratón no está presionado
  }

  // Dibujar las esferas
  pushMatrix();
  translate(width / 4, height / 2, 0); // Posición de la primera esfera
  rotateX(radians(-30));              // Rotación en X
  rotateY(radians(ang));              // Rotación en Y
  sphere(75);                         // Dibujar la esfera
  popMatrix();

  pushMatrix();
  translate(width / 2, height / 2, 0); // Posición de la segunda esfera
  rotateX(radians(-30));              // Rotación en X
  rotateY(radians(ang));              // Rotación en Y
  sphere(75);                         // Dibujar la esfera
  popMatrix();

  pushMatrix();
  translate(3 * width / 4, height / 2, 0); // Posición de la tercera esfera
  rotateX(radians(-30));                   // Rotación en X
  rotateY(radians(ang));                   // Rotación en Y
  sphere(75);                              // Dibujar la esfera
  popMatrix();

  ang += 1; // Incrementar el ángulo para la rotación
  if (ang > 360) ang = 0; // Resetear el ángulo si supera 360 grados
}
