float angleX = 0; // Ángulo de rotación en el eje X
float angleY = 0; // Ángulo de rotación en el eje Y
boolean lightingActive = false; // Estado de la iluminación

void setup() {
  size(800, 800, P3D); // Ventana en 3D
}

void draw() {
  background(30); // Fondo oscuro
  translate(width / 2, height / 2, 0); // Centrar el cubo en la pantalla

  // Configurar la luz si está activa
  if (lightingActive) {
    lights(); // Habilitar luces generales
    directionalLight(255, 255, 255, -1, -1, -1); // Luz desde la esquina superior izquierda
  } else {
    noLights(); // Desactivar iluminación
    fill(150, 100, 200); // Color de relleno cuando no hay iluminación
  }

  stroke(255); // Bordes blancos del cubo
  rotateX(angleX);
  rotateY(angleY);
  box(200); // Dibujar el cubo

  // Incrementar los ángulos para rotación continua
  angleX += 0.01;
  angleY += 0.01;
}

void mousePressed() {
  lightingActive = true; // Activar iluminación al presionar el ratón
}

void mouseReleased() {
  lightingActive = false; // Desactivar iluminación al soltar el ratón
}
