float ang; // Ángulo de rotación para las esferas

void setup() {
  size(800, 400, P3D); // Crear una ventana en 3D
  ang = 0;             // Inicializar el ángulo
  noStroke();          // Sin bordes en las esferas
  sphereDetail(60);    // Nivel de detalle de las esferas
}

void draw() {
  background(200); // Fondo claro

  // Configurar la iluminación
  if (mousePressed) {
    // Calcular la intensidad de la luz ambiental roja según la posición del ratón
    float val = (float) mouseX / (float) width * 255;
    ambientLight((int) val, 0, 0); // Luz ambiental rojiza

    // Configurar la luz direccional verde que viene desde un lateral
    directionalLight(50, 200, 50, -1, 0, 0); // Luz direccional con componente verde

    // Configurar la luz puntual con la posición y dirección de la luz basadas en el puntero
    spotLight(204, 153, 0, mouseX, mouseY, 500, 0, 0, -1, PI / 2, 600);
  } else {
    lights(); // Iluminación por defecto
  }

  // Dibujo de esferas
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

  // Incrementar el ángulo para una rotación mínima
  ang += 1;
  if (ang > 360) ang = 0; // Reiniciar el ángulo después de un ciclo completo
}
