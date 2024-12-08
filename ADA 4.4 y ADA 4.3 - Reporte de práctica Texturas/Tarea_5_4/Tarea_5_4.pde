import peasy.*; // Biblioteca para movimiento de cámara
import processing.video.*;

PImage floorTexture, sphereTexture;
PeasyCam cam;

void setup() {
  size(800, 800, P3D);
  
  // Configuración de cámara interactiva
  cam = new PeasyCam(this, 500);

  // Cargar texturas
  floorTexture = loadImage("piso.jpg"); // Reemplazar con un archivo de textura
  sphereTexture = loadImage("esfera.jpg"); // Reemplazar con un archivo de textura
  
  noStroke();
}

void draw() {
  background(50);

  // Configurar luces
  ambientLight(100, 100, 100); // Luz ambiental
  directionalLight(200, 200, 200, 1, 1, -1); // Luz direccional
  pointLight(255, 0, 0, mouseX, mouseY, 200); // Luz puntual que sigue el mouse
  
  // Piso texturizado
  pushMatrix();
  translate(0, 300, 0);
  rotateX(HALF_PI);
  textureMode(NORMAL);
  beginShape();
  texture(floorTexture);
  vertex(-400, -400, 0, 0, 0);
  vertex(400, -400, 0, 1, 0);
  vertex(400, 400, 0, 1, 1);
  vertex(-400, 400, 0, 0, 1);
  endShape(CLOSE);
  popMatrix();
  
  // Esfera texturizada
  pushMatrix();
  translate(-150, 100, 0);
  textureMode(NORMAL);
  texture(sphereTexture);
  sphere(100);
  popMatrix();
  
  // Cubo iluminado
  pushMatrix();
  translate(150, 100, 0);
  rotateY(frameCount * 0.02); // Rotación animada
  ambient(50, 50, 200); // Color de iluminación ambiental
  specular(255, 255, 255); // Color especular
  shininess(50); // Brillo
  box(100);
  popMatrix();
}
