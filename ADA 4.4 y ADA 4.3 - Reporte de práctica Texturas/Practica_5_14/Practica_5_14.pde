import processing.video.*;

Capture cam;

void setup() {
  size(800, 800, P3D);
  // Inicializa la cámara con la resolución deseada
  cam = new Capture(this, 640, 480);
  cam.start();
}

void draw() {
  if (cam.available()) {
    background(0);
    cam.read(); // Lee la imagen de la cámara
    
    // Configura la transformación y la rotación
    translate(width / 2, height / 2);
    rotateX(radians(mouseX / 2));
    rotateY(radians(mouseY / 2));
    
    // Configura el modo de textura
    textureMode(NORMAL);
    beginShape();
    texture(cam);
    
    // Define los vértices con coordenadas de textura
    vertex(-200, -200, 0, 0, 0);
    vertex(200, -200, 0, 1, 0);
    vertex(200, 200, 0, 1, 1);
    vertex(-200, 200, 0, 0, 1);
    
    endShape();
  }
}
