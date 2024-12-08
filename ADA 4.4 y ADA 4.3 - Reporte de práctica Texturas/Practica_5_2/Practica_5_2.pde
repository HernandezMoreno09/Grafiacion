float rotateX = 0; // Rotación en el eje X
float rotateY = 0; // Rotación en el eje Y
float previousMouseX, previousMouseY; // Posición previa del ratón

void setup() {
  size(800, 800, P3D); // Ventana en 3D
  fill(204);           // Color de relleno de la esfera
  sphereDetail(60);    // Detalle de la esfera
}

void draw() {
  background(128);                  // Fondo gris
  lights();                         // Iluminación básica
  translate(width / 2, height / 2); // Centrar la esfera en la ventana

  // Aplicar rotación interactiva
  rotateX(rotateX);
  rotateY(rotateY);
  
  sphere(250); // Dibujar la esfera
}

void mouseDragged() {
  // Ajustar ángulos de rotación según el movimiento del ratón
  float deltaX = mouseX - previousMouseX;
  float deltaY = mouseY - previousMouseY;
  
  rotateX += radians(deltaY) * 0.5; // Cambiar rotación en X (arriba/abajo)
  rotateY += radians(deltaX) * 0.5; // Cambiar rotación en Y (izquierda/derecha)

  // Actualizar la posición previa del ratón
  previousMouseX = mouseX;
  previousMouseY = mouseY;
}

void mousePressed() {
  // Al presionar el botón del ratón, guardar la posición inicial
  previousMouseX = mouseX;
  previousMouseY = mouseY;
}
